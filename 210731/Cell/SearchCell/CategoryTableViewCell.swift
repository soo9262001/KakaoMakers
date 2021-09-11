//
//  CategoryTableViewCell.swift
//  210731
//
//  Created by kms on 2021/08/26.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var category = ["푸드", "생활 / 주방", "패션잡화", "건강 / 스포츠 / 레저", "패션의류", "홈 인테리어", "뷰티", "IT / 디지털", "가전", "취미 / 문구", "도서", "전시 / 체험", "반려동물", "유아동", "#브랜드 전체보기", "#브랜드 스토리" ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categorycell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categorycell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = category[indexPath.row]
        return cell
    }
    
    
}

//extension CategoryCollectionViewCell: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
    
    
//}
