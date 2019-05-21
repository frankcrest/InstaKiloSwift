//
//  DetailViewController.swift
//  InstaKiloSwift
//
//  Created by Frank Chen on 2019-05-20.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

import UIKit

protocol DetailViewDelegate {
  func deleteTapped(imageName:String)
}

class DetailViewController: UIViewController {
  
  let imageView : UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  let button : UIButton = {
    let button = UIButton(frame: CGRect.zero)
    button.setTitle("delete photo", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = .systemFont(ofSize:20)
    button.backgroundColor = .black
    return button
  }()

  let buttonToDismiss : UIButton = {
    let button = UIButton(frame:CGRect.zero)
    button.setTitle("go back", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = .systemFont(ofSize: 20)
    button.backgroundColor = .black
    return button
  }()
  
  var imageName:String?
  
  var delegate:DetailViewDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
    button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    buttonToDismiss.addTarget(self, action: #selector(handelDismiss), for: .touchUpInside)
    setupImage()
    
  }
  
  func setupView(){
    self.view.backgroundColor = .white
    self.view.addSubview(imageView)
    self.view.addSubview(buttonToDismiss)
    self.view.addSubview(button)
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
      imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
      imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
      
      buttonToDismiss.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 0),
      buttonToDismiss.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
      buttonToDismiss.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
      buttonToDismiss.heightAnchor.constraint(equalToConstant: 40),
      
      button.topAnchor.constraint(equalTo: self.buttonToDismiss.bottomAnchor, constant: 0),
      button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
      button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
      button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
      button.heightAnchor.constraint(equalToConstant: 40)
      ])
  }
  
  func setupImage(){
    if imageName != nil {
      self.imageView.image = UIImage.init(named: self.imageName!)
    }
  }
  
  @objc func handleTap(){
    if let imageName = self.imageName{
      self.delegate?.deleteTapped(imageName: imageName)
    }
    self.dismiss(animated: true, completion: nil)
  }
  
  @objc func handelDismiss(){
    self.dismiss(animated: true, completion: nil)
  }
  
}
