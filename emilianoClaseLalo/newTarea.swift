//
//  add:editTarea.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

struct newTarea: View {
    var opcion : options
    @State var tareaName : String = ""
    @ObservedObject var materiasList : Materias
    @Environment(\.presentationMode) var presentationModeTarea
    
    var body: some View {
        VStack{
            TextField(
                   "Nombra tu tarea",
                   text: $tareaName
            )
            .cornerRadius(30)
            .foregroundColor(.black)
            .background()
            .shadow(color: .green, radius: 30)
            .frame(width: 300)
            
            if(opcion == options.ADD){
                
                Button("Guardar tarea", action: {
                    
                    if(tareaName != ""){
                        
                        //guardar
                        
                        presentationModeTarea.wrappedValue.dismiss()
                        
                    }
                    
                })
            } else if(opcion == options.EDIT){
                Button("Editar tarea", action: {
                    
                    if(tareaName != ""){
                        
                        presentationModeTarea.wrappedValue.dismiss()
                        
                    }
                    
                })
            }
            
        }
        
        
    }
}

struct newTarea_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var materiasList : Materias = Materias()
        newTarea(opcion: options.EDIT, materiasList: materiasList)
    }
}
