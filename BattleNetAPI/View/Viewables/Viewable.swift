//
//  Viewable.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


protocol Viewable: class {
    /// The contents of the cell when it's contained within another object
    var cell: CellContents { get }
    /// The contents of the cells when viewing the object
    var cells: [CellContents] { get }
}

extension Viewable {
    var cells: [CellContents] {
        let mirror = Mirror(reflecting: self)
        return mirror.children.compactMap {
            if let viewable = $0.value as? Viewable {
                return viewable.cell
            }
            
            guard let label = $0.label else { return nil }
            
            var type: ViewableType?
            var value = $0.value
            
            if let array = value as? [Viewable] {
                value = "\(String(array.count)) Total"
                type = .array(array)
            }
            else if let rawRepresentable = value as? StringRawRepresentable {
                value = rawRepresentable.stringRawValue
            }
            else if let rawRepresentables = value as? [StringRawRepresentable] {
                let values = rawRepresentables.map { $0.stringRawValue }
                value = String(format: "[%@]", values.joined(separator: ", "))
            }
            else if let dictionary = value as? [String: Viewable] {
                var values = [String]()
                dictionary.forEach { k, v in
                    values.append("\(k): \(v.cell.subtitle)")
                }
                value = String(format: "[%@]", values.joined(separator: ", "))
            }
            else if case Optional<Any>.some(let wrapped) = value {
                value = wrapped
            }
            else if case Optional<Any>.none = value {
                return nil
            }
            return CellContents(title: label, subtitle: String(describing: value), type: type)
        }
    }
}


struct CellContents {
    let title: String
    let subtitle: String
    let type: ViewableType?
    
    
    init(title: String, subtitle: String, type: ViewableType? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
    
    
    init(viewable: Viewable) {
        self.title = viewable.cell.title
        self.subtitle = viewable.cell.subtitle
        self.type = .object(viewable)
    }
}


/// The type used to determine how the value can be viewed. If the ViewableType is nil, only the key and value will be displayed.
enum ViewableType {
    /// An object, where all properties can be displayed with key-value pairs.
    case object(Viewable)
    /// An array of objects, where each object is listed separately for viewing.
    case array([Viewable])
    /// A link that can be called to retrieve the underlying Resource.
    /// - note: Would only work if the Resource is known at compile time.
//    case link(Link<Resource>)
}



protocol StringRawRepresentable {
    var stringRawValue: String { get }
}

extension StringRawRepresentable where Self: RawRepresentable, Self.RawValue == String {
    var stringRawValue: String {
        return rawValue
    }
}
