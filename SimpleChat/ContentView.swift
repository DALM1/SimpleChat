// SimpleChat

import SwiftUI

struct ContentView: View {
  
  @State private var messages: [String] = [] // Stocke les messages
  @State private var messageText = "" // Texte du message en cours de saisie
  
  var body: some View {
    NavigationView {
      GeometryReader { geometry in // Accéder à la taille de l'écran
        ZStack {
          // Image en fond plein couvrant tout l'écran
          Image("background")
            .resizable()
            .scaledToFill() // Couvrir tout l'écran en conservant le ratio
            .ignoresSafeArea() // Ignorer les marges de sécurité
            .frame(width: geometry.size.width, height: geometry.size.height) // Fixer la taille à l'écran
          
          VStack(spacing: 1) { // Espacer les éléments verticalement
            Spacer() // Pousser le contenu vers le bas
            
            // Zone de saisie et bouton d'envoi
            HStack(spacing: 10) { // Espacer les éléments horizontalement
              TextField("Entrez votre message", text: $messageText) { _ in
                // Envoyer le message
                sendMessage()
              }
              .foregroundColor(.white) // Curseur blanc
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(.gray.opacity(0.5))
              )
              .padding(.horizontal) // Ajouter un padding horizontal
              
              Button("Envoyer") {
                // Envoyer le message
                sendMessage()
                // Effacer le message après l'envoi (optionnel)
                messageText = ""
              }
              .foregroundColor(.white)
              .background(
                RoundedRectangle(cornerRadius: 3)
                  .fill(.blue)
              )
              .padding(.horizontal) // Ajouter un padding horizontal
              .frame(height: 1) // Fixer la hauteur du bouton
            }
           
          
          }
          .padding() // Ajouter un padding général
          .frame(maxWidth: .infinity) // Prendre la largeur maximale disponible
        }
      }
      .navigationBarTitle("DALM|CHAT", displayMode: .inline)
      .font(.caption)
    }
  }
  
  func sendMessage() {
    // Ajouter le message à la liste
    messages.append(messageText)
    
    // Simuler la réception d'un message (à remplacer par la logique de réception réelle)
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      messages.append("Réponse : \(messageText)")
    }
  }
}

