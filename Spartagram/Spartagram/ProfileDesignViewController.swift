

import UIKit

class ProfileDesignViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let profileImageView = UIImageView()
    let usernameLabel = UILabel()
    let userBioNameLabel = UILabel()
    let userBioLabel = UILabel()
    let linkInBioLabel = UILabel()
    
    let followButton = UIButton()
    let messageButton = UIButton()
    
    let postsLabel = UILabel()
    let followersLabel = UILabel()
    let followingLabel = UILabel()
    let postsCountLabel = UILabel()
    let followersCountLabel = UILabel()
    let followingCountLabel = UILabel()
    let userInfoStackView = UIStackView()
    
    let color: UIColor? = UIColor(named: "AccentColor")
    
    let galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        // Scroll View
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // contentView에 scrollView 추가
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // 다른 모든 뷰들을 contentView에 추가
        contentView.addSubview(profileImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(userBioNameLabel)
        contentView.addSubview(userBioLabel)
        contentView.addSubview(linkInBioLabel)
        contentView.addSubview(followButton)
        contentView.addSubview(messageButton)
        contentView.addSubview(postsLabel)
        contentView.addSubview(followersLabel)
        contentView.addSubview(followingLabel)
        contentView.addSubview(postsCountLabel)
        contentView.addSubview(followersCountLabel)
        contentView.addSubview(followingCountLabel)
        contentView.addSubview(userInfoStackView)
        contentView.addSubview(galleryCollectionView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        userBioNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userBioLabel.translatesAutoresizingMaskIntoConstraints = false
        linkInBioLabel.translatesAutoresizingMaskIntoConstraints = false
        followButton.translatesAutoresizingMaskIntoConstraints = false
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        postsLabel.translatesAutoresizingMaskIntoConstraints = false
        followersLabel.translatesAutoresizingMaskIntoConstraints = false
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        postsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        followersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        followingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    private func setupConstraints() {
        // ScrollView 제약 조건
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1000)
        ])
        

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8), // safeArea의 상단으로부터 8포인트 떨어진 위치
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16), // contentView의 선행(왼쪽) 에지로부터 16포인트 떨어진 위치
            profileImageView.widthAnchor.constraint(equalToConstant: 100), // 너비 100포인트
            profileImageView.heightAnchor.constraint(equalToConstant: 100) // 높이 100포인트
        ])
        
        // 사용자 이름 라벨 제약 조건
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            // usernameLabel의 너비를 contentView에 맞추고 좌우 여백을 설정하여 중앙 정렬 효과를 낼 수 있습니다.
        ])
        
        // 팔로우 버튼 제약 조건 (새로 추가)
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            followButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 80),
            followButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        // 사용자 Bio 이름 라벨 제약 조건
        NSLayoutConstraint.activate([
            userBioNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 195),
            userBioNameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            userBioNameLabel.widthAnchor.constraint(equalToConstant: 38),
            userBioNameLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        // 사용자 Bio 라벨 제약 조건
        NSLayoutConstraint.activate([
            userBioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 21),
            userBioLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            userBioLabel.widthAnchor.constraint(equalToConstant: 345),
            userBioLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        // Link in Bio 라벨 제약 조건
        NSLayoutConstraint.activate([
            linkInBioLabel.topAnchor.constraint(equalTo: userBioLabel.bottomAnchor, constant: 19),
            linkInBioLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            linkInBioLabel.widthAnchor.constraint(equalToConstant: 121),
            linkInBioLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        
        NSLayoutConstraint.activate([
            userInfoStackView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            userInfoStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            userInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            userInfoStackView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 16),
            userInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userInfoStackView.heightAnchor.constraint(equalToConstant: 32)
            // 스택 뷰의 높이 설정
        ])
        
        // postsCountLabel, followersCountLabel, followingCountLabel 제약 조건
        
        // postsCountLabel 제약 조건
        NSLayoutConstraint.activate([
            postsCountLabel.topAnchor.constraint(equalTo: postsLabel.bottomAnchor, constant: 4),
            postsCountLabel.leadingAnchor.constraint(equalTo: postsLabel.leadingAnchor),
            postsCountLabel.trailingAnchor.constraint(equalTo: postsLabel.trailingAnchor)
        ])
        
        // followersCountLabel 제약 조건
        NSLayoutConstraint.activate([
            followersCountLabel.topAnchor.constraint(equalTo: followersLabel.bottomAnchor, constant: 4),
            followersCountLabel.leadingAnchor.constraint(equalTo: followersLabel.leadingAnchor),
            followersCountLabel.trailingAnchor.constraint(equalTo: followersLabel.trailingAnchor)
        ])
        
        // followingCountLabel 제약 조건
        NSLayoutConstraint.activate([
            followingCountLabel.topAnchor.constraint(equalTo: followingLabel.bottomAnchor, constant: 4),
            followingCountLabel.leadingAnchor.constraint(equalTo: followingLabel.leadingAnchor),
            followingCountLabel.trailingAnchor.constraint(equalTo: followingLabel.trailingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            postsCountLabel.topAnchor.constraint(equalTo: postsLabel.bottomAnchor, constant: 0),
            postsCountLabel.leadingAnchor.constraint(equalTo: postsLabel.leadingAnchor),
            postsCountLabel.widthAnchor.constraint(equalToConstant: 10),
            postsCountLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            followersCountLabel.topAnchor.constraint(equalTo: followersLabel.bottomAnchor, constant: 0),
            followersCountLabel.leadingAnchor.constraint(equalTo: followersLabel.leadingAnchor),
            followersCountLabel.widthAnchor.constraint(equalToConstant: 10),
            followersCountLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            followingCountLabel.topAnchor.constraint(equalTo: followingLabel.bottomAnchor, constant: 0),
            followingCountLabel.leadingAnchor.constraint(equalTo: followingLabel.leadingAnchor),
            followingCountLabel.widthAnchor.constraint(equalToConstant: 10),
            followingCountLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        
        // Gallery Collection View 제약 조건
        NSLayoutConstraint.activate([
            galleryCollectionView.topAnchor.constraint(equalTo: linkInBioLabel.bottomAnchor, constant: 8),
            galleryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            galleryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            galleryCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20) //하단 여백을 20으로 설정
        ])
    }
}


extension ProfileDesignViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items in the section
        return 9 // For example
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? GalleryCell else {
            return UICollectionViewCell()
        }
        // Configure the cell
        return cell
    }
}

class GalleryCell: UICollectionViewCell {
    // Set up gallery cell views
}
