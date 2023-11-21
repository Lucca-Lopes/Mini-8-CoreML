//
//  ClassificationService.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 09/11/23.
//

import Vision
import SwiftUI

protocol ClassificationServiceProviding {
    var classificationsResultPub: Published<String>.Publisher { get }
    var accuraciesResultPub: Published<String>.Publisher { get }
    func updateClassifications(for image: UIImage)
}


final class ClassificationService: ClassificationServiceProviding {
    
    @Published private var classifications: String = ""
    var classificationsResultPub: Published<String>.Publisher { $classifications }
    
    @Published private var accuracies: String = ""
    var accuraciesResultPub: Published<String>.Publisher { $accuracies }
    
    /// - Tag: MLModelSetup
    lazy var classificationRequest: `VNCoreMLRequest` = {
        do {
            let model = try VNCoreMLModel(for: DogSkinLesion(configuration: MLModelConfiguration()).model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    
    // MARK: - Image Classification
    
    /// - Tag: PerformRequests
    func updateClassifications(for image: UIImage) {
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        /// Clear old classifications
        self.classifications = ""
        self.accuracies = ""
        
        Task{
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    /// Updates the variable with the results of the classification.
    /// - Tag: ProcessClassifications
    private func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                return
            }
            // The `results` will always be `VNClassificationObservation`s, as specified by the Core ML model in this project.
            let classifications = results as! [VNClassificationObservation]
            
            if classifications.isEmpty {
                // do nothing
            } else {
                // Display top classifications ranked by confidence in the UI.
                let topClassifications = classifications.prefix(1)
                let descriptions = topClassifications.map { classification in
                    // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                    return String(format: "\(classification.identifier)")
                }
                
                let accuracies = topClassifications.map { classification in
                    // Formats the classification for display; e.g. "(0.37) cliff, drop, drop-off".
                    let text = String(format: "\(classification.confidence * 100)")
                    return text.prefix(2)
                }
                
                print("Classificacoes - \(descriptions)")
                print("Accuracies - \(accuracies)")
                self.classifications = descriptions.joined()
                self.accuracies = accuracies.joined()
            }
        }
    }
}

///
/// https://developer.apple.com/documentation/imageio/cgimagepropertyorientation
///
extension CGImagePropertyOrientation {
    /**
     Converts a `UIImageOrientation` to a corresponding
     `CGImagePropertyOrientation`. The cases for each
     orientation are represented by different raw values.
     
     - Tag: ConvertOrientation
     */
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        @unknown default:
            fatalError()
        }
    }
}

