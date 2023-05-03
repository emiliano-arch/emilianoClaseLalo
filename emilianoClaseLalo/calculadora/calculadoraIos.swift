//
//  calculadoraIos.swift
//  emilianoClaseLalo
//
//  Created by Facultad de Contaduría y Administración on 10/04/23.
//

import SwiftUI

struct calculadoraIos: View {
    
    
   // @ObservedObject var estadoCalculadora : EstadoCalculadora = EstadoCalculadora()
    @EnvironmentObject var estadoCalculadora : EstadoCalculadora
    
    var body: some View {
        
        ZStack{
            Color.black
            
            VStack{
                HStack{
                    Spacer()
                    Text(estadoCalculadora.textoNumeros).font(.largeTitle)
                        .foregroundColor(.white)
                    
                }
                Text("Debug Operacion:\(estadoCalculadora.operacion) num1 : \(estadoCalculadora.num1)").foregroundColor(.white)
                Divider()
                HStack{
                    botonesNumeros( lblNumero: "1")
                    botonesNumeros(lblNumero: "2")
                    botonesNumeros(lblNumero: "3")
                    botonesAcciones(lblsimbolo: "x")
                    
                }
                HStack{
                    botonesNumeros(lblNumero: "4")
                    botonesNumeros(lblNumero: "5")
                    botonesNumeros(lblNumero: "6")
                    botonesAcciones(lblsimbolo: "+")
                }
                HStack{
                    botonesNumeros(lblNumero: "7")
                    botonesNumeros(lblNumero: "8")
                    botonesNumeros(lblNumero: "9")
                    botonesAcciones(lblsimbolo: "-")
                }
                HStack{
                    botonesNumeros(lblNumero: "0")
                    
                    cleanAllBoton()
                    
                    botonIgual()
                    botonesAcciones(lblsimbolo: "/")
                }
                
                Spacer()
                
                
            }
        }
         
    }
}




struct calculadoraIos_Previews: PreviewProvider {
    static var previews: some View {
        calculadoraIos().environmentObject(EstadoCalculadora())
    }
}

