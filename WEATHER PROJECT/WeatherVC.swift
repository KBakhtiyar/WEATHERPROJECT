import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    let netWorkManager = NetworkManager.shared
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wq")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "ASTANA"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var getWeatherButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET WEATHER", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    private func setUI() {
        view = backgroundImage
        backgroundImage.addSubview(cityLabel)
       // backgroundImage.addSubview(cityTextField)
        backgroundImage.addSubview(weatherLabel)
        backgroundImage.addSubview(getWeatherButton)
        setConstraints()
    }
    
    private func setConstraints() {
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.centerX.equalToSuperview()
        }
        
       /* cityTextField.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(90)
            make.centerX.equalToSuperview()
        } */
       weatherLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
       }
        getWeatherButton.snp.makeConstraints { make in
           make.top.equalTo(weatherLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }

@objc
func buttonTapped() {
    print("Button was tapped")
    netWorkManager.getWeatherData { weatherData in
        DispatchQueue.main.async {
            if let weatherData = weatherData {
                self.weatherLabel.text = "\(String(describing: weatherData.temperature))\n\(String(describing: weatherData.wind))"
                //self.weatherLabel.text = "\(weatherData.temperature)\n\(weatherData.wind)"
            }
         }
      }
    }
 }

