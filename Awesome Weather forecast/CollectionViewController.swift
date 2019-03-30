//
//  CollectionViewController.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/30/19.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    weak var forecastCollectionView: UICollectionView?  {
        didSet {
            collectionViewDidSet()
        }
    }
    private var collectionViewLayout: UICollectionViewLayout
    
    init(collectionViewLayout: UICollectionViewLayout) {
        self.collectionViewLayout = collectionViewLayout
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        self.forecastCollectionView = collectionView
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastCollectionView(collectionView, numberOfItemsInSection:section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return forecastCollectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func forecastCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func forecastCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    /// Call this method for register your custom cells. Don't need to call super
    func registerCells() {
        
    }
    
    private func collectionViewDidSet() {
        forecastCollectionView?.dataSource = self
        forecastCollectionView?.delegate = self
        
        registerCells()
    }
    
    private func setupConstraints() {
        guard let collectionView = forecastCollectionView else { return }
        
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ]
        )
        
    }
    
}
