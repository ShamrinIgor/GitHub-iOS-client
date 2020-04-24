import Foundation
import UIKit

 struct Repositories {
    
     private(set) var arrayOfRepositories: [Repository] = []
    
     struct Repository {
        private(set) var name: String?
        private(set) var description: String? = ""
        private(set) var avatarURL: URL?
        private(set) var ownnerName: String?
        private(set) var repositoryURL: String?
        
        init?(jsonItem: Dictionary<String, Any>) {
//            print(jsonItem)
            guard let name = jsonItem["name"] as? String else {
                return nil
            }
            self.name = name
            print("name: " ,name)
            
            let description = jsonItem["description"] as? String
            self.description = description
//            print("description: " , description!)
            
            guard let owner = jsonItem["owner"] as? Dictionary<String, Any> else {
                return nil
            }
            print("owner: ", owner)
            guard let avatarURL = owner["avatar_url"] as? String else {
                return nil
            }
            
            self.avatarURL = URL(string: avatarURL)
            print("avatarURL: " ,avatarURL)
            
            guard let ownnerName = owner["login"] as? String else {
                return nil
            }
            self.ownnerName = ownnerName
            print("ownnerName: ",ownnerName)
            
            guard let url = owner["html_url"] as? String else {
                return nil
            }
            self.repositoryURL = url
            print("html_url: ", url)
        }
    }
    
    init?(json: Dictionary<String, Any>) {
        guard let items = json["items"] as? [Dictionary<String, Any>] else {
            return nil
        }
        for rep in items {
            guard let itemForArray = Repository(jsonItem: rep) else {
                return
            }
            self.arrayOfRepositories.append(itemForArray)
        }
    }
    
}


