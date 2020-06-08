//
//  ViewController.swift
//  Cinematico
//
//  Created by Rafael Teixeira Martins on 08/06/20.
//  Copyright © 2020 Rafael Teixeira Martins. All rights reserved.
//

import UIKit
import CoreData

class MoviesTrendViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var collectionTrendMovies: UICollectionView!
    
    //MARK: - Atributos
    
    var listMoviesTrend: Array<Movie> = []
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionTrendMovies.dataSource = self
        collectionTrendMovies.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recoveryMovies()
    }
    
    func recoveryMovies() {
        Repository().recoveryTrendMedia { (listMovies) in
            self.listMoviesTrend = listMovies
            self.collectionTrendMovies.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listMoviesTrend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! MoviesCollectionViewCell
        
        let nomeFilme = listMoviesTrend[indexPath.item]
        
        if let caminhoImagem = nomeFilme.caminhoImagem {
            celulaFilme.imagemPoster.load(url: URL(string: caminhoImagem)!)
            celulaFilme.labelTitulo.text = "\(nomeFilme.nome ?? "")"
            celulaFilme.layer.borderWidth = 0.5
            celulaFilme.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.00/255.0, alpha: 1).cgColor
            celulaFilme.layer.cornerRadius = 5
            return celulaFilme
        }
        
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width:  larguraCelula - 10, height: 160)
    }
}
