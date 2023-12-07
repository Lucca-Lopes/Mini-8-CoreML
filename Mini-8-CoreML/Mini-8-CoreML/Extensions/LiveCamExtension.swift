//
//  LiveCamExtension.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 29/11/23.
//

import Vision
import AVFoundation
import UIKit

extension LiveCamViewController {
    
    func setupDetector() {
        let modelURL = Bundle.main.url(forResource: "DogSkinLesion", withExtension: "mlmodelc")
    
        do {
            let visionModel = try VNCoreMLModel(for: MLModel(contentsOf: modelURL!))
            let recognitions = VNCoreMLRequest(model: visionModel, completionHandler: detectionDidComplete)
            self.requests = [recognitions]
        } catch let error {
            print(error)
        }
    }
    
    func detectionDidComplete(request: VNRequest, error: Error?) {
        DispatchQueue.main.async(execute: {
            if let results = request.results {
                if self.image == nil {
                    self.getDataDelegate?.getPrediction(prediction: results[0].description)
                    self.getDataDelegate?.getAccuracy(accuracy: results[0].confidence.description)
                }
            }
        })
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:]) // Create handler to perform request on the buffer
        
        if canTakeImage {
            let ciImage = CIImage(cvImageBuffer: pixelBuffer)
               let context = CIContext()
               if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
                  let uiImage = UIImage(cgImage: cgImage)
                   self.image = uiImage
               }
//            let image = UIImage(ciImage: ciImage, scale: 1.0, orientation: setOrientation())
            
//            self.delegate?.getImage(image: image)
        }
        
        do {
            try imageRequestHandler.perform(self.requests) // Schedules vision requests to be performed
        } catch {
            print(error)
        }
    }
    
    func setOrientation() -> UIImage.Orientation {
        let curDeviceOrientation = UIDevice.current.orientation
        var exifOrientation: UIImage.Orientation
        switch curDeviceOrientation {
            case UIDeviceOrientation.portraitUpsideDown:  // Device oriented vertically, Home button on the top
                exifOrientation = .left
            case UIDeviceOrientation.landscapeLeft:       // Device oriented horizontally, Home button on the right
                exifOrientation = .upMirrored
            case UIDeviceOrientation.landscapeRight:      // Device oriented horizontally, Home button on the left
                exifOrientation = .down
            case UIDeviceOrientation.portrait:            // Device oriented vertically, Home button on the bottom
                exifOrientation = .up
            default:
                exifOrientation = .up
        }
        return exifOrientation
    }
    
    func captureImage(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection){
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
    }
}
