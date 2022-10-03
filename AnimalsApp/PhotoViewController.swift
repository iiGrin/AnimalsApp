//
//  PhotoViewController.swift
//  AnimalsApp
//
//  Created by iggy on 6.09.22.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    var image: UIImage? // Объект для получения фото из PhotoCollectionVC
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = image // Присваеваем imageView полученное в переменную фото 

    }
    

    @IBAction func shareAction(_ sender: UIButton) {
        
        // Отправляем фото по нажатию на кнопку. Получаем данные
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        // Проверяем, было ли доставлено наше сообщение
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Успешно")
            }
        }
        
        // Оьображаем на экране
        present(shareController, animated: true, completion: nil)
        
    }
    
}
