//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Leon Grimmeisen on 12.07.22.
//


// This does not work, but no time to figure out why right now...

import SwiftUI

//struct PostModel: Identifiable, Codable {
//    let userID: Int
//    let id: Int
//    let title: String
//    let body: String
//}



class DownloadWithEscaoingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                    print("posts appendend!")
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error downloading data")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
}




struct DownloadWithEscapingBootcamp: View {
    
    @StateObject var vm = DownloadWithEscaoingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack {
                    Text(post.title)
                    Text(post.title)
                }
            }
        }
    }
}

struct DownloadWithEscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithEscapingBootcamp()
    }
}
