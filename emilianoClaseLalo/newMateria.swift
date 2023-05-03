//
//  newMateria.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

struct newMateria: View {
    @State var newMateria : String = ""
    @EnvironmentObject var materiasList : Materias
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            TextField(
                   "Agrega una nueva materia",
                   text: $newMateria
            )
            .cornerRadius(30)
            .foregroundColor(.black)
            .background()
            .shadow(color: .green, radius: 30)
            .frame(width: 300)
            
            
            
            Button("Guardar materia", action: {
                
                if(newMateria != ""){
                    materiasList.agregarMateria(materia: Materia(materiaName: newMateria, tareas: []))
                    presentationMode.wrappedValue.dismiss()
                    
                }
                
            })
            
        }
    }
}

struct newMateria_Previews: PreviewProvider {
    static var previews: some View {
        
        newMateria()
    }
}
