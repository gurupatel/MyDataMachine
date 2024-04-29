//
//  DetailedViewController.swift
//  MyDataMachine
//
//  Created by Gaurang Patel on 30/04/24.
//

import Foundation
import UIKit

class DetailedViewController: UIViewController {
    // MARK: - Declaration of IBOutlet
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!

    // MARK: - Declaration of Variables

    var post: Post? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblId.text = "\(post?.id ?? 0)"
        lblTitle.text = "\(post?.title ?? "")"
        lblBody.text = "\(post?.body ?? "")"
    }
}
