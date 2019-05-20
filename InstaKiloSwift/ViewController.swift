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
    collectionView.backgroundColor = .white
    return collectionView
  }()
  
  let segmentControl: UISegmentedControl = {
    let segmentControl = UISegmentedControl(items: ["subject", "location"])
    segmentControl.translatesAutoresizingMaskIntoConstraints = false
    segmentControl.selectedSegmentIndex = 0
    segmentControl.isUserInteractionEnabled = true
    return segmentControl
  }()
  
  let subject1 = ["image1", "image2", "image3"]
  let subject2 = ["image4", "image5", "image6"]
  let subject3 = ["image7", "image8", "image9"]
  let headerTitle = ["Section1", "Section2", "Section3"]
  lazy var imageNameArray = [subject1, subject2, subject3]
  lazy var imageNameArrayReverse = [subject3, subject2, subject1]
  lazy var selectedNameArray = imageNameArray
  
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
    collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
    
    self.navigationItem.titleView = segmentControl
    segmentControl.addTarget(self, action: #selector(handleSegment), for: UIControl.Event.valueChanged)
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
      collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
      collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
      collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
      ])
  }
  
  @objc func handleSegment(){
    if segmentControl.selectedSegmentIndex == 0{
      self.selectedNameArray = imageNameArray
      self.collectionView.reloadData()
    } else if segmentControl.selectedSegmentIndex == 1{
      self.selectedNameArray = imageNameArrayReverse
      self.collectionView.reloadData()
    }
  }
  
}

extension ViewController:UICollectionViewDelegate{
  
}

extension ViewController:UICollectionViewDataSource{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return selectedNameArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return selectedNameArray[section].count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
    cell.backgroundColor = .red
    cell.imageView.image = UIImage.init(named: self.selectedNameArray[indexPath.section][indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as! HeaderView
    headerView.label.text = self.headerTitle[indexPath.section]
    return headerView
  }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = self.view.frame.width - 30
    return CGSize(width: width / 3, height: width / 3)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: self.collectionView.frame.width, height: 30)
  }
  
}

