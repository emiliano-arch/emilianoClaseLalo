//
//  menuNavegadores.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

struct menuNavegadores: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Text("Inicio")
                    Image(systemName: "house")
                }
            calculadoraIos()
                .tabItem{
                    Text("Calculadora")
                    Image(systemName: "plus.forwardslash.minus")
                }
            navegacion()
                .tabItem{
                    Text("navegador sin tabla")
                    Image(systemName: "book.closed.fill").foregroundColor(.red)
                }
            navegacionTable()
                .tabItem{
                    Text("navegador con tabla")
                    Image(systemName: "book.closed.fill").foregroundColor(.blue)
                }
        }
    }
}

struct menuNavegadores_Previews: PreviewProvider {
    static var previews: some View {
        menuNavegadores()
    }
}
