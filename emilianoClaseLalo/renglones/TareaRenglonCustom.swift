//
//  TareaRenglonCustom.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

struct TareaRenglonCustom: View {
    //@ObservedObject var materiaPrueba: Materias
    var body: some View {
        HStack{
            //Text(materiaPrueba.List[numMateria].tareas[])
            Spacer()
            Image(systemName:"pencil.circle.fill").foregroundColor(.blue)
                .frame(width: 50)
                    
        }
    }
}

struct TareaRenglonCustom_Previews: PreviewProvider {
    static var previews: some View {
        TareaRenglonCustom()
    }
}
