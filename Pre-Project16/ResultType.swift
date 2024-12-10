//
//  ResultType.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 09/12/24.
//

import SwiftUI

struct ResultType: View {
    @State private var output: String = ""
    @State private var outputResult: String = ""

    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
        
        Text(outputResult)
            .task {
                await fetchingReadingsResult()
            }
    }
    
    func fetchReadings() async {
        do {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self , from: data)
            output = "Found \(readings.count) readings"
        } catch {
            print("Download Error")
        }
    }
    
    //same code using Result Type
    
    func fetchingReadingsResult() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.jso")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        //handle the resut type (String if successfull or Error if its failed)
        do {
            outputResult = try result.get()
        } catch {
            outputResult = "Error: \(error.localizedDescription)"
        }
        
        //another way to handlle the result type
        switch result {
        case .success(let str):
            outputResult = str
        case .failure(let error):
            outputResult = "Error: \(error.localizedDescription)"
        }
    }
    
    //Regardless of how you handle it, the advantage of Result is that it lets us store the whole success or failure of some work in a single value, pass that around wherever we need, and read the error only when we’re ready.
}

#Preview {
    ResultType()
}
