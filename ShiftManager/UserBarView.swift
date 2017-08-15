//
//  BarView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 14.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit



class UserBarView: UIView {
    var selectedUser: UserModel?
    let addButton = UIButton()
    var isAddUserButtonHidden = false {
        didSet {
            addButton.isHidden = isAddUserButtonHidden
        }
    }
    
    private let userBarViewDataSource = UserBarViewDataSource()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 6
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    fileprivate let stackView = UIStackView()
    
    fileprivate let viewHeight: CGFloat = 80.0
    fileprivate let cellDimension: CGFloat = 50.0
    
    init() {
        super.init(frame: .zero)
        selectedUser = userBarViewDataSource.getDefaultUser()
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
    
        stackView.distribution = .fill
        stackView.axis = .horizontal
        addSubview(stackView)
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = userBarViewDataSource
        collectionView.delegate = self
        collectionView.register(UserBarCollectionCell.self, forCellWithReuseIdentifier: String(describing: UserBarCollectionCell.self))
        stackView.addArrangedSubview(collectionView)

        addButton.backgroundColor = .white
        addButton.setTitle(NSLocalizedString("AddFriendButton_loc001", comment: ""), for: .normal)
        addButton.setTitleColor(.black, for: UIControlState.normal)
        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.layer.borderWidth = 1
        stackView.addArrangedSubview(addButton)
    }
    
    fileprivate func setupConstraints() {
        stackView.autoSetDimension(.height, toSize: viewHeight)
        stackView.autoPinEdgesToSuperviewEdges()
        
        addButton.autoMatch(.height, to: .height, of: stackView)
        addButton.autoMatch(.width, to: .height, of: addButton)
    }
    
    public func setActionForAddButton(_ target: Any?, action: Selector){
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

extension UserBarView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
}
