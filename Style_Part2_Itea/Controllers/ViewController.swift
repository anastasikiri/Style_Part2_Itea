//
//  ViewController.swift
//  Style_Part2_Itea
//
//  Created by Anastasia Bilous on 2022-06-25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    public let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: ViewController.createLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(chooseTheme))
        navigationItem.rightBarButtonItem?.tintColor = .systemCyan
        
        view.addSubview(collectionView)
        collectionView.register(PictureCollectionViewCell.self,
                                forCellWithReuseIdentifier: PictureCollectionViewCell.identifier)
        collectionView.register(LabelPictureCollectionViewCell.self,
                                forCellWithReuseIdentifier: LabelPictureCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        collectionView.frame = view.bounds
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .choiceOfColor
        collectionView.backgroundColor = .choiceOfColor
        collectionView.reloadData()
    }
    
    @objc private func chooseTheme () {
        let vc = SettingsViewController()
        show(vc, sender: nil)
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex,
            environment -> NSCollectionLayoutSection? in
            
            if sectionIndex == 0 {
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                                        heightDimension: .absolute(40.0))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                // Items
                let pictureItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(275)
                    )
                )
                pictureItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 0, leading: 4, bottom: 0, trailing: 4
                )
                
                // Groups
                let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(275)
                    ),
                    subitem: pictureItem,
                    count: 1)
                
                // Section
                let section = NSCollectionLayoutSection(group: horizontalGroup)
                section.boundarySupplementaryItems = [header]
                return section
            }
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                                    heightDimension: .absolute(40.0))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            // Items
            let quadrupleItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1/2))
            )
            quadrupleItem.contentInsets = NSDirectionalEdgeInsets(
                top: 2, leading: 4, bottom: 2, trailing: 4
            )
            
            // Groups
            let doubleHorizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1/2)
                ),
                subitem: quadrupleItem,
                count: 2)
            
            let quadrupVerticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                ),
                subitem: doubleHorizontalGroup,
                count: 2)
            
            // Section
            let section = NSCollectionLayoutSection(group: quadrupVerticalGroup)
            section.boundarySupplementaryItems = [header]
            return section
        }
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderCollectionReusableView.identifier,
                for: indexPath) as! HeaderCollectionReusableView
            header.configure(with: titlesForHeaders[indexPath.section],
                             font: .sansProBlack(ofSize: 45))
            return header
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath) as! HeaderCollectionReusableView
        header.configure(with: titlesForHeaders[indexPath.section],
                         font: .sansProBlack(ofSize: 25))
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PictureCollectionViewCell.identifier,
                for: indexPath) as! PictureCollectionViewCell
            cell.configure(with: image!,
                           radius: 5)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LabelPictureCollectionViewCell.identifier,
            for: indexPath) as! LabelPictureCollectionViewCell
        cell.configure(with: images[indexPath.row]!,
                       radius: 5,
                       title: titles[indexPath.row],
                       font: .allLabelFonts())
        return cell
    }
}

