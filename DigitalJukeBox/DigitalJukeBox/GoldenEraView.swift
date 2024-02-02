// GoldenEraView.swift

import SwiftUI

struct GoldenEraView: View {
    private let albums = ["36Chambers", "TheChronic", "MidnightMaraders"]
    @State private var currentPage = 1

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Golden Era")
                    .font(.largeTitle) // Replace with your font name
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(.top)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(albums, id: \.self) { album in
                            Image(album)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                                .clipped()
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75, alignment: .leading)
                    .offset(x: -CGFloat(currentPage - 1) * geometry.size.width)
                }
                .onTapGesture {
                    currentPage = (currentPage % albums.count) + 1 // Cycle through the albums
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .animation(.easeInOut, value: currentPage) // Apply the animation to the GeometryReader
    }
}

struct GoldenEraView_Previews: PreviewProvider {
    static var previews: some View {
        GoldenEraView()
            .preferredColorScheme(.dark)
    }
}
