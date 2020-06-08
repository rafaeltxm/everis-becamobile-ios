//
//  MoviesCollectionViewCell.swift
//  Cinematico
//
//  Created by Rafael Teixeira Martins on 08/06/20.
//  Copyright © 2020 Rafael Teixeira Martins. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var imagemPoster: UIImageView!
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
