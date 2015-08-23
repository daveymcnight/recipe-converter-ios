//
//  BeerType.swift
//  Tap Room Framework
//
//  Created by Davey McNight on 8/19/15.
//  Copyright (c) 2015 DM. All rights reserved.
//

import Foundation

class BeerType : NSObject {
   
    var id: Int?;
    var name: String?;
    
    init (id: Int, name: String){
        self.id = id;
        self.name = name;
    }

    
}