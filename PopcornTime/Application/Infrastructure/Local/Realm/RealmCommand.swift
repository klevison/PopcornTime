//
//  RealmCommand.swift
//  viper
//
//  Created by Klevison Matias on 9/17/15.
//  Copyright (c) 2015 Klevison Matias. All rights reserved.
//

//import RealmSwift
//
//class RealmCommand {
//    
//    private static func findBy<T: Object>(field: String, value: String) -> T? {
//        let collection = Realm().objects(T).filter("\(field) = '\(value)'").toArray(T) as [T]
//        if collection.count > 0 {
//            return collection[0]
//        }
//        
//        return nil
//    }
//    
//    static func getById<T: Object>(id: Int) -> T? {
//        return RealmCommand.findBy(field: "id", value: "\(id)")
//    }
//    
//    static func getByGuid<T: Object>(guid: Int) -> T? {
//        return RealmCommand.findBy(field: "guid", value: "\(guid)")
//    }
//    
//    static func getAll<T: Object>() -> [T] {
//        return Realm().objects(T).toArray(T) as [T]
//    }
//    
//    static func saveAll<T: Object>(collection: [T]) {
//        let realm = Realm()
//        realm.write {
//            realm.add(collection, update: true)
//        }
//    }
//    
//    static func save<T: Object>(object: T) {
//        let realm = Realm()
//        realm.write {
//            realm.add(object, update: true)
//        }
//    }
//    
//    static func mergeAll<T: Object>(collection: [T]) {
//        let realm = Realm()
//        realm.write {
//            realm.deleteAll()
//            realm.add(collection)
//        }
//    }
    
//}
