//
//  CustomCell.swift
//  InstaKiloSwift
//
//  Created by Frank Chen on 2019-05-20.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

import UIKit

protocol CustomCellDelegate {
  func didTapCell(imageName:String)
}

class CustomCell: UICollectionViewCell {
  
  let imageView : UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  var delegate: CustomCellDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
    
}
