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

                    Group {
                        TextField("Smart Data Token", text: $smartDataToken)
                        TextField("TriZetto Username", text: $triZettoUser)
                        SecureField("TriZetto Password", text: $triZettoPass)
                        TextField("Waystar API Key", text: $waystarKey)
                        TextField("Experian API Key", text: $experianKey)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                    TextField("Enter Payer Name", text: $payerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button("Import CSV") {
                        // CSV import logic placeholder
                    }
                    .buttonStyle(.borderedProminent)

                    Button(action: { /* OCR Camera logic */ }) {
                        Label("Use Camera", systemImage: "camera")
                    }

                    Button(action: { /* Voice Input logic */ }) {
                        Label("Use Voice", systemImage: "mic.fill")
                    }

                    Button("Lookup Payer ID") {
                        Task {
                            isLoading = true
                            result = await lookupService.lookupPayerID(for: payerName,
                                                                         smartDataToken: smartDataToken,
                                                                         triZettoUser: triZettoUser,
                                                                         triZettoPass: triZettoPass,
                                                                         waystarKey: waystarKey,
                                                                         experianKey: experianKey)
                            isLoading = false
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    if isLoading {
                        ProgressView()
                    } else if let result = result {
                        VStack {
                            Text("Source: \(result.source)")
                            Text("Payer ID: \(result.payerID)")
                        }
                        .padding()
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}
