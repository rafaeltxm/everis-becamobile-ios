//
//  FilmeAPI.swift
//  MLIF
//
//  Created by Rafael Teixeira Martins on 05/06/20.
//  Copyright © 2020 Rafael Teixeira Martins. All rights reserved.
//

import UIKit
import Alamofire

class TrendMediaAPI: NSObject {

    //MARK: - GET
    
    func recoveryTrendMovies(completion:@escaping() -> Void) {
        AF.request("https://api.themoviedb.org/3/trending/all/week?api_key=fce1620169267c457d7e75e3f6dcf6a0&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let responseJSON = response.value as? Dictionary<String, Any> {
                    guard let listMovies = responseJSON["results"] as? Array<Dictionary<String, Any>> else { return }
                    for dictionaryMovie in listMovies {
                        if (dictionaryMovie["media_type"] as? String == "movie"){
                            MovieDAO().saveMovie(dictionaryMovie: dictionaryMovie)
                        } else if (dictionaryMovie["media_type"] as? String == "tv") {
                            MovieDAO().saveTVShow(dictionaryTVShow: dictionaryMovie)
                        }
                    }
                    completion()
                }
                break
            case .failure:
                print(response.error!)
                completion()
                break
            }
        }
    }
}

