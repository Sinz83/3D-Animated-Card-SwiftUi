//
// Created by Sabrina  on 21.10.22.
// Display a Text that says "Surprise" Behind the Rectangle in the Center of the Frame with color and bigger fontSize


import SwiftUI

struct ContentView: View {
    
    @State var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
                 
            Rectangle()
            
            // ToDo: zeichenkette ausdrucken in der Konsole wenn rectangle angeklickt ist (print methode)
            
                .fill(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [.yellow, .green, .red, .purple]
                        ),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 200, height: 200)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20
                    ))
                .rotation3DEffect(.degrees(-Double(dragAmount.width) / 20), axis:(x:0, y:1, z:0))
                .rotation3DEffect(.degrees(Double(dragAmount.height / 20)), axis:(x:1, y:0, z:0))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged{
                            dragAmount = $0.translation
                        }
                        .onEnded{ _ in
                            withAnimation(.spring()){
                                dragAmount = .zero
                                
                            }
                            
                        }
                    
                )
                        
                .frame(width: 250, height: 200)
                .background(
                    Gradient(
                        colors: [.yellow, .blue]
                        
                    ))
                .cornerRadius(20)

        }
    
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
