//
//  ViewController.swift
//  InstaKiloSwift
//
//  Created by Frank Chen on 2019-05-20.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let collectionView : UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  let subject1 = ["image1", "image2", "image3"]
  let subject2 = ["image4", "image5", "image6"]
  let subject3 = ["image7", "image8", "image9"]
  lazy var imageNameArray = [subject1, subject2, subject3]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    setupCollectionView()
  }
  
  func setupCollectionView(){
    self.view.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "customCell")
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
      collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
      collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
      collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
      ])
  }
}

extension ViewController:UICollectionViewDelegate{
  
}

extension ViewController:UICollectionViewDataSource{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return imageNameArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageNameArray[section].count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
    cell.backgroundColor = .red
    cell.imageView.image = UIImage.init(named: self.imageNameArray[indexPath.section][indexPath.row])
    return cell
  }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = self.view.frame.width - 30
    return CGSize(width: width / 3, height: width / 3)
  }
  
}

