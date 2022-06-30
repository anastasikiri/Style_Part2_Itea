//
//  SecondaryViewController.swift
//  Style_Part2_Itea
//
//  Created by Anastasia Bilous on 2022-06-26.
//

import UIKit

class SettingsViewController: UIViewController {
    
    public let newView: UIView = {
        let newView = UIView()
        newView.frame = CGRect(x: 0, y: 10, width: 300, height: 300)
        newView.layer.cornerRadius = 10
        newView.backgroundColor = .systemGray5
        return newView
    }()
    
    public let labelText1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Please choose your theme"
        label.font = .sansProBlack(ofSize: 18)
        label.frame = CGRect(x: 0, y: 30, width: 300, height: 40)
        label.textAlignment = .center
        return label
    }()
    
    public let themeOneButton: UIButton = .configureButton(
        title: "White Theme",
        font: .sansProBlack(ofSize: 17),
        titleColor: .black,
        bgColor: .white,
        sizeFrame: CGRect(x: 25, y: 70, width: 250, height: 40),
        withRadius: 10
    )
    
    public let themeTwoButton: UIButton = .configureButton(
        title: "Black Theme",
        font: .sansProBlack(ofSize: 17),
        titleColor: .white,
        bgColor: .black,
        sizeFrame: CGRect(x: 25, y: 120, width: 250, height: 40),
        withRadius: 10
    )
    
    public let themeThreeButton: UIButton = .configureButton(
        title: "Red Theme",
        font: .sansProBlack(ofSize: 17),
        titleColor: .white,
        bgColor: .red,
        sizeFrame: CGRect(x: 25, y: 170, width: 250, height: 40),
        withRadius: 10
    )
    
    public let okButton: UIButton = .configureButton(
        title: "Ok",
        font: .sansProBlack(ofSize: 17),
        titleColor: .black,
        bgColor: .gray,
        sizeFrame: CGRect(x: 100, y: 250, width: 100, height: 40),
        withRadius: 10
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        view.addSubview(newView)
        newView.center = self.view.center
        newView.addSubview(labelText1)
        newView.addSubview(themeOneButton)
        newView.addSubview(themeTwoButton)
        newView.addSubview(themeThreeButton)
        newView.addSubview(okButton)
        
        themeOneButton.addTarget(self, action: #selector(chooseThemeOne), for: .touchUpInside)
        themeTwoButton.addTarget(self, action: #selector(chooseThemeTwo), for: .touchUpInside)
        themeThreeButton.addTarget(self, action: #selector(chooseThemeThree), for: .touchUpInside)
        okButton.addTarget(self, action: #selector(closePopUp), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .choiceOfColor
    }
    
    @objc private func chooseThemeOne() {
        ThemeManager.shared.currentTheme = .white
        view.backgroundColor = .choiceOfColor
        self.navigationController!.navigationBar.barStyle = .default
    }
    
    @objc private func chooseThemeTwo() {
        ThemeManager.shared.currentTheme = .black
        view.backgroundColor = .choiceOfColor
        self.navigationController!.navigationBar.barStyle = .black
    }
    
    @objc private func chooseThemeThree() {
        ThemeManager.shared.currentTheme = .red
        view.backgroundColor = .choiceOfColor
        self.navigationController!.navigationBar.barStyle = .black
    }
    
    @objc private func closePopUp() {
        navigationController?.popViewController(animated: true)
    }
}

