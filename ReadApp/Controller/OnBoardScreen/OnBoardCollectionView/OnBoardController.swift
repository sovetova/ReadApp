//
//  OnBoardController.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit

class OnBoardController: UIViewController {
    
    @IBOutlet weak var onBoardCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nextButtonOutlet: UIButton!

    
    var onBoardSlide:[OnBoardDataModel] = []
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            nextButtonOutlet.setTitle(currentPage == onBoardSlide.count - 1 ? "Get Started" : "Next", for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupCollectionView()
        assignValueToArray()
        
    }
    
    func assignValueToArray() {
        onBoardSlide = [
            OnBoardDataModel(title: "Reading is able to change ideas",  images: #imageLiteral(resourceName: "1")),
            OnBoardDataModel(title: "Anyone who reads books is never bored",  images:#imageLiteral(resourceName: "3")),
            OnBoardDataModel(title: "Let's start?",  images: #imageLiteral(resourceName: "2"))
        ]
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageController.currentPage = currentPage
    }
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "TestUser222")
        
        if currentPage == onBoardSlide.count - 1 {
            
            Core.Shared.notNewUser()
            dismiss(animated: true, completion: nil)
            debugPrint("Go to Another Page 🚀")
        }
        
        else {
            currentPage += 1
            let indexpath = IndexPath(item: currentPage, section: 0)
            onBoardCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        }
        
    }
}



