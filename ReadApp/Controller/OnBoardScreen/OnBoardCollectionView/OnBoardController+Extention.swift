//
//  OnBoardController+Extention.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit

extension OnBoardController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func SetupCollectionView() {
        onBoardCollectionView.delegate = self
        onBoardCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardSlide.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = onBoardCollectionView.dequeueReusableCell(withReuseIdentifier:"OnBoardCollectionCell", for: indexPath) as! OnBoardCollectionCell
        
        cell.ConfigureCell(onBoardSlide[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
