//
//  DetailsViewController.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/22/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    open var photo: Photos?
    open var comments: [Comments]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        
        guard (photo?.id_photo) != nil else { return }
        getPhotoCommentByPhotoId(photoId: (photo?.id_photo)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBAction func closeButtonClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {})
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            if comments == nil {
                return 0
            }
            return (self.comments?.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 400
        case 1:
            return UITableViewAutomaticDimension
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDetailCell", for: indexPath) as! ImageDetailTableViewCell
            cell.setUpCell(photo: photo!)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameTableViewCell
            cell.setUpCell(photo: photo!)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
            cell.setUpCell(comment: (comments?[indexPath.row])!)
            return cell
        }
    }
}

extension DetailsViewController {
    func setUpView() {
        closeButton.layer.cornerRadius = 5
        tableView.register(UINib(nibName: "ImageDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageDetailCell")
        tableView.register(UINib(nibName: "NameTableViewCell", bundle: nil), forCellReuseIdentifier: "NameCell")
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 400
    }
    
    func getPhotoCommentByPhotoId(photoId: Int) {
        APIPhoto.getPhotoComments(photoId: photoId) { (comments, error) in
            self.comments = comments
            self.tableView.reloadData()
        }
    }
}
