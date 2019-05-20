//
//  HeaderView.swift
//  InstaKiloSwift
//
//  Created by Frank Chen on 2019-05-20.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
  
  let label : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = label.font.withSize(20)
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(label)
    
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
      label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
      label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
      label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
