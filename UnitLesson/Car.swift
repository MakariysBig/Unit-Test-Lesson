import Foundation
import UIKit

enum CarType {
    case bentley, audi, lada
}

class Car {
    var speed = 0
    var color = UIColor.white
    var price = 0
    var status = ""
    var isAvailable = false
    
    private func bentley() {
        speed = 300
        price = 100_000
        status = "Premium"
        isAvailable = true
    }
    
    private func audi() {
        speed = 240
        price = 50_000
        status = "Average"
        isAvailable = true
    }
    
    private func lada() {
        speed = 180
        price = 27_000
        status = "Budget"
        isAvailable = true
    }
    
    func start(carType: CarType, color: UIColor = .white) {
        switch carType {
        case .bentley:
            bentley()
        case .audi:
            audi()
        case .lada:
            lada()
        }
        
        self.color = color
    }
    
    func isCar(isCar: Bool) -> Bool {
        return isCar
    }
}

