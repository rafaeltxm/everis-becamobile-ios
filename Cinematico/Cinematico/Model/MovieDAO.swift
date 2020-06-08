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
        guard let idMovie = dictionaryMovie["id"] as? Int32 else { return }
        movie.idFilme = idMovie
        movie.nome = dictionaryMovie["title"] as? String
        movie.sinopse = dictionaryMovie["overview"] as? String
        movie.rating = dictionaryMovie["vote_average"] as! Double
        movie.tipoMidia = dictionaryMovie["media_type"] as? String
        movie.caminhoImagem = "https://image.tmdb.org/t/p/w500/" + "\(dictionaryMovie["poster_path"] as? String ?? "")"
        
        atualizaContexto()
    }
    
    func saveTVShow(dictionaryTVShow:Dictionary<String, Any>) {
        let tvSHOW = Movie(context: contexto)
        guard let idTVShow = dictionaryTVShow["id"] as? Int32 else { return }
        tvSHOW.idFilme = idTVShow
        tvSHOW.nome = dictionaryTVShow["name"] as? String
        tvSHOW.sinopse = dictionaryTVShow["overview"] as? String
        tvSHOW.rating = dictionaryTVShow["vote_average"] as! Double
        tvSHOW.tipoMidia = dictionaryTVShow["media_type"] as? String
        tvSHOW.caminhoImagem = "https://image.tmdb.org/t/p/w500/" + "\(dictionaryTVShow["poster_path"] as? String ?? "")"
        
        atualizaContexto()
    }
    
    func atualizaContexto() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func delete () {
//        do {
//            try contexto.delete
//        } catch {
//            print(error.localizedDescription)
//        }
//    }

}
