//
//  ViewController.swift
//  exam_filedown
//
//  Created by sjh on 2020/03/19.
//  Copyright © 2020 bit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        saveVideoToGallary()
    }
    
    func saveImageToGallary(){
        if let url = URL(string: "http://192.168.10.29:4000/uploads/_talkv_wnvidE75pg_VZXMew1zekPZG3Tqqg57RK_talkv_high-1575422814232.MP4"),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) {
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
        
    func saveVideoToGallary(){
        if let url = URL(string: "http://192.168.10.29:4000/uploads/_talkv_wnvidE75pg_VZXMew1zekPZG3Tqqg57RK_talkv_high-1575422814232.MP4"),
            let urlData = NSData(contentsOf: url) {
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
            let filePath="\(documentsPath)/tempFile.mp4"
            DispatchQueue.main.async {
                urlData.write(toFile: filePath, atomically: true)
                UISaveVideoAtPathToSavedPhotosAlbum(filePath,nil,nil,nil)
            }
        }
    }
}
//
//class Downloader {
//    class func load(url: NSURL) {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
//        var request = URLRequest(url: url as URL)
//        request.httpMethod = "GET"
//
//        let task = session.dataTask(with: request) { (data, response, error) in
//            if (error == nil) {
//                // Success
//                let statusCode = (response as! HTTPURLResponse).statusCode
//                print("Success: \(statusCode)")
//
//                // This is your file-variable:
//                // data
//                dump(data)
//            }
//            else {
//                // Failure
//                print("Failure: ", error!.localizedDescription);
//            }
//        }
//
//        task.resume()
//    }
//}
