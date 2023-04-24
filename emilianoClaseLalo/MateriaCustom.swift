//
//  MateriaCustom.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

struct MateriaCustom: View {
    @ObservedObject var materia : Materias
    @State var show = false
    
    @State var numIndex : Int
    
    var body: some View {
        VStack{
            Title(texto: materia.List[numIndex].materiaName)
            //TareasCustom(listTareas: materia.List[numIndex].tareas)
            VStack {
                List{
                    ForEach(0..<materia.List[numIndex].tareas.count, id: \.self) { index in
    
                        NavigationLink(destination: newTarea(opcion: options.EDIT, tareaName: materia.List[numIndex].tareas[index].tareaName, materiasList: materia,indiceTarea: index, indiceMateria: numIndex) ) {
                            TareaRenglonCustom(tareaUnica: materia.List[numIndex].tareas[index])
                                                        
                        }
                    }
                }
                    .navigationTitle("Materias")
                    
            }
            Spacer()
           
           VStack{
               asignarTarea(materiasList: materia, opcion: options.ADD, indiceMateria: numIndex)
               
           }
        }
    }
}

 struct MateriaCustom_Previews: PreviewProvider {
 
 
 static var previews: some View {
 @ObservedObject var materiaPrueba: Materias = Materias()
 
 
 MateriaCustom(materia: materiaPrueba, numIndex: 0)
 }
 }
 
