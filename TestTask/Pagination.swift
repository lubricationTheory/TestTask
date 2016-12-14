//
//  Loadable.swift
//  TestTask
//
//  Created by Ilya Lapan on 14/12/2016.
//  Copyright © 2016 ilyalapan. All rights reserved.
//


import Foundation
import Alamofire

protocol Pagination {
    
    func getURLMoreString() -> String
    func updateArray(array: Dictionary<String,AnyObject> )
    func loadMore(completed: @escaping (ServerRequestResponse) -> Void )
    
}

extension Pagination {
    
    func loadMore(completed: @escaping (ServerRequestResponse) -> Void )  {
        let URLString = self.getURLMoreString()
        
        Alamofire.request(URLString).responseJSON{ response in
            
            do {
                let postsArray = try RequestHelper.checkResponse(responseJSON: response)
                self.updateArray(array: postsArray)
                completed(ServerRequestResponse.Success)
            }
            catch {
                print("Uncaught Error")
            }
        }
    }
    
}
