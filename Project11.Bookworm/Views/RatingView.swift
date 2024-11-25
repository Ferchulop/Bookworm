//
//  RatingView.swift
//  Project11.Bookworm
//
//  Created by Fernando Jurado on 20/11/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int // Calificacion del libro vinculada a un estado externo
    
    var label = ""
    var maxRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label) // Muestra la etiqueta si está definida
            }
            ForEach(1..<maxRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
            
        }
        .buttonStyle(.plain)
        
    }
    // Función para retornar la imagen correcta según la calificación
    func image(for  number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
