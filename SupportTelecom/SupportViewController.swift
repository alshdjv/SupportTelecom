import UIKit
import SnapKit

struct Colors {
    static let primaryLight = UIColor(red: 43/255, green: 45/255, blue: 51/255, alpha: 1.0)
    static let redLight = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
    static let secondaryLight = UIColor(red: 170/255, green: 171/255, blue: 173/255, alpha: 1.0)
    static let primaryDark = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    static let redDark = UIColor(red: 255/255, green: 69/255, blue: 58/255, alpha: 1.0)
    static let secondaryDark = UIColor(red: 128/255, green: 129/255, blue: 133/255, alpha: 1.0)
}

// MARK: - Support View Controller

final class SupportViewController: UIViewController {
    
    private let supportLabel: UILabel = {
        let label = UILabel()
        label.text = "Поддержка"
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    // MARK: - Header content part

    /// MARK: - FirstStackView
    private let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let viewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        return stackView
    }()
    
    /// MARK: - SubStackViews of First StackView - Left View
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
    
    private let dotView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.redLight
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var firstBlockButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionLeftBtn), for: .touchUpInside)
        return button
    }()
    
    @objc func actionLeftBtn() {
        let chatVC = ChatViewController()
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    /// MARK: - SubStackViews of First StackView - Right View
    private let speedLabel: UILabel = {
        let label = UILabel()
        label.text = "Проверить скорость"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let speedImage: UIImageView = {
        let image = UIImage(named: "speed_img")
        let imageView = UIImageView(image: image?.withRenderingMode(.alwaysOriginal))
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var secondBlockButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionRightBtn), for: .touchUpInside)
        return button
    }()
    
    @objc func actionRightBtn() {
        let checkSpeedVC = CheckSpeedViewController()
        self.navigationController?.pushViewController(checkSpeedVC, animated: true)
    }
    
    // MARK: - Middle content part
    
    private var callCentreView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
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
    
    // MARK: - Footer content part
    
    private let requestView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
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
    
    private let requestStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private let toolImage: UIImageView = {
        let image = UIImage(named: "tool_img")
        let imageView = UIImageView(image: image?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    // MARK: - Init viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .secondarySystemBackground
        
        self.setupUI()
    }
    
    // MARK: - Setup Layer & UI
    
    private func setupUI() {
        self.addedSubviews()
        self.setConstraints()
    }
    
    private func addedSubviews() {
        self.view.addSubview(supportLabel)
        self.view.addSubview(viewStackView)
        self.viewStackView.addArrangedSubview(leftView)
        self.viewStackView.addArrangedSubview(rightView)
        
        self.leftView.addSubview(firstBlockButton)
        self.firstBlockButton.addSubview(chatLabel)
        self.firstBlockButton.addSubview(chatImage)
        
        self.rightView.addSubview(secondBlockButton)
        self.secondBlockButton.addSubview(speedLabel)
        self.secondBlockButton.addSubview(speedImage)
        
        self.view.addSubview(callCentreView)
        self.callCentreView.addSubview(tarifNameLabel)
        self.callCentreView.addSubview(operatorImage)
        
        self.view.addSubview(requestView)
        self.requestView.addSubview(requestStackView)
        self.requestStackView.addArrangedSubview(requestLabel)
        self.requestStackView.addArrangedSubview(sendShowLabel)
        self.requestView.addSubview(toolImage)
    }
    
    private func setConstraints() {
        supportLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        // HEADER PART - First StackView what holds two views
        viewStackView.snp.makeConstraints { make in
            make.top.equalTo(self.supportLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        leftView.snp.makeConstraints { make in
            make.top.equalTo(self.viewStackView.snp.top)
            make.leading.equalTo(self.viewStackView.snp.leading)
            make.bottom.equalTo(self.viewStackView.snp.bottom)
            make.height.equalTo(160)
        }
        
        rightView.snp.makeConstraints { make in
            make.top.equalTo(self.viewStackView.snp.top)
            make.trailing.equalTo(self.viewStackView.snp.trailing)
            make.bottom.equalTo(self.viewStackView.snp.bottom)
            make.height.equalTo(160)
        }
        
        // Left View
        firstBlockButton.snp.makeConstraints { make in
            make.top.equalTo(self.leftView.snp.top)
            make.leading.equalTo(self.leftView.snp.leading)
            make.trailing.equalTo(self.leftView.snp.trailing)
            make.bottom.equalTo(self.leftView.snp.bottom)
            make.width.equalTo(self.leftView.snp.width)
        }
        
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(self.firstBlockButton.snp.top).offset(16)
            make.leading.equalTo(self.firstBlockButton.snp.leading).offset(20)
            make.trailing.equalTo(self.firstBlockButton.snp.trailing).offset(-20)
            make.height.equalTo(41)
        }
        
        chatImage.snp.makeConstraints { make in
            make.top.equalTo(self.chatLabel.snp.bottom).offset(12)
            make.trailing.equalTo(self.firstBlockButton.snp.trailing).offset(-16)
            make.size.equalTo(CGSize(width: 72, height: 72))
        }
        
        // Right View
        secondBlockButton.snp.makeConstraints { make in
            make.top.equalTo(self.rightView.snp.top)
            make.leading.equalTo(self.rightView.snp.leading)
            make.trailing.equalTo(self.rightView.snp.trailing)
            make.bottom.equalTo(self.rightView.snp.bottom)
            make.width.equalTo(self.rightView.snp.width)
        }
        
        speedLabel.snp.makeConstraints { make in
            make.top.equalTo(self.secondBlockButton.snp.top).offset(16)
            make.leading.equalTo(self.secondBlockButton.snp.leading).offset(20)
            make.trailing.equalTo(self.secondBlockButton.snp.trailing).offset(-20)
            make.height.equalTo(41)
        }
        
        speedImage.snp.makeConstraints { make in
            make.top.equalTo(self.chatLabel.snp.bottom).offset(16)
            make.leading.equalTo(self.secondBlockButton.snp.leading)
            make.trailing.equalTo(self.secondBlockButton.snp.trailing)
            make.height.equalTo(72)
        }
        
        
        // MIDDLE PART: - Call Centre View
        callCentreView.snp.makeConstraints { make in
            make.top.equalTo(self.viewStackView.snp.bottom).offset(24)
            make.leading.equalTo(self.viewStackView.snp.leading)
            make.trailing.equalTo(self.viewStackView.snp.trailing)
            make.height.equalTo(64)
        }
        
        tarifNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.callCentreView.snp.top).offset(16)
            make.leading.equalTo(self.callCentreView.snp.leading).offset(20)
            make.bottom.equalTo(self.callCentreView.snp.bottom).offset(-24)
            make.height.equalTo(24)
        }
        
        operatorImage.snp.makeConstraints { make in
            make.top.equalTo(self.callCentreView.snp.top).offset(16)
            make.trailing.equalTo(self.callCentreView.snp.trailing).offset(-20)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        
        
        // FOOTER PART: - Request View
        requestView.snp.makeConstraints { make in
            make.top.equalTo(self.callCentreView.snp.bottom).offset(24)
            make.leading.equalTo(self.callCentreView.snp.leading)
            make.trailing.equalTo(self.callCentreView.snp.trailing)
            make.height.equalTo(76)
        }
        
        requestStackView.snp.makeConstraints { make in
            make.top.equalTo(self.requestView.snp.top).offset(16)
            make.leading.equalTo(self.requestView.snp.leading).offset(20)
            make.bottom.equalTo(self.requestView.snp.bottom).offset(-16)
            make.height.equalTo(44)
        }
        
        toolImage.snp.makeConstraints { make in
            make.top.equalTo(self.requestView.snp.top).offset(16)
            make.leading.equalTo(self.requestStackView.snp.trailing).offset(43)
            make.trailing.equalTo(self.requestView.snp.trailing).offset(-20)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
    }
}

// MARK: - Test

final class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Чат с оператором"
    }
}

final class CheckSpeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Проверить скорость"
    }
}
