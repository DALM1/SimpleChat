import SwiftUI
import SwiftSocket

class NetworkManager: NSObject, ObservableObject {
  @Published var isConnected = false
  @Published var messages: [String] = []

  private let serverAddress = "195.35.1.108"
  private let serverPort = 6000

  private var socket: Socket!

  override init() {
    super.init()
    socket = Socket()
    socket.delegate = self
  }

  func connectToServer() {
    // ... (Code de connexion similaire à ContentView.swift)
  }

  func sendMessage(message: String) {
    // ... (Code d'envoi de message similaire à ContentView.swift)
  }
}

// Implement SocketDelegate methods for handling incoming data, disconnections, etc.
extension NetworkManager: SocketDelegate {
  // ... (DidConnect, DidDisconnect, DidRead methods)
}

