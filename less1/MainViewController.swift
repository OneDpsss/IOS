import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let imageNames = ["кабачок", "Матвей", "Морковь"]
    var images = [UIImage]()
    var index = 0
    
    // MARK: - Subviews
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var imageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var prevButton: UIButton = {
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(.init { [weak self] _ in
            self?.showPrevImage()
        }, for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вперед", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(.init { [weak self] _ in
            self?.showNextImage()
        }, for: .touchUpInside)
        return button
    }()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
        configureUI()
        updateImage()
    }

    private func updateImage() {
        guard images.indices.contains(index) else { return }
        imageView.image = images[index]
        imageLabel.text = imageNames[index]
    }

    private func showPrevImage() {
        index = (index - 1 + images.count) % images.count
        updateImage()
    }

    private func showNextImage() {
        index = (index + 1) % images.count
        updateImage()
    }
    
    private func loadImages() {
        for imageName in imageNames {
            if let image = UIImage(named: imageName) {
                images.append(image)
            } else {
                print("Не удалось найти изображение с именем \(imageName)")
            }
        }
    }

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(imageLabel)
        view.addSubview(prevButton)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            imageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            prevButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            prevButton.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            nextButton.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 20)
        ])
    }
}

extension MainViewController: UITextFieldDelegate { }
