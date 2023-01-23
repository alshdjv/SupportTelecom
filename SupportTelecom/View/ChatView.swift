import UIKit

final class ChatView: UIView {
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "Чат с оператором"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let chatImage: UIImageView = {
        let image = UIImage(named: "chat_bubble")
        let imageView = UIImageView(image: image?.withRenderingMode(.alwaysOriginal))
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let dotView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.redLight
        view.layer.cornerRadius = 12
        view.isHidden = true
        view.clipsToBounds = true
        return view
    }()
    
    public let labelInsideDotView: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var chatButton: UIButton = {
        let button = UIButton()
//        button.addTarget(self, action: #selector(actionLeftBtn), for: .touchUpInside)
        return button
    }()
    
//    @objc func actionLeftBtn() {
//        let chatVC = ChatViewController()
//        self.navigationController?.pushViewController(chatVC, animated: true)
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
        self.addSubview(dotView)
        self.dotView.addSubview(labelInsideDotView)
        self.addSubview(chatLabel)
        self.addSubview(chatImage)
        self.addSubview(chatButton)
        
        self.setupViewConstraints()
    }
    
    private func setupViewConstraints() {
     
        dotView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(-8)
            make.trailing.equalTo(self.snp.trailing).offset(8)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        labelInsideDotView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.height.equalTo(41)
        }
        
        chatImage.snp.makeConstraints { make in
            make.top.equalTo(chatLabel.snp.bottom).offset(12)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.size.equalTo(CGSize(width: 72, height: 72))
        }
        
        chatButton.snp.makeConstraints { make in
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
