//
//  PlacesCell.swift
//  ScavangerHunt
//
//  Created by Carlos Sac on 9/23/25.
//

import UIKit

class PlacesCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedImageView: UIImageView!


    func configure(with task: Task) {
        titleLabel.text = task.title
        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
        completedImageView.image = UIImage(systemName: task.isComplete ? "circle.inset.filled" : "circle")?.withRenderingMode(.alwaysTemplate)
        completedImageView.tintColor = task.isComplete ? .systemGreen : .tertiaryLabel
    }

}
