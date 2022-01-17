//
//  BookDetailVc.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit
import Alamofire
import SDWebImage
import JGProgressHUD
import SafariServices
import Cosmos


@available(iOS 14.0, *)
class BookDetailVc: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleimage: UILabel!
    @IBOutlet weak var authoursTitle: UILabel!
    @IBOutlet weak var discriptionText: UITextView!
    @IBOutlet weak var publisherNametext: UILabel!
    @IBOutlet weak var publisherDate: UILabel!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var subTitleText: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!
    @IBOutlet weak var catogryLabel: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    
    
    
    
    //MARK:- properties
    
    var bookID:String?
    var bookDetail:BookModal?
    var bookDefine:VolumeInfo?
    
    
    
    
    //MARK:- App Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discriptionText.isHidden = false
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBookdetail()
        mainImage.layer.cornerRadius = 15
        rateView.settings.fillMode = .half
        self.readButton.layer.cornerRadius = readButton.frame.height / 2
        
    }
    
    //MARK:- Class Methods
    func getBookdetail() {
        
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        let url = "https://www.googleapis.com/books/v1/volumes?q=\(bookID!)"
        ApiService.Shared.fetchData(url: url, parms: nil  , headers: nil, method:.get) { [weak self](getBook:BookModal?, failBook:BookModal?, error) in
            
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
                hud.dismiss()
            }
            
            else {
                self.bookDetail = getBook
                hud.dismiss()
                assignValueToLabels()
            }
        }
        
        func assignValueToLabels() {
            
            guard let itemArray = self.bookDetail?.items else {return}
            for item in itemArray {
                self.titleimage.text = item.volumeInfo?.title
                self.bookTitleLabel.text = item.volumeInfo?.title
                self.subTitleText.text = item.volumeInfo?.subtitle
                self.authoursTitle.text = item.volumeInfo?.authors?[0]
                self.discriptionText.text = item.volumeInfo?.volumeInfoDescription
                self.publisherNametext.text = "Publisher Name: \(item.volumeInfo?.publisher ?? "")"
                self.publisherDate.text = "Publisher Date: \(item.volumeInfo?.publishedDate ?? "")"
                self.pageCountLabel.text = "Number Pages: \(item.volumeInfo?.pageCount ?? 0) pages"
                self.catogryLabel.text = "Catogry: \(item.volumeInfo?.categories?[0] ?? "")"
                self.backImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.backImage.sd_setImage(with:URL(string:item.volumeInfo?.imageLinks?.thumbnail ?? "" ),placeholderImage: UIImage(named: "placeholder") ,completed: nil )
                self.mainImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.mainImage.sd_setImage(with:URL(string:item.volumeInfo?.imageLinks?.thumbnail ?? "" ),placeholderImage: UIImage(named: "placeholder") ,completed: nil )
                self.rateView.rating = Double(item.volumeInfo?.averageRating ?? 0)
            }
        }
    }
    
    
    //MARK:- IB Actions
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        
        print("Tap Tap ")
        guard let itemArray = self.bookDetail?.items else {return}
        
        for item in itemArray {
            
            self.titleimage.text = item.volumeInfo?.title
            
            guard let url = URL(string: item.volumeInfo?.previewLink ?? "") else {return}
            
            let vc = WebViewReadController(url:url , title: "Read.it📚")
            let NavVc = UINavigationController(rootViewController: vc)
            present(NavVc, animated:true)
        }
    }
}
