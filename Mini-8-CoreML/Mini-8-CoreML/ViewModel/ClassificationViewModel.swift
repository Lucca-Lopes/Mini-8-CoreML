//
//  ClassificationViewModel.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 09/11/23.
//
    
import Combine
import SwiftUI

@MainActor
final class ClassificationViewModel: ObservableObject {
    
    @Published var displayImagePicker: Bool = false
    
    @Published var importedImage: UIImage? = nil
    
    @Published var classification: LocalizedStringKey = ""
    @Published var accuracy: String = ""
    @Published var description: LocalizedStringKey = ""
    @Published var recommendation: LocalizedStringKey = ""
    
    let service: ClassificationServiceProviding
    
    private var subscribers: [AnyCancellable] = []
    
    init(
        image: UIImage? = nil,
        service: ClassificationServiceProviding = ClassificationService()
    ) {
        self.importedImage = image
        self.service = service
        
        self.subscribeClassifications()
        self.subscribeAccuracies()
        self.onChangeImage()
    }
    
    func subscribeClassifications() {
        self.service.classificationsResultPub
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newClassification in
                self?.classification = self?.adequateClassification(classification: newClassification) ?? ""
                self?.description = self?.updateDescription(classification: newClassification) ?? ""
                self?.recommendation = self?.updateRecomendation(classification: newClassification) ?? ""
                
            }
            .store(in: &subscribers)
    }
    
    func subscribeAccuracies(){
        self.service.accuraciesResultPub
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newAccuracies in
                self?.accuracy = newAccuracies
            }
            .store(in: &subscribers)
    }
    
    func onChangeImage() {
        guard let image = importedImage else { return }
        service.updateClassifications(for: image)
    }
    
    func adequateClassification(classification: String) -> LocalizedStringKey {
        switch classification {
        case "Circular_Alopecia":
            return "circularAlopecia"
        case "Keratosis":
            return "keratosis"
        case "Skin_Lesions":
            return "skinLesion"
        default:
            return "healthy"
        }
    }
    
    func updateDescription(classification: String) -> LocalizedStringKey {
        switch classification {
        case "Circular_Alopecia":
            return "circularAlopeciaDescription"
        case "Keratosis":
            return "keratosisDescription"
        case "Skin_Lesions":
            return "skinLesionDescription"
        default:
            return "healthyDescription"
        }
    }
    
    func updateRecomendation(classification: String) -> LocalizedStringKey {
        switch classification {
        case "Circular_Alopecia":
            return "circularAlopeciaRecomendation"
        case "Keratosis":
            return "keratosisRecomendation"
        case "Skin_Lesions":
            return "skinLesionRecomendation"
        default:
            return "healthyRecomendation"
        }
    }
}
