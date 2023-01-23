import UIKit

class RequestView: UIView {
    
    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои заявки"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let sendShowLabel: UILabel = {
        let label = UILabel()
        label.text = "Отправить или просмотреть заявку"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = Colors.secondaryLight
        return label
    }()
    
    private let toolImage: UIImageView = {
        let image = UIImage(named: "tool_img")
        let imageView = UIImageView(image: image?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var requestButton: UIButton = {
        let button = UIButton()
//        button.addTarget(self, action: #selector(actionRequestBtn), for: .touchUpInside)
        return button
    }()
    
//    @objc func actionRequestBtn() {
//        let requestVC = RequestViewController()
//        self.navigationController?.pushViewController(requestVC, animated: true)
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
        self.addSubview(requestLabel)
        self.addSubview(sendShowLabel)
        self.addSubview(toolImage)
        self.addSubview(requestButton)
        
        self.setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        
        requestLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.height.equalTo(24)
        }
        
        sendShowLabel.snp.makeConstraints { make in
            make.top.equalTo(self.requestLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.requestLabel.snp.leading)
            make.height.equalTo(16)
        }

        toolImage.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        
        requestButton.snp.makeConstraints { make in
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
