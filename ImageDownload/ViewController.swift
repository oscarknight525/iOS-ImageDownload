//
//  ViewController.swift
//  ImageDownload
//
//  Created by 이규진 on 2016. 9. 7..
//  Copyright © 2016년 이규진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var downloadTask:URLSessionDownloadTask!
    
    @IBAction func downloadAction(_ sender: AnyObject) {
        self.indicator.startAnimating()
        self.progressView.setProgress(0.0, animated: false)
        imgView.image = nil
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
        let urlStr: URL = URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!
        
//        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        
        downloadTask = session.downloadTask(with: urlStr, completionHandler: {(data,response,error) -> Void in
            self.imgView.image = UIImage(data: try! Data(contentsOf: data!))
            self.indicator.stopAnimating()
        })
        downloadTask.resume()
    }
    
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//        let progress: Float = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
//        self.progressView.setProgress(progress, animated: true)
////        print("bytesWritten \(bytesWritten)")
////        print("totalBytesWritten \(totalBytesWritten)")
////        print("totalBytesExpectedToWrite \(totalBytesExpectedToWrite)")
//    }
//    
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        let data:Data = try! Data(contentsOf: location)
//        self.imgView.image = UIImage(data: data)
//        self.indicator.stopAnimating()
//    }
    
    @IBAction func suspendAction(_ sender: AnyObject) {
        downloadTask.suspend()
    }
    
    @IBAction func resumeAction(_ sender: AnyObject) {
        downloadTask.resume()
    }
    
    @IBAction func cancelAction(_ sender: AnyObject) {
        downloadTask.cancel()
        self.progressView.setProgress(0.0, animated: false)
        self.indicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


