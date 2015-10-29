//
//  StringExtension.swift
//  CocoaExtensions
//
//  Created by Razvan Benga on 10/29/15.
//  Copyright © 2015 Promptus. All rights reserved.
//

import Foundation

extension String {
    
    func ce_filter(predicate: Character -> Bool) -> String {
        var result = String()
        for character in self.characters {
            if predicate(character) {
                result.append(character)
            }
        }
        return result
    }
    
}