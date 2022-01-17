//
//  ShowBooksVc.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit
import Alamofire
import SDWebImage
import JGProgressHUD


class ShowBooksVc: UIViewController {
    
    
    //MARK: - Outlet
    @IBOutlet weak var bookCollection: UICollectionView!
    
    
    //MARK: - Properties
    var searchText:String!
    var bookDetail:BookModal?
    
    
    //MARK: - App life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        getBookDetail()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //MARK: - Class Methods
    
    func setupUI() {
        bookCollection.delegate = self
        bookCollection.dataSource = self
        registerCell()
    }
    
    func registerCell() {
        bookCollection.register(UINib(nibName: "bookShowCell", bundle: nil), forCellWithReuseIdentifier: "bookShowCell")
    }
    
    func getBookDetail() {
        
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        
        let url = "https://www.googleapis.com/books/v1/volumes?maxResults=30&q=\(searchText ?? "")"
        
        ApiService.Shared.fetchData(url: url, parms: nil  , headers: nil, method:.get) { [weak self](getBook:BookModal?, failBook:BookModal?, error) in
            
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
                hud.dismiss()
            }
            else if self.bookDetail?.items?.count == 0 {
                
                
                
                hud.dismiss()
            }
            else {
                self.bookDetail = getBook
                hud.dismiss()
                DispatchQueue.main.async {
                    self.bookCollection.reloadData()
                }
            }
        }
    }
}

//MARK: - Extensions
@available(iOS 14.0, *)
extension ShowBooksVc : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookDetail?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = bookCollection.dequeueReusableCell(withReuseIdentifier: "bookShowCell", for: indexPath) as! bookShowCell
        
        let BookDetail = bookDetail?.items?[indexPath.item].volumeInfo?.imageLinks?.thumbnail
        cell.bookImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.bookImage?.sd_setImage(with:URL(string: BookDetail ?? ""),placeholderImage: UIImage(named: "placeholder") ,completed: nil )
        cell.bookName.text = bookDetail?.items?[indexPath.item].volumeInfo?.title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let BookDetail = bookDetail?.items?[indexPath.item].id
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "BookDetailVc") as? BookDetailVc
        
        vc?.bookID = "\(BookDetail ?? "")"
        navigationController?.pushViewController(vc!, animated: true)
        
        
        
    }
}
