import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    let backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qwe")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather App by BK est.2024"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var goButton: UIButton = {
        let button = UIButton()
        button.setTitle("🌤️❄️🌧️", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    private func setUI() {
        view = backImage
        backImage.addSubview(welcomeLabel)
        backImage.addSubview(goButton)
        setConstraints()
    }
    
    private func setConstraints() {
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.centerX.equalToSuperview()
        }
    
        goButton.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            
        }
    }
    
    @objc func buttonTap() {
        print("Tapped")
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
}



