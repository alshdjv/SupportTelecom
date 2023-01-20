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
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    // MARK: - Header content part
    
    /// MARK: - Horizontal StackView
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
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    /// MARK: - SubStackViews of Horizontal StackView - Left View
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
        view.clipsToBounds = true
        return view
    }()
    
    private let labelInsideDotView: UIView = {
        let label = UILabel()
        label.text = "4"
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
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
    
    /// MARK: - SubStackViews of Horizontal StackView - Right View
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
    
    private lazy var callCentreButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionCallCentreBtn), for: .touchUpInside)
        return button
    }()
    
    @objc func actionCallCentreBtn() {
        let callCentreVC = CallCentreViewController()
        self.navigationController?.pushViewController(callCentreVC, animated: true)
    }
    
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
    
    private let toolImage: UIImageView = {
        let image = UIImage(named: "tool_img")
        let imageView = UIImageView(image: image?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var requestButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionRequestBtn), for: .touchUpInside)
        return button
    }()
    
    @objc func actionRequestBtn() {
        let requestVC = RequestViewController()
        self.navigationController?.pushViewController(requestVC, animated: true)
    }

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
        self.view.addSubview(mainStackView)
        
        self.mainStackView.addArrangedSubview(horizontalStackView)
        self.horizontalStackView.addArrangedSubview(leftView)
        self.horizontalStackView.addArrangedSubview(rightView)
        
        self.leftView.addSubview(firstBlockButton)
        self.firstBlockButton.addSubview(dotView)
        self.dotView.addSubview(labelInsideDotView)
        self.firstBlockButton.addSubview(chatLabel)
        self.firstBlockButton.addSubview(chatImage)
        
        self.rightView.addSubview(secondBlockButton)
        self.secondBlockButton.addSubview(speedLabel)
        self.secondBlockButton.addSubview(speedImage)
        
        self.mainStackView.addArrangedSubview(callCentreView)
        self.callCentreView.addSubview(callCentreButton)
        self.callCentreButton.addSubview(tarifNameLabel)
        self.callCentreButton.addSubview(operatorImage)

        self.mainStackView.addArrangedSubview(requestView)
        self.requestView.addSubview(requestButton)
        self.requestButton.addSubview(requestLabel)
        self.requestButton.addSubview(sendShowLabel)
        self.requestButton.addSubview(toolImage)
    }
    
    private func setConstraints() {
        supportLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(self.supportLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        // HEADER PART - First StackView what holds two views
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(self.mainStackView.snp.top)
            make.leading.equalTo(self.mainStackView.snp.leading)
            make.trailing.equalTo(self.mainStackView.snp.trailing)
        }
        
        leftView.snp.makeConstraints { make in
            make.top.equalTo(self.horizontalStackView.snp.top)
            make.leading.equalTo(self.horizontalStackView.snp.leading)
            make.bottom.equalTo(self.horizontalStackView.snp.bottom)
            make.size.equalTo(CGSize(width: 160, height: 160))
        }
        
        rightView.snp.makeConstraints { make in
            make.top.equalTo(self.horizontalStackView.snp.top)
            make.trailing.equalTo(self.horizontalStackView.snp.trailing)
            make.bottom.equalTo(self.horizontalStackView.snp.bottom)
            make.size.equalTo(CGSize(width: 160, height: 160))
        }
        
        // Left View
        firstBlockButton.snp.makeConstraints { make in
            make.top.equalTo(self.leftView.snp.top)
            make.leading.equalTo(self.leftView.snp.leading)
            make.trailing.equalTo(self.leftView.snp.trailing)
            make.bottom.equalTo(self.leftView.snp.bottom)
            make.width.equalTo(self.leftView.snp.width)
        }
        
        // --------------------------
        dotView.snp.makeConstraints { make in
            make.top.equalTo(self.leftView.snp.top).offset(-8)
            make.trailing.equalTo(self.leftView.snp.trailing).offset(8)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        labelInsideDotView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        // ----------------------------
        
        
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
            make.leading.equalTo(self.horizontalStackView.snp.leading)
            make.trailing.equalTo(self.horizontalStackView.snp.trailing)
            make.height.equalTo(64)
        }

        callCentreButton.snp.makeConstraints { make in
            make.top.equalTo(self.callCentreView.snp.top)
            make.leading.equalTo(self.callCentreView.snp.leading)
            make.trailing.equalTo(self.callCentreView.snp.trailing)
            make.bottom.equalTo(self.callCentreView.snp.bottom)
            make.width.equalTo(self.callCentreView.snp.width)
        }

        tarifNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.callCentreButton.snp.top).offset(16)
            make.leading.equalTo(self.callCentreButton.snp.leading).offset(20)
            make.bottom.equalTo(self.callCentreButton.snp.bottom).offset(-24)
            make.height.equalTo(24)
        }

        operatorImage.snp.makeConstraints { make in
            make.top.equalTo(self.callCentreButton.snp.top).offset(16)
            make.trailing.equalTo(self.callCentreButton.snp.trailing).offset(-20)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }

        
        // FOOTER PART: - Request View
        requestView.snp.makeConstraints { make in
            make.leading.equalTo(self.callCentreView.snp.leading)
            make.trailing.equalTo(self.callCentreView.snp.trailing)
            make.height.equalTo(76)
        }

        requestButton.snp.makeConstraints { make in
            make.top.equalTo(self.requestView.snp.top)
            make.leading.equalTo(self.requestView.snp.leading)
            make.trailing.equalTo(self.requestView.snp.trailing)
            make.bottom.equalTo(self.requestView.snp.bottom)
            make.width.equalTo(self.requestView.snp.width)
        }
        
        requestLabel.snp.makeConstraints { make in
            make.top.equalTo(self.requestButton.snp.top).offset(16)
            make.leading.equalTo(self.requestButton.snp.leading).offset(20)
            make.height.equalTo(24)
        }
        
        sendShowLabel.snp.makeConstraints { make in
            make.top.equalTo(self.requestLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.requestLabel.snp.leading)
            make.height.equalTo(16)
        }

        toolImage.snp.makeConstraints { make in
            make.top.equalTo(self.requestButton.snp.top).offset(16)
            make.trailing.equalTo(self.requestButton.snp.trailing).offset(-20)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
    }
}

// MARK: - Test
final class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.topItem?.title = " "
        self.title = "Чат с оператором"
    }
}

final class CheckSpeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.topItem?.title = " "
        self.title = "Проверить скорость"
    }
}

final class CallCentreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.topItem?.title = " "
        self.title = "Звонок в колл-центр"
    }
}

final class RequestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.topItem?.title = " "
        self.title = "Мои заявки"
    }
}
