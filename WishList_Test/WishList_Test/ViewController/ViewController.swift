//
//  ViewController.swift
//  WishList_Test
//
//  Created by 김가빈 on 1/5/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    private var currentProduct: RemoteProduct? {
        didSet {
            guard let currentProduct = self.currentProduct else { return }
            DispatchQueue.main.async {
                self.imageView.image = nil
                self.titleLabel?.text = currentProduct.title
                self.descriptionLabel?.text = currentProduct.description
                self.priceLabel?.text = "\(currentProduct.price)$"
            }
            
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: currentProduct.thumbnail), let image = UIImage(data: data) {
                    DispatchQueue.main.async { self?.imageView?.image = image }
                }
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchRemoteProduct()
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.fetchRemoteProduct()
//    }
    
    // 다른 상품 보기 버튼 클릭 시 호출되는 액션
    @IBAction func tappedSkipButton(_ sender: UIButton) {
        self.fetchRemoteProduct()
    }
    
    // 위시리스트 담기 버튼 클릭 시 호출되는 액션
    @IBAction func tappedSaveProductButton(_ sender: UIButton) {
        self.saveWishProduct() // CoreData에 상품을 저장하는 함수 호출
    }
    
    // 위시리스트 보기 버튼 클릭 시 호출 되는 액션
    @IBAction func tappedPresentWishList(_ sender: UIButton) {
        // WishListViewController를 가져옵니다
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "WishListViewController") as? WishListViewController else { return }
        
        // WishListViewController를 present 합니다
        self.present(nextVC, animated: true)
    }
    
    // URLSession을 통해 RemoteProduct를 가져와 currentProduct 변수에 저장
    private func fetchRemoteProduct() {
        let productID = Int.random(in: 1 ... 100)
        guard let url = URL(string: "https://dummyjson.com/products/\(productID)") else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                // 에러 처리
                print("Error: \(error)")
            } else if let data = data {
                do {
                    // 데이터 디코드
                    let product = try JSONDecoder().decode(RemoteProduct.self, from: data)
                    DispatchQueue.main.async {
                        // 메인 스레드에서 currentProduct 업데이트
                        self?.currentProduct = product
                    }
                } catch {
                    // 디코드 에러 처리
                    print("Decode Error: \(error)")
                }
            }
        }
        task.resume()
    }
}

extension ViewController {
    private func saveWishProduct() {
        // CoreData의 context 가져오기
        guard let context = self.persistentContainer?.viewContext else { return }
        
        // 현재 선택된 제품 가져오기
        guard let currentProduct = self.currentProduct else { return }
        
        // CoreData에 저장할 새 Product 객체 생성
        let wishProduct = Product(context: context)
        
        // currentProduct의 정보를 wishProduct에 할당
        wishProduct.id = Int64(currentProduct.id)
        wishProduct.title = currentProduct.title
        wishProduct.price = currentProduct.price
        
        // CoreData에 저장 시도
        do {
            try context.save()
        } catch {
            print("Saving Error: \(error)")
        }
    }
}
