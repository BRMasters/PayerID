import SwiftUI

struct ContentView: View {
    @State private var payerName = ""
    @State private var result: PayerResult?
    @State private var isLoading = false

    @State private var smartDataToken = ""
    @State private var triZettoUser = ""
    @State private var triZettoPass = ""
    @State private var waystarKey = ""
    @State private var experianKey = ""

    let lookupService = PayerLookupService()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Payer ID Finder")
                        .font(.largeTitle)
                        .bold()
                    // ... other UI components ...
                }
                .padding()
            }
        }
    }
}
