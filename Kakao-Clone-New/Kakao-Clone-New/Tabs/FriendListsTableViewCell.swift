//
//  FriendListsTableViewCell.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/12.
//

import UIKit

class FriendListTableViewCell: UITableViewCell {
    
    static let identifier = "FriendListTableViewCell"
    
    let profileImageView = UIImageView().then {
        $0.snp.makeConstraints {
            $0.width.equalTo(44)
            $0.height.equalTo(41)
        }
    }
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    let bioLabel = UILabel().then {
        $0.textColor = UIColor(white: 166.0 / 255.0, alpha: 1.0)
        $0.font = .systemFont(ofSize: 12)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // add subviews
        self.addSubview(self.profileImageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.bioLabel)
        
        // layout
        profileImageLayout()
        nameLabelLayout()
        bioLabelLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func profileImageLayout() {
        self.profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(44)
            $0.height.equalTo(41)
        }
    }
    
    func nameLabelLayout() {
        self.nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.profileImageView.snp.trailing).offset(11)
            $0.top.equalToSuperview().offset(10)
        }
        
    }
    
    func bioLabelLayout() {
        self.nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.profileImageView.snp.trailing).offset(11)
            $0.top.equalToSuperview().offset(27)
        }
        
    }
        
    func setData(imageName: String, name: String, bio: String) {
        if let image = UIImage(named: imageName) {
            self.profileImageView.image = image
            self.nameLabel.text = name
            self.bioLabel.text = bio
        }
    }

}
