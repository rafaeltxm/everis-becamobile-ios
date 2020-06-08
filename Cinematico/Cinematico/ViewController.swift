//
//  ViewController.swift
//  Cinematico
//
//  Created by Rafael Teixeira Martins on 08/06/20.
//  Copyright © 2020 Rafael Teixeira Martins. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //MARK: - Atributos
    
    var movies:Array<Movie> = []
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recoveryMovies()
        super.viewDidLoad()
    }
    
    func recoveryMovies() {
        Repository().recoveryTrendMedia { (listMovies) in
            self.movies = listMovies
        }
    }
    
    @IBAction func send(_ sender: Any) {
        for m in movies {
            if (m.tipoMidia == "tv"){
                guard let nomeFilme = m.nome else { return }
                print(nomeFilme)
            }
        }
    }
}

