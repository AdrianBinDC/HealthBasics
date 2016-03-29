//
//  GSHealthKitManager.swift
//  HealthBasics
//
//  Created by Adrian Bolinger on 3/28/16.
//  Copyright © 2016 Adrian Bolinger. All rights reserved.
//

import UIKit
import HealthKit

class GSHealthKitManager: NSObject {
    static let sharedManager = GSHealthKitManager() // Substantially shorter than Objective-C
    
    let healthStore = HKHealthStore()
    
    func requestAuthorization() {
        // TODO: fill in
    }
    
    func readBirthDate() -> NSDate? {
        var dateOfBirth: NSDate?
        
        do {
            dateOfBirth = try self.healthStore.dateOfBirth()
        } catch {
            print(error)
        }
        
        return dateOfBirth
    }
    
    func writeWeightSample(weight: Double) {
        // TODO: implement
        let kilogramUnit = HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Kilo)
        let weightQuantity = HKQuantity(unit: kilogramUnit, doubleValue: weight)
        
        let weightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        let now = NSDate()
        
        let weightSample = HKQuantitySample(type: weightType!, quantity: weightQuantity, startDate: now, endDate: now)
        
        self.healthStore.saveObject(weightSample) { (success, error) in
            if (!success) {
                print("Error whle saving weight \(weightSample) to Health Store: \(error)")
            }
        }
    }

}
