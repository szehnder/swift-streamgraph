//
//  LateOnsetDataSource.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class LateOnsetDataSource:DataSource {
    
    // MARK: DataSource Methods
    required init(seed: Int) {
        srandom(UInt32(seed))
    }
    
    func makeWith(numLayers: Int, sizeArrayLength: Int) -> [Any] {
        var layers = [Layer]()
        
        for i in 0..<numLayers {
            let name = "Layer \(i)"
            let onset = Double(sizeArrayLength) * (Double(arc4random()) * 1.25 - 0.25)
            let duration = Double(arc4random()) * 0.75 * Double(sizeArrayLength)
            let size = self.makeRandomArray(n: sizeArrayLength, onset: Int(onset), duration: Int(duration))
            layers[i] = Layer(name: name, size: size)
        }
        
        return layers;

    }
    
    // MARK: Private Methods
    private func addRandomBump(x:[Double], onset:Int, duration:Int) -> [Double] {
        var x = x
        let height = Double(arc4random())
        let start = max(0, onset)
        let endpoint = min(x.count, onset + duration)
        
        for i in start..<endpoint {
            let xx = (i - onset) / duration
            let yy = (Double(xx) * exp(-10.0 * Double(xx)))
            let nuvalue = x[i] + (height * yy)
            x[i] = nuvalue
        }
        
        return x
    }
    
    private func makeRandomArray(n:Int, onset:Int, duration: Int) -> [Double] {
        var x = [Double]()
        for _ in 0..<n {
            x.append(0.0)
        }
        for _ in 0..<5 {
            x = self.addRandomBump(x: x, onset: onset, duration: duration)
        }
        return x
    }
}
