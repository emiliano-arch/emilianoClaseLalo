//
//  Libs.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import Foundation
import SwiftUI


class EstadoCalculadora: ObservableObject{
    @Published var textoNumeros : String = "0"
    @Published var estadoInicial = true
    
    @Published var banderaNuevoNumero = false
    @Published var num1 : Int = 0
    
    var operacion : String = ""
    
    func cleanAll() {
        textoNumeros = "0"
        estadoInicial = true
        operacion = ""
        num1 = 0
        
    }
    
    func cleanNumero() {
        textoNumeros = "0"
        estadoInicial = true
    }
    
    func capturarTecla(caracter: String) {
        
        if banderaNuevoNumero {
            cleanNumero()
            banderaNuevoNumero = false
        }
        if estadoInicial {
            textoNumeros = "\(caracter)"
            estadoInicial = false
            
        } else {
            textoNumeros = "\(textoNumeros)\(caracter)"
        }
        
        
    }
    
    func capturarOperacion(operacion: String){
        self.operacion = operacion
        guardarNum1()
        
    }
    func guardarNum1(){
        self.num1 = Int(textoNumeros) ?? 0
        banderaNuevoNumero = true
    }
    
    func realizarOperacion() {
        
        switch operacion{
            
        case "x":
            textoNumeros = "\(self.num1 * (Int(textoNumeros) ?? 0))"
            break
        case "+":
            textoNumeros = "\(self.num1 + (Int(textoNumeros) ?? 0))"
            break
        case "-":
            textoNumeros = "\(self.num1 - (Int(textoNumeros) ?? 0))"
            break
        case "/":
            textoNumeros = "\(self.num1 / (Int(textoNumeros) ?? 0))"
            break
            
        default:
            textoNumeros = " \(-10)"
            
        }
    }
    
}


struct CustomColorBoton: View {
    
    var color : Color
    var lblString: String
    
    var body: some View {
        ZStack{
            color
            Text(lblString)
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}


struct cleanAllBoton: View {
    
    @ObservedObject var estadoCalculadora : EstadoCalculadora
    
    var body: some View {
        Button(action: {
            estadoCalculadora.cleanAll()
        }, label: {
                
            ZStack{
                Color.yellow
                Text("AC")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
                
            
        })
            
    }
    
}



struct botonesNumeros: View {
    @ObservedObject var estadoCalculadora : EstadoCalculadora
    var lblNumero : String
    
    var body: some View {
        Button(action: {
            estadoCalculadora.capturarTecla(caracter: lblNumero)
            }, label: {
                CustomColorBoton(color: .gray, lblString: lblNumero)
                
            })
            
    }
}

struct botonIgual: View {
    
    @ObservedObject var estadoCalculadora : EstadoCalculadora
    
    var body: some View {
        Button(action: {
            //estadoCalculadora.capturarOperacion(operacion: lblsimbolo)
            estadoCalculadora.realizarOperacion()
        }, label: {
                
            CustomColorBoton(color: .yellow, lblString: "=")
                
            
        })
            
    }
}


struct botonesAcciones: View {
    
    @ObservedObject var estadoCalculadora : EstadoCalculadora
    
    var lblsimbolo: String
    
    var body: some View {
        Button(action: {
            estadoCalculadora.capturarOperacion(operacion: lblsimbolo)
        }, label: {
                
            CustomColorBoton(color: .yellow, lblString: lblsimbolo)
                
            
        })
            
    }
}
