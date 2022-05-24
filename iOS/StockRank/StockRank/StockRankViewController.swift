//
//  StockRankViewController.swift
//  StockRank
//
//  Created by Wansoo Ryu on 2022/05/21.
//

import UIKit

class StockRankViewController: UIViewController {
    
    let stockList: [StockModel] = StockModel.list

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // collectionView delegate 설정
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// cell에 관한 delegate
extension StockRankViewController: UICollectionViewDataSource {
    // 아이템의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }

    // 셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {return UICollectionViewCell()}
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        
        return cell
    }
}

// cell의 layout에 관한 delegate
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    // cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let size = CGSize(width: collectionView.bounds.width, height: 80)
        return size
    }
}
