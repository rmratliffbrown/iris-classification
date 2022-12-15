//
//  IrisView.swift
//  IrisClassification
//
//  Created by Rashaad Ratliff-Brown on 12/14/22.
//

import SwiftUI
import CoreML

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

struct IrisView: View {
    @State private var sepal_length: Double = 0.0
    @State private var sepal_width: Double = 0.0
    @State private var pedal_length: Double  = 0.0
    @State private var pedal_width: Double = 0.0
    @State private var prediction = ""
    
    let predict = classify()!.class_
    
    var body: some View {
        
        VStack{
            VStack{
                Text("No Prediction")
                
                
                
            }
            
            Form {
                
                Section(header: Text("Sepal Length")){
                    TextField("Enter a sepal length", value: $sepal_length, format: .number.precision(.significantDigits(2)))
                        .keyboardType(.decimalPad)
                    
                    
                }
                
                Section(header: Text("Sepal Width")){
                    TextField("Enter a sepal width", value: $sepal_width, format: .number.precision(.significantDigits(2)))
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Pedal Length")){
                    TextField("Enter a sepal width", value: $pedal_length, format: .number.precision(.significantDigits(2)))
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Pedal Width")){
                    TextField("Enter a sepal width", value: $pedal_width, format: .number.precision(.significantDigits(2)))
                        .keyboardType(.decimalPad)
                }
                
            }
            
            
            Button("Predict") {
                classify()
            }
        }
        
    }
}

struct IrisView_Previews: PreviewProvider {
    static var previews: some View {
        IrisView()
    }
}
