//
//  MainViewController.swift
//  Spartagram
//
//  Created by 김가빈 on 1/27/24.
//

import UIKit

class MainViewController: UIViewController {
    
    // 버튼을 프로퍼티로 선언합니다.
    let profileButton = UIButton(type: .system)
    // 필요한 만큼 추가 버튼을 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰 컨트롤러의 배경색을 설정
        view.backgroundColor = .white
        
        // 프로필 버튼 초기화 및 배경색 설정
        profileButton.setTitle("프로필 디자인 보기", for: .normal)
        profileButton.backgroundColor = .blue // 버튼의 배경색을 파란색으로 설정
        profileButton.setTitleColor(.white, for: .normal) // 버튼의 타이틀 색상을 흰색으로 설정
        profileButton.addTarget(self, action: #selector(goToProfileDesignViewController(_:)), for: .touchUpInside)
        
        // 뷰에 프로필 버튼 추가
        view.addSubview(profileButton)
        
        // 오토레이아웃을 위해 translatesAutoresizingMaskIntoConstraints 설정을 false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 버튼의 중앙 제약 조건을 설정
        NSLayoutConstraint.activate([
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: 180),
            profileButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    @objc func goToProfileDesignViewController(_ sender: Any) {
        // '현재 뷰 컨트롤러가 속해 있는 스토리보드를 참조
        if let profileDesignVC = storyboard?.instantiateViewController(withIdentifier: "ProfileDesignViewController") as? ProfileDesignViewController {
            if let navigationController = self.navigationController {
                // 네비게이션 스택에 뷰 컨트롤러를 푸시
                navigationController.pushViewController(profileDesignVC, animated: true)
            } else {
                // 네비게이션 컨트롤러가 없다면 뷰 컨트롤러를 모달로 표시
                self.present(profileDesignVC, animated: true, completion: nil)
            }
        }
    }
    
}
