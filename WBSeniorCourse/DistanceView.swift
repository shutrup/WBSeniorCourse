//
//  DistanceView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 20.07.2024.
//

import SwiftUI

struct DistanceView: View {
    @EnvironmentObject var localizationService: LocalizationService
    
    let meters = 1000.0
    
    var body: some View {
        VStack {
            Text("\(NSLocalizedString("distance", comment: ""))")
            Text("\(NSLocalizedString("meters", comment: "")): \(meters) m")
            Text("\(NSLocalizedString("kilometers", comment: "")): \(convertDistance(meters: meters, to: .kilometers))")
            Text("\(NSLocalizedString("miles", comment: "")): \(convertDistance(meters: meters, to: .miles))")
        }
    }
    
    func convertDistance(meters: Double, to unit: UnitLength) -> String {
        let measurement = Measurement(value: meters, unit: UnitLength.meters)
        let convertedMeasurement = measurement.converted(to: unit)
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.locale = Locale.current
        return formatter.string(from: convertedMeasurement)
    }
}
