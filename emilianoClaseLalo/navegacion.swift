//
//  navegacion.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

struct navegacion: View {
    @ObservedObject var materiaPrueba = Materias()
    
    
    var body: some View {
        VStack{
            Title(texto: "Materias")
            //materiaRenglonCustom(materiaPrueba: materiaPrueba.List)
            //materiaRenglonCustom(materiaPrueba: materiaPrueba)
           
            
            
        }
        
    }
}

struct navegacion_Previews: PreviewProvider {
    static var previews: some View {
        navegacion()
    }
}
