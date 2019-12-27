import UIKit

class TooltipView: UIView {
    
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let accentColor: UIColor
    
    init(accentColor: UIColor) {
        self.accentColor = accentColor
        super.init(frame: .zero)
        
        layer.borderWidth = 2
        backgroundColor = .white
        isUserInteractionEnabled = false
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(title: String, price: Double, date: String) {
        titleLabel.text = title
        priceLabel.text = "\((price * 100).rounded() / 100)"
        dateLabel.text = date
    }
    
    private func setupSubviews() {
        self.layer.borderColor = accentColor.cgColor
        
        titleLabel.textColor = accentColor
        priceLabel.textColor = .darkText
        dateLabel.textColor = .darkText
        
        priceLabel.font = .systemFont(ofSize: 24)
        
        titleLabel.textAlignment = .natural
        priceLabel.textAlignment = .natural
        dateLabel.textAlignment = .natural
        
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(dateLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            dateLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: padding),
            dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -padding),
        ])

    }
    
}
