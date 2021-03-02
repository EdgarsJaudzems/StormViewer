//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Edgars Jaudzems on 27/02/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var imageIndex = 0
    var imageCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(imageIndex) of \(imageCount)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
