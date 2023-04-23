//
//  calculadoraIos.swift
//  emilianoClaseLalo
//
//  Created by Facultad de Contaduría y Administración on 10/04/23.
//

import SwiftUI

struct calculadoraIos: View {
    
    
    @ObservedObject var estadoCalculadora : EstadoCalculadora = EstadoCalculadora()

    
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
                    botonesNumeros(estadoCalculadora: estadoCalculadora, lblNumero: "1")
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "2")
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "3")
                    botonesAcciones(estadoCalculadora: estadoCalculadora,lblsimbolo: "x")
                    
                }
                HStack{
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "4")
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "5")
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "6")
                    botonesAcciones(estadoCalculadora: estadoCalculadora,lblsimbolo: "+")
                }
                HStack{
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "7")
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "8")
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "9")
                    botonesAcciones(estadoCalculadora: estadoCalculadora,lblsimbolo: "-")
                }
                HStack{
                    botonesNumeros(estadoCalculadora: estadoCalculadora,lblNumero: "0")
                    
                    cleanAllBoton(estadoCalculadora: estadoCalculadora)
                    
                    botonIgual(estadoCalculadora: estadoCalculadora)
                    botonesAcciones(estadoCalculadora: estadoCalculadora,lblsimbolo: "/")
                }
                
                Spacer()
                
                
            }
        }
         
    }
}




struct calculadoraIos_Previews: PreviewProvider {
    static var previews: some View {
        calculadoraIos()
    }
}

