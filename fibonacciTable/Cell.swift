//
//  Cell.swift
//  fibonacciTable
//
//  Created by Алексей Попроцкий on 12.09.2022.
//

import UIKit

class Cell: UITableViewCell {

    static let identifier = "Cell"
    
    let viewOne: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let viewTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let lblOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let lblTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true

        return label
    }()
    
    
    func setupColorCell(indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            viewOne.backgroundColor = .white
            viewTwo.backgroundColor = .systemGray5
        } else {
            viewOne.backgroundColor = .systemGray5
            viewTwo.backgroundColor = .white
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        contentView.addSubview(viewOne)
        contentView.addSubview(viewTwo)
        
        viewOne.addSubview(lblOne)
        viewTwo.addSubview(lblTwo)
    }
    
    func setupConstraints() {
        
        viewOne.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        viewOne.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        viewOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        viewOne.widthAnchor.constraint(equalToConstant: contentView.frame.width/2).isActive = true
        
        viewTwo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        viewTwo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        viewTwo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        viewTwo.leadingAnchor.constraint(equalTo: viewOne.trailingAnchor).isActive = true
        
        lblOne.topAnchor.constraint(equalTo: viewOne.topAnchor).isActive = true
        lblOne.bottomAnchor.constraint(equalTo: viewOne.bottomAnchor).isActive = true
        lblOne.leadingAnchor.constraint(equalTo: viewOne.leadingAnchor, constant: 16).isActive = true
        lblOne.trailingAnchor.constraint(equalTo: viewOne.trailingAnchor, constant: -16).isActive = true
        
        lblTwo.topAnchor.constraint(equalTo: viewTwo.topAnchor).isActive = true
        lblTwo.bottomAnchor.constraint(equalTo: viewTwo.bottomAnchor).isActive = true
        lblTwo.leadingAnchor.constraint(equalTo: viewTwo.leadingAnchor, constant: 16).isActive = true
        lblTwo.trailingAnchor.constraint(equalTo: viewTwo.trailingAnchor, constant: -16).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
