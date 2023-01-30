//
//  Router.swift
//  drone
//
//  Created by raulbot on 30/1/23.
//

import SwiftUI

protocol Router {
    associatedtype T: View
    associatedtype Q: Dependecies

    @ViewBuilder
    func destination(_ dependencies: Q) -> T
}

protocol Dependecies {
//    var route: Route { get set }
}

//extension Router {
//  var dependencies: Dependencies {
//    Dependencies.shared
//  }
//}
