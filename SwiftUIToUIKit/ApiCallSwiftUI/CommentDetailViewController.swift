//
//  CommentDetailViewController.swift
//  ApiCallSwiftUI
//
//  Created by Nilesh on 14/02/22.
//

import UIKit
import SwiftUI

class CommentDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    private var viewModel: CommentDetailViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    init(viewModel: CommentDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CommentDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateUI(){
        emailLabel.text = viewModel.comment.email
        bodyLabel.text = viewModel.comment.body
        nameLabel.text = viewModel.comment.name
    }
    
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        var profileViewModel = ProfileViewModel(commentModel: viewModel.comment)
        let profileView = ProfileView()
        let vc = UIHostingController(rootView: profileView.environmentObject(profileViewModel))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
