//
//  PostViewCell.swift
//  MyDataMachine
//
//  Created by Gaurang Patel on 29/04/24.
//

import Foundation
import UIKit

/*  ----------------------------------------------------------------------------------------- */

class PostViewCell: UITableViewCell {

    // MARK: - Declaration of IBOutlet
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!

    // MARK: - Declaration of Variables
        
    deinit {
    }
    
    override func prepareForReuse() {

    }
    
     // MARK: - Initialization of required Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

/*  ----------------------------------------------------------------------------------------- */
