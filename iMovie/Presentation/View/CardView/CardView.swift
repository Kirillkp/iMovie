import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    let image: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
           
            WebImage(url: URL(string: image))
                .resizable()
                .placeholder(content: {
                    Image.placeholderImage
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        
                })
                .cornerRadius(25)
        }
    }
}

struct CardViewList_Previews: PreviewProvider {
    static var previews: some View {
        let mockImage = String.placeholderPreview
        CardView(image: mockImage)
    }
}
