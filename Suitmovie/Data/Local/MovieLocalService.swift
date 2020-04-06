//
//  LocalService.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 27/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MovieLocalService: LocalServiceProtocol {
    
    func insert(movie: Movie, onSuccess: @escaping () -> Void, onError: @escaping (Error?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            onError(NetworkHelper.customError(code: 400, message: ConstantsWording.sorryErrorOurSystem))
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let movieEntity = NSEntityDescription.entity(forEntityName: ConstantsEntity.movieEntity, in: managedContext)!
        
        let movieObject = NSManagedObject(entity: movieEntity, insertInto: managedContext)
        movieObject.setValue(movie.id, forKey: ConstantsEntity.MovieEntity.id)
        movieObject.setValue(movie.title, forKey: ConstantsEntity.MovieEntity.title)
        movieObject.setValue(movie.backdropPath, forKey: ConstantsEntity.MovieEntity.backdropPath)
        movieObject.setValue(movie.posterPath, forKey: ConstantsEntity.MovieEntity.posterPath)
        movieObject.setValue(movie.overview, forKey: ConstantsEntity.MovieEntity.overview)
        movieObject.setValue(movie.releaseDate, forKey: ConstantsEntity.MovieEntity.releaseDate)
        movieObject.setValue(movie.adult, forKey: ConstantsEntity.MovieEntity.adult)
        
        do {
            try managedContext.save()
            onSuccess()
        } catch let error as NSError {
            onError(NetworkHelper.customError(code: 400, message: error.localizedDescription))
        }
    }
    
    func delete(movie: Movie, onSuccess: @escaping () -> Void, onError: @escaping (Error?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            onError(NetworkHelper.customError(code: 400, message: ConstantsWording.sorryErrorOurSystem))
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ConstantsEntity.movieEntity)
        fetchRequest.predicate = NSPredicate(format: "title = %@", movie.title)
        
        do {
            let data = try managedContext.fetch(fetchRequest)
            let objectToDelete = data.first as! NSManagedObject
            managedContext.delete(objectToDelete)
            do {
                try managedContext.save()
                onSuccess()
            } catch {
                onError(error)
            }
        } catch {
            onError(error)
        }
    }
    
    func fetch(onSuccess: @escaping (_ result: [Movie]?) -> Void, onError: @escaping (_ error: Error?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            onError(NetworkHelper.customError(code: 400, message: ConstantsWording.sorryErrorOurSystem))
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ConstantsEntity.movieEntity)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            var movies = [Movie]()
            for data in result as! [NSManagedObject] {
                let item = Movie(
                    id: data.value(forKey: ConstantsEntity.MovieEntity.id) as? Int ?? 0,
                    title: data.value(forKey: ConstantsEntity.MovieEntity.title) as? String ?? "",
                    backdropPath: data.value(forKey: ConstantsEntity.MovieEntity.backdropPath) as? String,
                    posterPath: data.value(forKey: ConstantsEntity.MovieEntity.posterPath) as? String,
                    overview: data.value(forKey: ConstantsEntity.MovieEntity.overview) as? String,
                    releaseDate: data.value(forKey: ConstantsEntity.MovieEntity.releaseDate) as? String,
                    adult: data.value(forKey: ConstantsEntity.MovieEntity.adult) as? Bool ?? false)
                movies.append(item)
            }
            onSuccess(movies)
        } catch {
            onError(NetworkHelper.customError(code: 400, message: ConstantsWording.sorryErrorOurSystem))
        }
    }
    
    func fetch(movie: Movie, onSuccess: @escaping (_ result: Movie) -> Void, onError: @escaping (Error?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            onError(NetworkHelper.customError(code: 400, message: ConstantsWording.sorryErrorOurSystem))
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ConstantsEntity.movieEntity)
        fetchRequest.predicate = NSPredicate(format: "title = %@", movie.title)
        
        do {
            let data = try managedContext.fetch(fetchRequest)
            let listFilter = data.first as? NSManagedObject
            
            if let objectDetail = listFilter {
                let item = Movie(
                    id: objectDetail.value(forKey: ConstantsEntity.MovieEntity.id) as? Int ?? 0,
                    title: objectDetail.value(forKey: ConstantsEntity.MovieEntity.title) as? String ?? "",
                    backdropPath: objectDetail.value(forKey: ConstantsEntity.MovieEntity.backdropPath) as? String,
                    posterPath: objectDetail.value(forKey: ConstantsEntity.MovieEntity.posterPath) as? String,
                    overview: objectDetail.value(forKey: ConstantsEntity.MovieEntity.overview) as? String,
                    releaseDate: objectDetail.value(forKey: ConstantsEntity.MovieEntity.releaseDate) as? String,
                    adult: objectDetail.value(forKey: ConstantsEntity.MovieEntity.adult) as? Bool ?? false)
                
                onSuccess(item)
            } else {
                onError(NetworkHelper.customError(code: 400, message: ConstantsWording.dataNotFound))
            }
        } catch {
            onError(error)
        }
    }
}
