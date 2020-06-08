//
//  Repositorio.swift
//  Agenda
//
//  Created by Alura Roxo on 28/02/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class Repository: NSObject {
    
    func recoveryTrendMedia(completion:@escaping(_ listMovies:Array<Movie>) -> Void) {
        var movies = MovieDAO().recoveyMovies()
        TrendMediaAPI().recoveryTrendMovies {
            movies = MovieDAO().recoveyMovies()
            completion(movies)
        }
    }
}
