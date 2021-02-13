//
//  Stylist.swift
//  iOStyleLibrary
//
//  Created by Yuriy Savitskiy on 2/12/21.
//

import Foundation

public struct Stylist<T> : IStylist {
    public let source: T
    
    @discardableResult
    public static func +(lhs: Stylist<T>, rhs: Stylist<T>) -> Stylist<T> {
        return lhs
    }
    
    
    /*@discardableResult
    static func +<T:ITheme>(lhs: Stylist<T>, rhs: Stylist<T>) -> Stylist<T> {
        //lhs.
        style.apply(to: stylist.source)
        return stylist
    }*/
    
    /*
    @discardableResult
    static func +<T:ITheme>(stylist: Stylist<T>, style: ThemeStyle<T>) -> Stylist<T> {
        style.apply(to: stylist.source)
        return stylist
    }*/
    
    
    /*static func +<T:UILabel>(lhs: Stylist<T>, rhs: Stylist<T>) -> Stylist<T> {
        return lhs
    /*ThemeStyleAction<T> {
        { (source: T) -> () in
            lhs(source)
            rhs(source)
        }*/
    }*/
}




