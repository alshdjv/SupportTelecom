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

final class SupportViewController: UIViewController {
    
    private let supportLabel: UILabel = {
        let label = UILabel()
        label.text = "Поддержка"
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    private let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let viewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .yellow
        return stackView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    private func setupUI() {
        self.addedSubviews()
        self.setConstraints()
    }
    
    private func addedSubviews() {
        view.addSubview(supportLabel)
        view.addSubview(viewStackView)
        viewStackView.addArrangedSubview(leftView)
        viewStackView.addArrangedSubview(rightView)
    }
    
    private func setConstraints() {
        supportLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        viewStackView.snp.makeConstraints { make in
            make.top.equalTo(self.supportLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        leftView.snp.makeConstraints { make in
            make.top.equalTo(self.viewStackView.snp.top)
            make.leading.equalTo(self.viewStackView.snp.leading)
            make.size.equalTo(CGSize(width: 160, height: 160))
        }
        
        rightView.snp.makeConstraints { make in
            make.top.equalTo(self.viewStackView.snp.top)
            make.trailing.equalTo(self.viewStackView.snp.trailing)
            make.size.equalTo(CGSize(width: 160, height: 160))
        }
    }


}

