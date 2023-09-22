//
//  DownloadWithCombineBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Leon Grimmeisen on 14.07.22.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // Metaphor: you make a monthly subsription that sends packages to your home
        // 1. sign up for subscription for package to be delivered
        // 2. the ompany would make the package behind the scene
        // 3. receive the pacage at your front door
        // 4. make sure the box is not damaged
        // 5. open and make sure the item is correct
        // 6. use the item
        // 7. cancellable at any time
        
        // 1. create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        // 2. subscribe publisher to background thread
            .subscribe(on: DispatchQueue.global(qos: .background))
        // 3. receive on main thread
            .receive(on: DispatchQueue.main)
        // 4. tryMap (check that data is good)
            .tryMap(handleOutput)
        // 5. decode data into Post Models
            .decode(type: [PostModel].self, decoder: JSONDecoder())
        
            .replaceError(with: [])
        // 6. sink (put data into our app)
        // switch not needed if .replaceErrot used like above (if you do not want or need to deal with the error)
            .sink { (completion) in
                switch completion {
                case .finished:
                    print("COMPLETION: \(completion)")
                case .failure(let error):
                    print("There was an error; \(error)")
                }
                print("COMPLETION: \(completion)")
            } receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
        // 7. store (cancel subscription if needed
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}


struct DownloadWithCombineBootcamp: View {
    
    @StateObject var vm = DownloadWithEscaoingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct DownloadWithCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombineBootcamp()
    }
}
