//
//  SearchListTableViewCell.swift
//  TestAssignmentTask
//
//  Created by Sunil Kumar on 19/01/24.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {

    @IBOutlet weak var loginUserType: UILabel!
    @IBOutlet weak var loginUserName: UILabel!
    @IBOutlet weak var userImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(model: ResultItemsModel) {
        if let urlString = model.avatar_url, let url = URL(string: urlString) {
            loadImage(from: url)
        }
        self.loginUserName.text = model.login ?? ""
        self.loginUserType.text = model.type ?? ""
    }
    private func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.userImageview.image = image
                }
            }
        }
    }
    
}
