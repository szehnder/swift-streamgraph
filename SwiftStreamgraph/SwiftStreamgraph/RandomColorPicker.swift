//
//  RandomColorPicker.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

func lerp(_ a:Double, _ b:Double, _ amt:Double) -> Double { return (b - a) * amt + a }


protocol ColorPicker {
    func colorize(layers:[Layer])
    var name:String{ get }
}

class RandomColorPicker:ColorPicker {
    var name:String {
        return "Random Colors"
    }
    
    func colorize(layers:[Layer]) {
        for i in 0..<layers.count {
            let h = CGFloat(lerp(0.6, 0.65, Double(arc4random())))
            let s = CGFloat(lerp(0.2, 0.25, Double(arc4random())))
            let b = CGFloat(lerp(0.4, 0.95, Double(arc4random())))
            layers[i].rbg = UIColor(hue: h, saturation: s, brightness: b, alpha: 1.0)
        }
    }
}
