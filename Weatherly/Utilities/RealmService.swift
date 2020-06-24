//
//  RealmService.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 24/06/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    private init() {}
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }
}
