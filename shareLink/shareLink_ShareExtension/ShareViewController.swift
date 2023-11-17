//
//  ShareViewController.swift
//  shareLink_ShareExtension
//
//  Created by Ömer Oğuz Çelikel on 27.10.2023.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    // Verileri saklamak için bir dizi tanımlayın.
    var sharedURLs: [URL] = []
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // Paylaş butonuna tıklandığında yapılacak işlemleri burada tanımlayın.
        
        // Paylaşılan verileri yakalayın ve saklayın.
        for item in self.extensionContext!.inputItems as! [NSExtensionItem] {
            if let attachments = item.attachments {
                for attachment in attachments {
                    if attachment.hasItemConformingToTypeIdentifier("public.url") {
                        attachment.loadItem(forTypeIdentifier: "public.url", options: nil) { (item, error) in
                            if let url = item as? URL {
                                // Paylaşılan URL'i alın ve saklayın.
                                self.sharedURLs.append(url)
                            }
                        }
                    }
                }
            }
        }
        print("sharedURLs: \(sharedURLs)")
        // Kullanıcıya geri bildirim vermek için Share Extension'ı kapatın.

        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
