//
//  materiaRenglonCustom.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

struct materiaRenglonCustom: View {
    var materiaPrueba: Materia
    var body: some View {
        
        HStack{
            Text(materiaPrueba.materiaName)
            Spacer()
            Image(systemName:"pencil.circle.fill").foregroundColor(.blue)
                .frame(width: 50)
                    
        }
    }
}

struct materiaRenglonCustom_Previews: PreviewProvider {
    static var previews: some View {
        let materiaPrueba: Materia = Materia(materiaName: "materiaName", tareas: tareas)
        
        materiaRenglonCustom(materiaPrueba: materiaPrueba)
    }
}
