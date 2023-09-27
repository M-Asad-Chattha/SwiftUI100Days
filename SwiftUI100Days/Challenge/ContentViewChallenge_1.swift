//
//  ContentViewChallenge_1.swift
//  SwiftUI100Days
//
//  Created by Muhammad Asad Chattha on 03/09/2023.
//

import SwiftUI

struct ContentViewChallenge_1: View {
    @State private var distanceInput = 0.0
    @State private var selectedInputUnit: DistanceUnits = .meters
    @State private var selectedOutputUnit: DistanceUnits = .meters
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Input Unit", selection: $selectedInputUnit) {
                    ForEach(DistanceUnits.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                TextField("Enter distance", value: $distanceInput, format: .number)
                
                Section("Output") {
                    Picker("Convertion Units", selection: $selectedOutputUnit) {
                        ForEach(DistanceUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                Text(finalDistance, format: .number)
            }
        }
    }

}

// MARK: - Helper Properties
extension ContentViewChallenge_1 {
    var finalDistance: Double {
        var meters = 0.0
        switch selectedInputUnit {
        case .meters:
            meters = distanceInput
        case .kilometers:
            meters = distanceInput * 1000.0
        case .feet:
            meters = distanceInput * 0.3048
        case .yard:
            meters = distanceInput * 0.9144
        case .miles:
            let metersPerMile = 1609.34
            meters = distanceInput * metersPerMile
        }
        
        let measurement = Measurement(value: meters, unit: UnitLength.meters)
        switch selectedOutputUnit {
        case .meters:
            return distanceInput
        case .kilometers:
            return measurement.converted(to: .kilometers).value
        case .feet:
            return measurement.converted(to: .feet).value
        case .yard:
            return measurement.converted(to: .yards).value
        case .miles:
            return measurement.converted(to: .miles).value
        }
    }
}

#Preview {
    ContentViewChallenge_1()
}

// MARK: - enum
enum DistanceUnits: String, CaseIterable {
    case meters, kilometers, feet, yard, miles
}
