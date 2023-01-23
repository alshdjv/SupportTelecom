//import UIKit
//
//final class SpeedView: UIView {
//    
//    private let speedLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Проверить скорость"
//        label.font = .systemFont(ofSize: 17, weight: .semibold)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let speedImage: UIImageView = {
//        let image = UIImage(named: "speed_img")
//        let imageView = UIImageView(image: image?.withRenderingMode(.alwaysOriginal))
//        imageView.layer.masksToBounds = true
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    private lazy var speedButton: UIButton = {
//        let button = UIButton()
////        button.addTarget(self, action: #selector(speedButton()), for: .touchUpInside)
//        return button
//    }()
//    
////    @objc func speedButton() {
////        let checkSpeedVC = CheckSpeedViewController()
////        self.navigationController?.pushViewController(checkSpeedVC, animated: true)
////    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.setupLayer()
//        self.setupViewUI()
//    }
//    
//    private func setupLayer() {
//        self.backgroundColor = .systemBackground
//        self.layer.cornerRadius = 20
//    }
//    
//    private func setupViewUI() {
//        self.addSubview(speedLabel)
//        self.addSubview(speedImage)
//        self.addSubview(speedButton)
//        
//        self.setupViewConstraints()
//    }
//    
//    private func setupViewConstraints() {
//        
//        speedLabel.snp.makeConstraints { make in
//            make.top.equalTo(self.snp.top).offset(16)
//            make.leading.equalTo(self.snp.leading).offset(20)
//            make.trailing.equalTo(self.snp.trailing).offset(-20)
//            make.height.equalTo(41)
//        }
//        
//        speedImage.snp.makeConstraints { make in
//            make.top.equalTo(self.speedLabel.snp.bottom).offset(16)
//            make.leading.equalTo(self.snp.leading)
//            make.trailing.equalTo(self.snp.trailing)
//            make.height.equalTo(72)
//        }
//        
//        speedButton.snp.makeConstraints { make in
//            make.top.equalTo(self.snp.top)
//            make.leading.equalTo(self.snp.leading)
//            make.trailing.equalTo(self.snp.trailing)
//            make.bottom.equalTo(self.snp.bottom)
//            make.width.equalTo(self.snp.width)
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
