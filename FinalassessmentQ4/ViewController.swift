//
//  ViewController.swift
//  FinalassessmentQ4
//
//  Created by jamespoyu on 2016/8/5.
//  Copyright © 2016年 AlphaCamp. All rights reserved.
//

import UIKit
import MessageUI


class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,MFMailComposeViewControllerDelegate {
    
    let cellIdentifier = "customCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView!.registerNib(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
        
        
    }
    let customcellArray = ["顯示AlertView", "顯示ActionSheet", "撥打117", "開啟設定頁面", "導航到AlphaCamp", "寫信"]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customcellArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomCollectionViewCell
        
        cell.customCellLabel.text = customcellArray[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let alert = UIAlertController(title: "Alert titile", message: "Alert message", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        case 1:
            let alert = UIAlertController(title: "Alert title", message: "Alert message", preferredStyle: .ActionSheet)
            alert.addAction(UIAlertAction(title: "yes", style: .Default, handler: nil))
            alert.addAction(UIAlertAction(title: "no", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        case 2:
            if let url = NSURL(string: "tel://117") {
                UIApplication.sharedApplication().openURL(url)
            }
        case 3:
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        case 4:
            let streetName = "台北市中山區南京東路二段97號".stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
            let path = "http://maps.apple.com/?q=" + streetName!
            if let url = NSURL(string: path) {
                UIApplication.sharedApplication().openURL(url)
            }
        case 5:
            let emailTitle = "測試信件"
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            self.presentViewController(mc, animated: true, completion: nil)
        default:
            break
        }
    }

    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        switch result {
        case MFMailComposeResultCancelled:
            print("Mail cancelled")
        default:
            break
        }
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}



