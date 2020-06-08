//
//  DetailsMovieViewController.swift
//  Cinematico
//
//  Created by Rafael Teixeira Martins on 08/06/20.
//  Copyright © 2020 Rafael Teixeira Martins. All rights reserved.
//

import UIKit

class DetailsMovieViewController: UIViewController {

    @IBOutlet weak var backgroudMovie: UIImageView!
    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var ratingMovie: UILabel!
    @IBOutlet weak var sinopseMovie: UILabel!
    
    var selectedMovie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie =  selectedMovie {
            guard let urlFundo = movie.caminhoImagemFundo else { return }
            guard let urlFinalFundo = URL(string: urlFundo) else { return }
            self.backgroudMovie.load(url: urlFinalFundo)
            guard let urlPoster = movie.caminhoImagem else { return }
            guard let urlPosterFinal = URL(string: urlPoster) else { return }
            self.posterMovie.load(url: urlPosterFinal)
            self.titleMovie.text = movie.nome
            self.ratingMovie.text = String(movie.rating)
            self.sinopseMovie.text = movie.sinopse
        }
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
