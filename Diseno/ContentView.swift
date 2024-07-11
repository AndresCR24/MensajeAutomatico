/*
 //
 //  ContentView.swift
 //  Diseno
 //
 //  Created by Andres David Cardenas Ramirez on 7/07/24.
 //
 
 import SwiftUI
 
 // Vstack reperesta vertivcak
 // Hstack Horizontal
 // Zstack fondo
 
 struct ContentView: View {
 // valores de entorno o environmentValues
 @Environment(\.horizontalSizeClass) var sizeClass
 @StateObject private var funcionesComunesc = FuncionesComunes2()
 
 var body: some View {
 if sizeClass == .compact{
 compactDesign(funcionesComunesClass: funcionesComunesc)
 }else {
 regularDesign()
 }
 }
 }
 
 struct compactDesign: View {
 @ObservedObject var funcionesComunesClass: FuncionesComunes2
 let numero = "3173032838"
 let mesaje = "Hola, probando una app para enviar mensajes automaticamente uwu"
 
 func sendMessage() {
 let sms = "sms: \(numero)&body=\(mesaje)"
 
 guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
 return
 }
 UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
 }
 func sendCall() {
 guard let number = URL(string: "tel: //\(numero)") else {
 return
 }
 UIApplication.shared.open(number)
 }
 
 var body: some View {
 ZStack {
 Color.green.ignoresSafeArea()
 VStack() {
 //                Image(._1366_2000).resizable().frame(width: 100, height: 100, alignment: .center)
 //                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
 Image(systemName: "person.crop.circle")
 .font(.system(size: 100, weight: .bold))
 .foregroundStyle(.blue)
 Text("Andres cardenas")
 .font(.largeTitle)
 .foregroundStyle(.white)
 Text("Carrera 45 A # 30 a sur 23")
 .foregroundStyle(.white)
 .font(.subheadline)
 TextField("Numero de telefono", text: $funcionesComunesClass.numeroClase)
 HStack {
 Button(action: {
 funcionesComunesClass.sendCallClase()
 }){
 Image(systemName: "phone.fill")
 .modifier(boton(color: .blue))
 }
 Button(action: {
 funcionesComunesClass.sendMessageClase()
 }){
 Image(systemName: "message.fill")
 .modifier(boton(color: .red))
 }
 }
 }
 }
 }
 }
 
 
 struct regularDesign: View {
 var body: some View {
 ZStack {
 Color.blue.ignoresSafeArea()
 HStack() {
 //                Image(._1366_2000).resizable().frame(width: 100, height: 100, alignment: .center)
 //                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
 VStack(alignment: .leading, spacing: 10) {
 Text("Andres cardenas")
 .font(.largeTitle)
 .foregroundStyle(.white)
 Text("Carrera 45 A # 30 a sur 23")
 .foregroundStyle(.white)
 .font(.subheadline)
 
 }
 }
 }
 }
 }
 
 struct boton: ViewModifier {
 var color: Color
 func body(content: Content) -> some View {
 content
 .padding()
 .background(color)
 .foregroundStyle(.white)
 .font(.title)
 .clipShape(Circle())
 }
 }
 
 struct funcionesComunes {
 static let numero1 = "3173032838"
 static let mesaje1 = "Hola, probando una app para enviar mensajes automaticamente uwu"
 static func sendMessage2() {
 let sms = "sms: \(numero1)&body=\(mesaje1)"
 
 guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
 return
 }
 UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
 }
 static func sendCall2() {
 guard let number = URL(string: "tel: //\(numero1)") else {
 return
 }
 UIApplication.shared.open(number)
 }
 }
 
 class FuncionesComunes2: ObservableObject{
 
 @Published var numeroClase: String
 @Published var mensajeClase: String = "Hola, probando una app para enviar mensajes automaticamente uwu"
 
 init(numeroClase: String, mensajeClase: String) {
 self.numeroClase = numeroClase
 self.mensajeClase = mensajeClase
 }
 
 func sendMessageClase() {
 let sms = "sms:\(numeroClase)&body=\(mensajeClase)"
 
 guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
 return
 }
 if let url = URL(string: stringSMS) {
 UIApplication.shared.open(url, options: [:], completionHandler: nil)
 }
 }
 
 func sendCallClase() {
 if let number = URL(string: "tel://\(numeroClase)") {
 UIApplication.shared.open(number)
 }
 }
 }
 #Preview {
 ContentView()
 }
 */
  
  import SwiftUI

  // Vstack reperesta vertical
  // Hstack Horizontal
  // Zstack fondo

  struct ContentView: View {
      // valores de entorno o environmentValues
      @Environment(\.horizontalSizeClass) var sizeClass
      @StateObject private var funcionesComunesc = FuncionesComunes2(numeroClase: "", mensajeClase: "Hola, probando una app para enviar mensajes automaticamente uwu")
      
      var body: some View {
          if sizeClass == .compact {
              CompactDesign(funcionesComunesClass: funcionesComunesc)
          } else {
              RegularDesign()
          }
      }
  }

  struct CompactDesign: View {
      @ObservedObject var funcionesComunesClass: FuncionesComunes2
      
      var body: some View {
          ZStack {
              Color.green.ignoresSafeArea()
              VStack {
                  Image(systemName: "person.crop.circle")
                      .font(.system(size: 100, weight: .bold))
                      .foregroundStyle(.blue)
                  Text("Andres Cardenas")
                      .font(.largeTitle)
                      .foregroundStyle(.white)
                  Text("Carrera 45 A # 30 a sur 23")
                      .foregroundStyle(.white)
                      .font(.subheadline)
                  TextField("Número de teléfono", text: $funcionesComunesClass.numeroClase)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding()
                  TextField("Mensaje", text: $funcionesComunesClass.mensajeClase)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding()
                  HStack {
                      Button(action: {
                          funcionesComunesClass.sendCallClase()
                      }) {
                          Image(systemName: "phone.fill")
                              .modifier(Boton(color: .blue))
                      }
                      Button(action: {
                          funcionesComunesClass.sendMessageClase()
                      }) {
                          Image(systemName: "message.fill")
                              .modifier(Boton(color: .red))
                      }
                  }
              }
              .padding()
          }
      }
  }

  struct RegularDesign: View {
      var body: some View {
          ZStack {
              Color.blue.ignoresSafeArea()
              HStack {
                  VStack(alignment: .leading, spacing: 10) {
                      Text("Andres Cardenas")
                          .font(.largeTitle)
                          .foregroundStyle(.white)
                      Text("Carrera 45 A # 30 a sur 23")
                          .foregroundStyle(.white)
                          .font(.subheadline)
                  }
              }
          }
      }
  }

  struct Boton: ViewModifier {
      var color: Color
      func body(content: Content) -> some View {
          content
              .padding()
              .background(color)
              .foregroundStyle(.white)
              .font(.title)
              .clipShape(Circle())
      }
  }

  class FuncionesComunes2: ObservableObject {
      @Published var numeroClase: String
      @Published var mensajeClase: String
      
      init(numeroClase: String, mensajeClase: String) {
          self.numeroClase = numeroClase
          self.mensajeClase = mensajeClase
      }
      
      func sendMessageClase() {
          let sms = "sms:\(numeroClase)&body=\(mensajeClase)"
          
          guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
              return
          }
          if let url = URL(string: stringSMS) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
          }
      }
      
      func sendCallClase() {
          if let number = URL(string: "tel://\(numeroClase)") {
              UIApplication.shared.open(number)
          }
      }
  }

  #Preview {
      ContentView()
  }

