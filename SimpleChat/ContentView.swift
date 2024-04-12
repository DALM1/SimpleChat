// ContentView.swift
// SimpleChat

import SwiftUI

struct ContentView: View {
  
  @State private var messages: [String] = [] // Stocke les messages
  @State private var messageText = "" // Texte du message en cours de saisie
  
  var body: some View {
    NavigationView {
      VStack {
        // Afficher tous les messages
        ScrollView {
          ForEach(messages, id: \.self) { message in
            Text(message)
              .padding()
          }
        }
        
        // Zone de saisie et bouton d'envoi
        HStack {
          TextField("Entrez votre message", text: $messageText) { _ in
            // Envoyer le message
            sendMessage()
          }
          Button("Envoyer") {
            // Envoyer le message
            sendMessage()
            // Effacer le message après l'envoi (optionnel)
            messageText = ""
          }
        }
        .padding()
      }
      .navigationBarTitle("DALM|CHAT")
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

