//
//  navegacionTable.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI



struct navegacionTable: View {
    @ObservedObject var materiasList : Materias = Materias()
    
    
    var body: some View {
        NavigationView{
                
            VStack {
                List{
                    ForEach(0..<$materiasList.List.count, id: \.self) { index in
    
                        NavigationLink(destination: MateriaCustom(materia:materiasList, numIndex: index)) {
                                materiaRenglonCustom(materiaPrueba: $materiasList.List[index].wrappedValue)
                            

                            
                        }
                    }
                }
                    .navigationTitle("Materias")
                    asignarMaterias(materiasList: materiasList)
            }
        }
    }
}

struct navegacionTable_Previews: PreviewProvider {
    static var previews: some View {
        
        navegacionTable()
    }
}
