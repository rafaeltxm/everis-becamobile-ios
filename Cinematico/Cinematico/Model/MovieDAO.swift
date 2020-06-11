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
        let ordernaPorNome = NSSortDescriptor(key: "nome", ascending: true)
        pesquisaFilme.sortDescriptors = [ordernaPorNome]
        
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
        movie.tipoMidia = dictionaryMovie["media_type"] as? String
        
        guard let rating = dictionaryMovie["vote_average"] as? Double else { return }
        movie.rating = rating
        
        guard let popularidade = dictionaryMovie["popularity"] as? Double else { return }
        movie.popularidade = popularidade
            
        movie.caminhoImagem = "https://image.tmdb.org/t/p/w500/" + "\(dictionaryMovie["poster_path"] as? String ?? "")"
        movie.caminhoImagemFundo = "https://image.tmdb.org/t/p/w500/" + "\(dictionaryMovie["backdrop_path"] as? String ?? "")"
        
        atualizaContexto()
    }
    
    func saveTVShow(dictionaryTVShow:Dictionary<String, Any>) {
        let tvSHOW = Movie(context: contexto)
        
        guard let idTVShow = dictionaryTVShow["id"] as? Int32 else { return }
        tvSHOW.idFilme = idTVShow
        
        tvSHOW.nome = dictionaryTVShow["name"] as? String
        tvSHOW.sinopse = dictionaryTVShow["overview"] as? String
        tvSHOW.tipoMidia = dictionaryTVShow["media_type"] as? String
        
        guard let rating = dictionaryTVShow["vote_average"] as? Double else { return }
        tvSHOW.rating = rating
        
        guard let popularidade = dictionaryTVShow["popularity"] as? Double else { return }
        tvSHOW.popularidade = popularidade
        
        tvSHOW.caminhoImagem = "https://image.tmdb.org/t/p/w500/" + "\(dictionaryTVShow["poster_path"] as? String ?? "")"
        tvSHOW.caminhoImagemFundo = "https://image.tmdb.org/t/p/w500/" + "\(dictionaryTVShow["backdrop_path"] as? String ?? "")"
        
        atualizaContexto()
    }
    
    func deleteMovies() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Movie")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try contexto.execute(deleteRequest)
        } catch let error as NSError {
            // TODO: handle the error
        }
    }
    
    func atualizaContexto() {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
