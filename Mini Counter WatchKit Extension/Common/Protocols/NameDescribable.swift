//
//  NameDescribable.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 12.11.2021.
//

// Taken from this SO answer: https://stackoverflow.com/a/39993120/10876104
protocol NameDescribable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDescribable {
    var typeName: String {
        String(describing: type(of: self))
    }

    static var typeName: String {
        String(describing: self)
    }
}
