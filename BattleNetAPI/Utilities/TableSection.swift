//
//  TableSection.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public protocol TableSection {
    associatedtype SectionTypeEnum: Equatable
    
    var type: SectionTypeEnum { get }
    var rows: [Any] { get set }
    
    
    func getTitle(forSection: Int) -> String
    func getTitle(forRowAt indexPath: IndexPath) -> String
}



extension Array where Element: TableSection {
    /// Returns the first TableSection in the array that matches the type
    /// - note: The TableSection array is expected to have unique types, that's why it only returns one section
    public func getSection(for type: Element.SectionTypeEnum) -> Element? {
        return self.first { $0.type == type }
    }
    
    
    /// Gets the title of the TableSection at that index
    public func getTitle(forSectionAt section: Int) -> String {
        return self[section].getTitle(forSection: section)
    }
    
    
    /// Uses the indexPath to get the specific item of the TableSection's rows
    public func getRow(at indexPath: IndexPath) -> Any {
        return self[indexPath.section].rows[indexPath.row]
    }
    
    
    /// Uses the indexPath to get the specific title of the TableSection's row
    public func getTitle(forRowAt indexPath: IndexPath) -> String {
        return self[indexPath.section].getTitle(forRowAt: indexPath)
    }
    
    
    /**
     Removes and returns the element at the specified position
     
     - parameter indexPath: The indexPath specifying row to remove
     - parameter shouldRemoveEmptySection: Determines if the section should be removed from the array if its rows are empty
     - returns: The item being removed
     */
    public mutating func removeRow(at indexPath: IndexPath, shouldRemoveEmptySection: Bool = false) -> Any {
        var rows = self[indexPath.section].rows
        let item = rows.remove(at: indexPath.row)
        
        if shouldRemoveEmptySection && rows.isEmpty {
            self.remove(at: indexPath.section)
        }
        else {
            self[indexPath.section].rows = rows
        }
        
        return item
    }
    
    
    /**
     Removes and inserts an item from the source indexPath to the destination
     - parameter sourceIndexPath: An index path locating the row to be moved in the array
     - parameter destinationIndexPath: An index path locating the row in the array that is the destination of the move
     - parameter maintainHomogeneousRowTypes: Enforces items in rows must have the same type
     - note: If a section already has different types in its rows, maintainHomogeneousRowTypes is ignored for that section.
     */
    public mutating func moveRow(at sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath, maintainHomogeneousRowTypes: Bool = false) {
        let sourceItem = self[sourceIndexPath.section].rows[sourceIndexPath.row]
        
        if maintainHomogeneousRowTypes &&
            sourceIndexPath.section != destinationIndexPath.section {
            let destinationRows = self[destinationIndexPath.section].rows
            let destinationRowTypes = Set(destinationRows.map { object_getClassName($0) })
            
            if destinationRowTypes.count > 1 {
                return
            }
            else if let first = destinationRows.first,
                object_getClassName(sourceItem) != object_getClassName(first) {
                return
            }
        }
        
        self[sourceIndexPath.section].rows.remove(at: sourceIndexPath.row)
        self[destinationIndexPath.section].rows.insert(sourceItem, at: destinationIndexPath.row)
    }
}
