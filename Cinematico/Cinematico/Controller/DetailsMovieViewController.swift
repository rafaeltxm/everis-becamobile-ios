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
            recarregaImagens(movie)
            self.titleMovie.text = movie.nome
            self.ratingMovie.text = String(movie.rating)
            self.sinopseMovie.text = movie.sinopse
        }
        
        posterMovie.layer.borderWidth = 0.5
        posterMovie.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        posterMovie.layer.cornerRadius = 5
    }
    
    @IBAction func buttonVoltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func recarregaImagens(_ movie: Movie){
        // recarrega imagem fundo do filme
        guard let urlFundo = movie.caminhoImagemFundo else { return }
        guard let urlFinalFundo = URL(string: urlFundo) else { return }
        self.backgroudMovie.load(url: urlFinalFundo)
        // recarrega poster do filme
        guard let urlPoster = movie.caminhoImagem else { return }
        guard let urlPosterFinal = URL(string: urlPoster) else { return }
        self.posterMovie.load(url: urlPosterFinal)
    }
}
