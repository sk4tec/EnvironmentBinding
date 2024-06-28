import SwiftUI

class Data: ObservableObject {
    @Published public var value: Bool = false

    public init(value: Bool = false) {
        self.value = value
    }
}

struct ContentView: View {
    @StateObject private var data = Data()

    var body: some View {
        NavigationView {
            VStack {
                Text("Value in ContentView \(data.value)")
                NavigationLink("Go To View", destination: DetailView())
        //      NavigationLink("Go To View", destination: DetailView().environmentObject(data)) // Good
            }
         // .environmentObject(data) // Not Good
            .padding()
        }
        .environmentObject(data) // Good
    }
}

struct DetailView: View {
    @EnvironmentObject var sharedVar: Data
    var body: some View {
        VStack {
            Text("Detail View")
            Text("Value of data is \(sharedVar.value)")

            Button("Toggle data") {
                sharedVar.value.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
