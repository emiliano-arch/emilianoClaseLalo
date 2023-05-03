//
//  navegacionTable.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI



struct navegacionTable: View {
    @EnvironmentObject var materiasList : Materias
    
    
    var body: some View {
        NavigationView{
                
            VStack {
                List{
                    ForEach(0..<$materiasList.List.count, id: \.self) { index in
    
                        NavigationLink(destination: MateriaCustom( numIndex: index)) {
                                materiaRenglonCustom(materiaPrueba: $materiasList.List[index].wrappedValue)
                            

                            
                        }
                    }
                }
                    .navigationTitle("Materias")
                    asignarMaterias()
            }
        }
    }
}

struct navegacionTable_Previews: PreviewProvider {
    static var previews: some View {
        
        navegacionTable().environmentObject(Materias())
    }
}
