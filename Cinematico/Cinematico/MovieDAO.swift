//
//  AlunoDAO.swift
//  Agenda
//
//  Created by Alura Roxo on 28/02/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import CoreData

class MovieDAO: NSObject {
    
    var gerenciadorDeResultados:NSFetchedResultsController<Movie>?
    var contexto:NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func recoveyMovies() -> Array<Movie> {
        let pesquisaFilme:NSFetchRequest<Movie> = Movie.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "nome", ascending: true)
        pesquisaFilme.sortDescriptors = [ordenaPorNome]
        
        gerenciadorDeResultados = NSFetchedResultsController(fetchRequest: pesquisaFilme, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try gerenciadorDeResultados?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        guard let listaDeFilmes = gerenciadorDeResultados?.fetchedObjects else { return [] }
        
        return listaDeFilmes
    }
    
    func saveMovie(dictionaryMovie:Dictionary<String, Any>) {
        let movie = Movie(context: contexto)
        movie.idFilme = dictionaryMovie["id"] as? UUID
        movie.nome = dictionaryMovie["title"] as? String
        movie.sinopse = dictionaryMovie["overview"] as? String
        movie.rating = dictionaryMovie["vote_average"] as! Double
        movie.tipoMidia = dictionaryMovie["media_type"] as? String
        
        atualizaContexto()
    }
    
    func saveTVShow(dictionaryTVShow:Dictionary<String, Any>) {
        let tvSHOW = Movie(context: contexto)
        tvSHOW.idFilme = dictionaryTVShow["id"] as? UUID
        tvSHOW.nome = dictionaryTVShow["name"] as? String
        tvSHOW.sinopse = dictionaryTVShow["overview"] as? String
        tvSHOW.rating = dictionaryTVShow["vote_average"] as! Double
        tvSHOW.tipoMidia = dictionaryTVShow["media_type"] as? String
        
        atualizaContexto()
    }
    
    func atualizaContexto() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }

}
