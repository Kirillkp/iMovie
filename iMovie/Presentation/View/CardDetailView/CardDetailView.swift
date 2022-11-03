//
//  CardDetailView.swift
//  iMovie
//
//  Created by Кирилл Полосов on 03.11.2022.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CardDetailView: View {
    
    let film: Film
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                WebImage(url: URL(string: film.posterUrlPreview ?? .placeholderPreview))
                    .resizable()
                    .placeholder(content: {
                        Image.placeholderImage
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            
                    })
                
                Text(film.nameRu ?? .globalUnknow)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Spacer()
                Divider()
                Spacer()
                HStack(alignment: .top) {
                    genres(of: film)
                    Spacer()
                    Text("⭐️ \(String(format: "%.1f", film.ratingKinopoisk ?? 0)) / 10").font(.body)
                }
                Spacer()
                Divider()
                Spacer()
                Text(film.shortDescription ?? .empty)
                    .font(.body)
            }.padding(.horizontal)
        }
    }
    
    private func genres(of film: Film?) -> some View {
        HStack(alignment: .top) {
            Text(verbatim: .commonGenreCardDetail)
            VStack(alignment: .leading) {
                ForEach(film?.genres ?? [Genre(genre: .globalUnknow)], id: \.genre) { genre in
                   Text(genre.genre)
                }
            }
        }
    }
}
