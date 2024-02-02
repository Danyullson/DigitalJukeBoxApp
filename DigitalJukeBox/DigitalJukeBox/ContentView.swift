// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // User Name
                Text("User Name")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                    .foregroundColor(.white)

                // Search Bar (Not functional in this example)
                HStack {
                    TextField("Search", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 20)
                }
                .padding()

                // Album Racks Section
                VStack(alignment: .leading) {
                    HStack {
                        Text("Album Racks")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        NavigationLink(destination: Text("See More")) {
                            Text("See More")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            AlbumRackView(albumArtworkName: "80sR&B", albumTitle: "80s R&B")
                            // Navigation Link for Golden Era which navigates to the new GoldenEraView
                            NavigationLink(destination: GoldenEraView()) {
                                AlbumRackView(albumArtworkName: "Golden Era", albumTitle: "Golden Era")
                            }
                            AlbumRackView(albumArtworkName: "Sounds of Detroit", albumTitle: "Sounds of Detroit")
                        }
                        .padding(.horizontal)
                    }
                }

                Spacer()

                // Tab Bar
                HStack {
                    Spacer()
                    Image(systemName: "person.fill")
                    Spacer()
                    Image(systemName: "cart.fill")
                    Spacer()
                    Image(systemName: "house.fill")
                    Spacer()
                    Image(systemName: "heart.fill")
                    Spacer()
                    Image(systemName: "envelope.fill")
                    Spacer()
                }
                .font(.title2)
                .padding()
                .background(Color.black)
                .foregroundColor(.yellow)
            }
            .background(Color.black)
            .navigationBarHidden(true)
        }
        .preferredColorScheme(.dark)
    }
}

struct AlbumRackView: View {
    var albumArtworkName: String
    var albumTitle: String

    var body: some View {
        VStack {
            Image(albumArtworkName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(12)
            Text(albumTitle)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
