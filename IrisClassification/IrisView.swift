//
//  IrisView.swift
//  IrisClassification
//
//  Created by Rashaad Ratliff-Brown on 12/14/22.
//

import SwiftUI
import CoreML



struct IrisView: View {
    @State private var sepal_length: Double = 0.0
    @State private var sepal_width: Double = 0.0
    @State private var pedal_length: Double  = 0.0
    @State private var pedal_width: Double = 0.0
    @State private var togglePrediction = false
    
    let predict = classify()!.class_
    
    var body: some View {
        NavigationView{
            
            
            
            VStack{
                
                if !togglePrediction {
                    ZStack {
                        Image("setosa")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(2, contentMode: .fill)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                            .padding()
                    }
                }
                
                // SEPAL LENGTH
                
                Text("Sepal Length: \(sepal_length, specifier: "%.1f")")
                
                Slider(value: $sepal_length, in: 0.0...8.0).padding()
                
                // SEPAL WIDTH
                
                Text("Sepal Width: \(sepal_width, specifier: "%.1f")")
                
                Slider(value: $sepal_width, in: 0.0...8.0).padding()
                
                // PEDAL LENGTH
                
                Text("Pedal Length: \(pedal_length, specifier: "%.1f")")
                
                Slider(value: $pedal_length, in: 0.0...8.0).padding()
                
                // PEDAL WIDTH
                
                Text("Pedal Width: \(pedal_width, specifier: "%.1f")")
                
                Slider(value: $pedal_width, in: 0.0...8.0).padding()
                
                Button("Predict") {
                    classify()
                    togglePrediction.toggle()
                }.padding()
                
                
            }.navigationTitle("Iris Classification")
                .navigationBarTitleDisplayMode(.inline)
                .padding()
            
        }
    }
}

struct IrisView_Previews: PreviewProvider {
    static var previews: some View {
        IrisView()
    }
}

func classify() -> IrisClassifierOutput? {
    
    do {
        
        let config = MLModelConfiguration()
        
        let model = try IrisClassifier(configuration: config)
        
        let prediction = try model.prediction(sepal_length: 7.0, sepal_width: 3.2, pedal_length: 4.7, pedal_width: 0.2)
        
        return prediction
        
    } catch {
        
    }
    
    return nil
}
