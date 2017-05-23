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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    open var photo: Photos?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension DetailsViewController {
    func setUpView() {
        closeButton.layer.cornerRadius = 5
        if let name = photo?.name, let info = photo?.des {
            nameLabel.text = name
            descriptionLabel.text = info
        }
        
        DispatchQueue.global().async {
            let data = NSData(contentsOf: URL(string: self.photo!.image_url!)!)
            let image = UIImage(data: data as! Data)
            DispatchQueue.main.async {
                self.imageView.contentMode = .scaleAspectFit
                self.imageView.image = image
            }
        }
    }
}
