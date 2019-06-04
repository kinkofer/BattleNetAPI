//
//  Shared.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


extension SelfLink: Viewable {
    var cell: CellContents {
        return CellContents(title: "_links", subtitle: link.href, type: .object(self))
    }
}


extension Link: Viewable {
    var cell: CellContents {
        return CellContents(title: "link", subtitle: href, type: .object(self))
    }
}


extension KeyLink: Viewable {
    var cell: CellContents {
        return CellContents(title: "link", subtitle: name ?? key.href, type: .object(self))
    }
}


extension MediaLink: Viewable {
    var cell: CellContents {
        return CellContents(title: "media", subtitle: key.href, type: .object(self))
    }
}



extension LocaleString: Viewable {
    var cell: CellContents {
        var subtitle = ""
        let mirror = Mirror(reflecting: self)
        if let child = mirror.children.first(where: {
            if case Optional<Any>.some(_) = $0.value { return true }
            else { return false } }) {
            subtitle = String(describing: child.value)
        }
        return CellContents(title: "locale", subtitle: subtitle)
    }
}
