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
    
                        NavigationLink(destination: MateriaCustom(materia:materia, numIndex: index)) {
                                //materiaRenglonCustom(materiaPrueba: $materiasList.List[index].wrappedValue)
                            

                            
                        }
                    }
                }
                    .navigationTitle("Materias")
                    //asignarMaterias(materiasList: materiasList)
            }
            Spacer()
           
           // VStack{
              //  HStack{
                 //   asignarTarea(materiasList: materia, opcion: options.ADD)
                //    asignarTarea(materiasList: materia, opcion: options.EDIT)
              //  }
                
            //}
            
            
        }
    }
}
/*
 struct MateriaCustom_Previews: PreviewProvider {
 
 
 static var previews: some View {
 @ObservedObject var materiaPrueba: Materias = Materias()
 Group {
 materiaPrueba.agregarMateria(materia: Materia(materiaName: "Ejemplo", tareas: tareas))
 }
 
 MateriaCustom(materia: materiaPrueba, numIndex: 0)
 }
 }
 */
