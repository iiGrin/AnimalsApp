//
//  PhotoCollectionViewController.swift
//  AnimalsApp
//
//  Created by iggy on 6.09.22.
//

import UIKit


class PhotoCollectionViewController: UICollectionViewController {
    
    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]
    
    let itemsPerRow: CGFloat = 2 // Количество ячеек в строке
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) // Отступ между секциями коллекции

    override func viewDidLoad() {
        super.viewDidLoad()

//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 10
//        layout.minimumLineSpacing = 10
//        layout.scrollDirection = .horizontal
//        collectionView.showsVerticalScrollIndicator = false // Убираем индикатор скролинга
    }
    
    // Передаем фото с PhotoCollectionVC в PhotoVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.dogImageView.image
        }
        
    }

   
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.dogImageView.image = image
    
        return cell
    }

}


    //Настройка CollectionViewFloyLayout
extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {

    // Настройка размера ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        //let itemsPerRow: CGFloat = 2
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1) // Подсчет ширины отступов в строке
        let availableWidth = collectionView.frame.width - paddingWidth // Подсчет ширины всех ячеек в строке(не учитывая отступы)
        let widthPerItem = availableWidth / itemsPerRow // Ширина одной ячейки

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    // Задаем отступ между секциями коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    // Задаем отступ между строками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    // Задаем отступ между столбцами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}

