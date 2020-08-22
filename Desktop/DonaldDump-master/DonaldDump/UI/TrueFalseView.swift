//
//  TrueFalseView.swift
//  DonaldDump
//
//  Created by Kenneth Aguilar on 8/19/20.
//  Copyright © 2020 AWSStudent. All rights reserved.
//

import UIKit
import SnapKit

protocol TrueFalseDelegate: AnyObject {
    func didTapTrueButton()
    func didTapFalseButton()
}

class TrueFalseView: UIView {
    struct Content {
        let tweetLabel: String
    }
    
    weak var delegate: TrueFalseDelegate?
    //refactor this to only be declarations and have it initialized in createSubviews
    let tweetView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 10
        return view
    }()
    
    let tweetImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.image = UIImage(named: "DonaldJTrump")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = false
        view.layer.cornerRadius = view.frame.height/2
        view.clipsToBounds = true
        return view
    }()
    
    let tweetLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        label.numberOfLines = 0
        return label
    }()
    
    let tweetNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "Donald J. Trump"
        return label
    }()
    
    let trueButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.systemBlue
        btn.setTitle("True", for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(trueAction), for: .touchUpInside)
        return btn
    }()
    
    let falseButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.systemRed
        btn.setTitle("False", for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(falseAction), for: .touchUpInside)
        return btn
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .leading
        sv.spacing = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override init(frame: CGRect) {
         super.init(frame: frame)
         createSubviews()
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         createSubviews()
     }

     func createSubviews() {
         // all the layout code from above
        backgroundColor = UIColor.white
        setConstraints()
     }
    
    func setConstraints() {
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(tweetView)
        stackView.addArrangedSubview(trueButton)
        stackView.addArrangedSubview(falseButton)
        
        tweetView.addSubview(tweetImageView)
        tweetView.addSubview(tweetNameLabel)
        tweetView.addSubview(tweetLabel)
                
        tweetView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
        }
        tweetLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(90)
            make.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        tweetNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.equalToSuperview().inset(100)
        }
        tweetImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(30)
            make.height.width.equalTo(50)
        }
        trueButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
        }
        falseButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
        }
        stackView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.bottom.equalToSuperview().inset(60)
        }
    }
    
    func configure(content: Content){
        tweetLabel.text = content.tweetLabel
    }
    
    @objc func trueAction(sender: UIButton){
        delegate?.didTapTrueButton()
    }
    @objc func falseAction(sender: UIButton){
        delegate?.didTapFalseButton()
    }
}
