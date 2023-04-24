//
//  ContentView.swift
//  emilianoClaseLalo
//
//  Created by Facultad de Contaduría y Administración on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var mostrarVistaModal = false

    var body: some View {
        Button("Mostrar vista en pantalla completa") {
            mostrarVistaModal.toggle()
        }
        .fullScreenCover(isPresented: $mostrarVistaModal, content: {
            OtraVista()
        })
    }
}

struct OtraVista: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Esta es otra vista en pantalla completa")
            Button("Cerrar") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
