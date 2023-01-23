import UIKit

class CallCentreView: UIView {
    
    private let tarifNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Звонок в колл-центр"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let operatorImage: UIImageView = {
        let image = UIImage(named: "call_centre")
        let imageView = UIImageView(image: image?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var callCentreButton: UIButton = {
        let button = UIButton()
//        button.addTarget(self, action: #selector(actionCallCentreBtn), for: .touchUpInside)
        return button
    }()
    
//    @objc func actionCallCentreBtn() {
//        let callCentreVC = CallCentreViewController()
//        self.navigationController?.pushViewController(callCentreVC, animated: true)
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayer()
        self.setupViewUI()
    }
    
    private func setupLayer() {
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 20
    }
    
    private func setupViewUI() {
        self.addSubview(tarifNameLabel)
        self.addSubview(operatorImage)
        self.addSubview(callCentreButton)
        
        self.setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        
        tarifNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.bottom.equalTo(self.snp.bottom).offset(-24)
            make.height.equalTo(24)
        }

        operatorImage.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }

        callCentreButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalTo(self.snp.width)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
