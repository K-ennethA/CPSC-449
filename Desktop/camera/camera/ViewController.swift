//
//  ViewController.swift
//  camera
//
//  Created by Kenneth Aguilar on 5/9/20.
//  Copyright © 2020 StudentDevs. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class ViewController: UIViewController {

    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var photoOutput: AVCapturePhotoOutput?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var image: UIImage?
    
    
    var audioPlayer = AVAudioPlayer()
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        setUpSound()
        // Do any additional setup after loading the view.        
        
      
      

      
    }
    

 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func setUpSound(){
        let transmissionUploadSound = Bundle.main.path(forResource: "TransmissionUploadSound", ofType: "WAV")
              do{
                  audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: transmissionUploadSound!))
              }
              catch{
                  print(error)
              }
    }
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    func setupDevice(){
        let deviceDisoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified)
        let devices = deviceDisoverySession.devices
        for device in devices{
            if device.position == AVCaptureDevice.Position.back{
                backCamera = device
            }
        }
    }
   
    func setupInputOutput(){
        do{
            let captureDeviceInput = try AVCaptureDeviceInput(device: backCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        }catch{
            print(error)
        }
    }
    func setupPreviewLayer(){
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
    }
    func startRunningCaptureSession(){
        captureSession.startRunning()
    }
    
    @IBAction func translateCameraButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "showTranslationSegue", sender: nil)
        let settings = AVCapturePhotoSettings()
        audioPlayer.play()
        photoOutput?.capturePhoto(with: settings, delegate: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTranslationSegue"{
            let previewVC = segue.destination as! PreviewViewController
            previewVC.image = self.image
        }
    }
    
    

}

extension ViewController: AVCapturePhotoCaptureDelegate{
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation(){
            image = UIImage(data: imageData)
            performSegue(withIdentifier: "showTranslationSegue", sender: nil)
        }
    }
}
