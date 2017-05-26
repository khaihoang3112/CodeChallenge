//
//  ViewController.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/22/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import UIKit
import GNAContextMenu
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 10.0, right: 0.0)
    fileprivate let itemsPerRow: CGFloat = 2
    var photos: [Photos]?
    var imageCached = NSCache<AnyObject, AnyObject>()
    var menuView: GNAMenuView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpView()
        getPhotoFromAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos![indexPath.row]
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.photo = photo
        present(detailsVC, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos == nil {
            return 0
        }
        return (photos?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.className(aClass: ImageCollectionViewCell.self), for: indexPath) as! ImageCollectionViewCell
        cell.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress)))
        
        let photo = self.photos![indexPath.row]
        let imageURL = photo.image_url?[0]
        if let imageCached = imageCached.object(forKey: (imageURL) as AnyObject) as? UIImage {
            cell.imageView.image = imageCached
            createContextMenuInItems()
        } else {
            DispatchQueue.global().async {
                let imageUrl = URL(string: imageURL!)
                let data = NSData(contentsOf: imageUrl!)
                let image = UIImage(data: data! as Data)
                DispatchQueue.main.async {
                    self.imageCached.setObject(image!, forKey: imageURL as AnyObject)
                    cell.imageView.image = image
                    self.createContextMenuInItems()
                }
            }
        }
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let availableWidth = collectionView.frame.size.width - 10
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem + 70)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}

// MARK: Private function

extension ViewController: GNAMenuItemDelegate {
    func setUpView() {
        collectionView.registerCellNibForClass(cellClass: ImageCollectionViewCell.self)
    }
    
    func getPhotoFromAPI() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        APIPhoto.apiPhoto.getPhotos{ (photos, error) in
            self.loadingIndicator.isHidden = true
            self.loadingIndicator.stopAnimating()
            guard let photos = photos else {
                return
            }
            self.photos = photos
            self.collectionView.reloadData()
            self.collectionView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    
    func createContextMenuInItems() {
        menuView = GNAMenuView(touchPointSize: CGSize(width: 70, height: 70), touchImage: UIImage(named: "defaultImage"), menuItems:
            [GNAMenuItem(icon: UIImage(named: "icon-pin")!,
                         activeIcon: UIImage(named: "icon-pin-active"),
                         title: "Pin"),
             GNAMenuItem(icon: UIImage(named: "icon-heart")!,
                         activeIcon: UIImage(named: "icon-heart-active"),
                         title: "Like"),
             GNAMenuItem(icon: UIImage(named: "icon-send")!,
                         activeIcon: UIImage(named: "icon-send-active"),
                         title: "Send"),
             GNAMenuItem(icon: UIImage(named: "icon-more")!,
                         activeIcon: UIImage(named: "icon-more-active"),
                         title: "More")])
        menuView?.delegate = self
    }
    
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {

        let p = gesture.location(in: self.collectionView)
        
        if let indexPath = self.collectionView.indexPathForItem(at: p) {
            // get the cell at indexPath (the one you long pressed)
            menuView?.additionalInfo = ["cellPath": indexPath as NSIndexPath]
            let cell = self.collectionView.cellForItem(at: indexPath)
            menuView?.handleGesture(gesture, inView: cell!)
        } else {
            print("couldn't find index path")
        }
    }
}

