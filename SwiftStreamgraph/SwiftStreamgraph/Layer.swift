//
//  Layer.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//
import Foundation

class Layer {
    var name:String
    var size:[Double]!
    var yBottom = [Double]()
    var yTop = [Double]()
    var rbg:UIColor!
    var onset:Int!
    var end:Int!
    var sum:Double = 0.0
    var volatility:Double = 0.0
    
    init(name:String, size:[Double]) {
        for i in 0..<size.count {
            if(size[i] < 0){
                // FIXME: need to raise here
                //NSException.raise(NSExceptionName(rawValue: "No negative sizes allowed."));
            }
        }
        
        self.name = name
        self.size = size
        self.yBottom = [Double]()
        // ???: isn't there another way in Swift to initialize an array of specific size with a default value?
        for _ in 0..<size.count {
            self.yBottom.append(0.0)
        }
        
        self.yTop = [Double]()
        for _ in 0..<size.count {
            self.yTop.append(0.0)
        }
        
        self.sum = 0
        self.volatility = 0
        self.onset = -1
        
        self.rbg = UIColor.white
        
        for i in 0..<size.count {
            self.sum +=  size[i]
            
            // onset is the first non-zero point
            // end is the last non-zero point
            if(size[i] > 0){
                if (self.onset == -1) {
                    self.onset = i
                } else {
                    self.end = i
                }

            }
            
            // volatility is the maximum change between any two consecutive points
            if (i > 0) {
                let val = size[i]
                let prev = size[i-1]
                self.volatility = max(self.volatility, val - prev)
            }
        
        }
    }
    
}
