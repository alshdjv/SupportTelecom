import UIKit
import SnapKit

struct Colors {
    static let redLight = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
    static let secondaryLight = UIColor(red: 170/255, green: 171/255, blue: 173/255, alpha: 1.0)
}

// MARK: - Support View Controller
final class SupportViewController: UIViewController {
    
    private let chatView = ChatView()
    private let speedView = SpeedView()
    private let callCentreView = CallCentreView()
    private let requestView = RequestView()
    
    var labelCount: Int = 0
    
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
        
        self.configure(number: 10)
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
    
    // MARK: - Functions
    
    public func configure(number: Int) {
        labelCount = number

        for _ in 0..<labelCount {
            let view = chatView
            let dot = chatView.dotView
            let label = view.labelInsideDotView
            if labelCount == 0 {
                dot.isHidden = true
                label.isHidden = true
            } else {
                dot.isHidden = false
                label.isHidden = false
            }
            label.text = String(labelCount)
            dot.addSubview(label)
        }
    }
}
