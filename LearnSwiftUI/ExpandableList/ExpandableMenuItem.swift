//
//  ExpandableMenuItem.swift
//  LearnSwiftUI
//
//  Created by majunwen on 2025/2/8.
//
import Foundation

struct ExpandableMenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [ExpandableMenuItem]?
}

// Main menu items
let sampleMenuItems = [ ExpandableMenuItem(name: "Espresso Machines", image: "linea-mini", subMenuItems: espressoMachineMenuItems),
                        ExpandableMenuItem(name: "Grinders", image: "swift-mini", subMenuItems: grinderMenuItems),
                        ExpandableMenuItem(name: "Other Equipment", image: "espresso-ep", subMenuItems: otherMenuItems) ]

// Sub-menu items for Espressco Machines
let espressoMachineMenuItems = [ ExpandableMenuItem(name: "Leva", image: "leva-x", subMenuItems: [ ExpandableMenuItem(name: "Leva X", image: "leva-x"), ExpandableMenuItem(name: "Leva S", image: "leva-s") ]), ExpandableMenuItem(name: "Strada", image: "strada-ep", subMenuItems: [ ExpandableMenuItem(name: "Strada EP", image: "strada-ep"), ExpandableMenuItem(name: "Strada AV", image: "strada-av"), ExpandableMenuItem(name: "Strada MP", image: "strada-mp"), ExpandableMenuItem(name: "Strada EE", image: "strada-ee") ]), ExpandableMenuItem(name: "KB90", image: "kb90"), ExpandableMenuItem(name: "Linea", image: "linea-pb-x", subMenuItems: [ ExpandableMenuItem(name: "Linea PB X", image: "linea-pb-x"), ExpandableMenuItem(name: "Linea PB", image: "linea-pb"), ExpandableMenuItem(name: "Linea Classic", image: "linea-classic") ]), ExpandableMenuItem(name: "GB5", image: "gb5"), ExpandableMenuItem(name: "Home", image: "gs3", subMenuItems: [ ExpandableMenuItem(name: "GS3", image: "gs3"), ExpandableMenuItem(name: "Linea Mini", image: "linea-mini") ]) ]

// Sub-menu items for Grinder
let grinderMenuItems = [ ExpandableMenuItem(name: "Swift", image: "swift"),
                         ExpandableMenuItem(name: "Vulcano", image: "vulcano"),
                         ExpandableMenuItem(name: "Swift Mini", image: "swift-mini"),
                         ExpandableMenuItem(name: "Lux D", image: "lux-d") ]

// Sub-menu items for other equipment
let otherMenuItems = [ ExpandableMenuItem(name: "Espresso AV", image: "espresso-av"),
                         ExpandableMenuItem(name: "Espresso EP", image: "espresso-ep"),
                         ExpandableMenuItem(name: "Pour Over", image: "pourover"),
                         ExpandableMenuItem(name: "Steam", image: "steam") ]
