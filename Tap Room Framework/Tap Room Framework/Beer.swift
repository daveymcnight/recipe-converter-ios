//
//  Beer.swift
//  Tap Room Framework
//
//  Created by Davey McNight on 8/19/15.
//  Copyright (c) 2015 DM. All rights reserved.
//

import Foundation


class Beer : NSObject{

    var id : Int?;
    var beerType : BeerType?;
    var brewery: Brewery?;
    var name: String!;
    var desc: String?;
    var pricePint: Float?;
    var price32: Float?;
    var price64: Float?;
    var active: Bool?;
    var url: String?;

    init(id: Int, beerType: BeerType, brewery: Brewery, name: String, desc: String, pricePint : Float, price32 : Float, price64:Float, active:Bool, url:String) {
        
        self.id = id;
        self.beerType = beerType;
        self.brewery = brewery;
        self.name = name;
        self.desc = desc;
        self.pricePint = pricePint;
        self.price32 = price32;
        self.price64 = price64;
        self.active = active;
        self.url = url;
        
    }
    
    init(id: Int, name: String, desc: String, pricePint : Float, price32 : Float, price64:Float, active:Bool, url:String) {
        
        self.id = id;
        self.name = name;
        self.desc = desc;
        self.pricePint = pricePint;
        self.price32 = price32;
        self.price64 = price64;
        self.active = active;
        self.url = url;
        
    }

    
}


