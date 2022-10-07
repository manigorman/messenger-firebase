//
//  ConversationCell.swift
//  Messenger
//
//  Created by Igor Manakov on 03.10.2022.
//

import UIKit
import SnapKit

final class ConversationCell: UITableViewCell {
    
    static let identifier = "conversationCellId"
    
    struct Model {
        let image: UIImage
        let title: String
        let subtitle: String
        let date: String
    }
    
    // UI
    private lazy var image = UIImageView()
    private lazy var titleStack = UIStackView()
    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var dateLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
        setUpConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: - Private
    
    private func setUpUI() {
        image.contentMode = .scaleToFill
//        image.layer.cornerRadius = 25
        image.layer.masksToBounds = true
        
        titleStack.axis = .vertical
        titleStack.distribution = .fillEqually
        titleStack.spacing = 4
        
        titleLabel.font = .systemFont(ofSize: 17, weight: .regular)
        
        subtitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        subtitleLabel.textColor = .secondaryLabel
        
        dateLabel.font = .systemFont(ofSize: 15, weight: .regular)
        dateLabel.textColor = .secondaryLabel
    }
    
    private func setUpConstraints() {
        contentView.addSubview(image)
        image.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        contentView.addSubview(titleStack)
        titleStack.addArrangedSubview(titleLabel)
        titleStack.addArrangedSubview(subtitleLabel)
        
        titleStack.snp.makeConstraints {
            $0.leading.equalTo(image.snp.trailing).offset(16)
            $0.top.bottom.equalToSuperview().inset(8)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(titleStack.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    func configure(with model: Model) {
        self.image.image = model.image
        self.titleLabel.text = model.title
        self.subtitleLabel.text = model.subtitle
        self.dateLabel.text = model.date
    }
}
