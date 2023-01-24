import UIKit
import SnapKit

struct Colors {
    static let redLight = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
    static let secondaryLight = UIColor(red: 170/255, green: 171/255, blue: 173/255, alpha: 1.0)
}

// MARK: - Chat View

final class ChatView: UIView {
    
    var labelCount: Int = 0
    
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
    
    private let chatButton: UIButton = {
        let button = UIButton()
        return button
    }()
        
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
    
    // MARK: - Functions
    
    public func configure(number: Int) {
        labelCount = number
        
        for _ in 0..<labelCount {
            let view = dotView
            let label = labelInsideDotView
            
            /// If value of labelCount is equal to 0
            if labelCount == 0 {
                /// The values of view and label will be hidden
                view.isHidden = true
                label.isHidden = true
            } else {
                /// else, the values will be false
                view.isHidden = false
                label.isHidden = false
            }
            label.text = String(labelCount)
            view.addSubview(label)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Speed View

final class SpeedView: UIView {
    
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
    
    private let speedButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
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
        self.addSubview(speedLabel)
        self.addSubview(speedImage)
        self.addSubview(speedButton)
        
        self.setupViewConstraints()
    }
    
    private func setupViewConstraints() {
        
        speedLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.height.equalTo(41)
        }
        
        speedImage.snp.makeConstraints { make in
            make.top.equalTo(self.speedLabel.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(72)
        }
        
        speedButton.snp.makeConstraints { make in
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

// MARK: - Call Centre View

final class CallCentreView: UIView {
    
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
    
    private let callCentreButton: UIButton = {
        let button = UIButton()
        return button
    }()

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

// MARK: - Request View

final class RequestView: UIView {
    
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
    
    private let requestButton: UIButton = {
        let button = UIButton()
        return button
    }()

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


// MARK: - Support View Controller

final class SupportViewController: UIViewController {
    
    private let chatView = ChatView()
    private let speedView = SpeedView()
    private let callCentreView = CallCentreView()
    private let requestView = RequestView()
    
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
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

    // MARK: - Init viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .secondarySystemBackground
        /// Calling configure method from Chat View to set value for dotView
        /// If value is equal to 0
        /// dotView dissapears
        /// Else, It will color the point red and set the value to the dotView
        self.chatView.configure(number: 25)
        
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
        
        self.horizontalStackView.addArrangedSubview(chatView)
        self.horizontalStackView.addArrangedSubview(speedView)
        self.mainStackView.addArrangedSubview(horizontalStackView)
        
        self.mainStackView.addArrangedSubview(callCentreView)

        self.mainStackView.addArrangedSubview(requestView)
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
        
        // TOP PART
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(self.mainStackView.snp.top)
            make.leading.equalTo(self.mainStackView.snp.leading)
            make.trailing.equalTo(self.mainStackView.snp.trailing)
        }
        
        chatView.snp.makeConstraints { make in
            make.top.equalTo(self.horizontalStackView.snp.top)
            make.leading.equalTo(self.horizontalStackView.snp.leading)
            make.bottom.equalTo(self.horizontalStackView.snp.bottom)
            make.size.equalTo(CGSize(width: 160, height: 160))
        }
        
        speedView.snp.makeConstraints { make in
            make.top.equalTo(self.horizontalStackView.snp.top)
            make.trailing.equalTo(self.horizontalStackView.snp.trailing)
            make.bottom.equalTo(self.horizontalStackView.snp.bottom)
            make.size.equalTo(CGSize(width: 160, height: 160))
        }
        
        // MIDDLE PART
        callCentreView.snp.makeConstraints { make in
            make.leading.equalTo(self.horizontalStackView.snp.leading)
            make.trailing.equalTo(self.horizontalStackView.snp.trailing)
            make.height.equalTo(64)
        }
        
        // FOOTER PART
        requestView.snp.makeConstraints { make in
            make.leading.equalTo(self.mainStackView.snp.leading)
            make.trailing.equalTo(self.mainStackView.snp.trailing)
            make.height.equalTo(76)
        }
    }
}
