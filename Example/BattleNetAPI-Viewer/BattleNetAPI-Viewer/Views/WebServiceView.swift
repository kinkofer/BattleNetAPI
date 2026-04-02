//
//  WebServiceView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/10/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct WebServiceSelection<API: RawRepresentable & Hashable>: Hashable where API.RawValue == String {
    let api: API
    let data: Data
}


struct WebServiceView: View {
    var title: String
    var data: Data
    
    @State private var text: String = ""
    @State private var isExportingFile = false
    
    
    
    // MARK: - Views
    
    var body: some View {
        TextEditor(text: $text)
            .navigationTitle(Text(title))
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        isExportingFile = true
                    } label: {
                        Label("Save", systemImage: "square.and.arrow.down")
                    }
                    .disabled(text.isEmpty)
                }
            }
            .fileExporter(
                isPresented: $isExportingFile,
                document: TextFileDocument(text: text),
                contentType: .json,
                defaultFilename: title
            ) { result in
                if case .failure(let error) = result {
                    print("Export failed: \(error.localizedDescription)")
                }
            }
            .onAppear {
                text = (try? data.jsonPrettyPrinted()) ?? "The response could not be parsed, please try again."
            }
            .onChange(of: data) {
                text = (try? data.jsonPrettyPrinted()) ?? "The response could not be parsed, please try again."
            }
            .onDisappear {
                text = ""
            }
    }
}



// MARK: - TextFileDocument

struct TextFileDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.json] }
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}



// MARK: - WebServiceRow

struct WebServiceRow<API: RawRepresentable & Hashable>: View where API.RawValue == String {
    let api: API
    var isOperational: Bool = true
    @Binding var loadingAPI: API?
    let webService: () async throws -> Data
    let onSuccess: (Data) -> Void
    let onError: (Error) -> Void
    
    var body: some View {
        Button {
            loadingAPI = api
            Task {
                do {
                    let data = try await webService()
                    onSuccess(data)
                } catch {
                    onError(error)
                }
                loadingAPI = nil
            }
        } label: {
            HStack {
                if !isOperational {
                    Image(systemName: "exclamationmark.triangle")
                }
                Text(api.rawValue)
                if loadingAPI == api {
                    Spacer()
                    ProgressView()
                }
            }
        }
        .buttonStyle(.plain)
        .disabled(loadingAPI != nil)
    }
}



// MARK: - API List Style

extension View {
    func apiListStyle() -> some View {
        #if os(macOS)
        self.listStyle(.inset(alternatesRowBackgrounds: true))
        #else
        self.listStyle(.insetGrouped)
        #endif
    }
}



// MARK: - Preview

#Preview {
    let data = "Test web service response string".data(using: .utf8)!
    NavigationStack {
        WebServiceView(title: "Test Web Service", data: data)
    }
}
