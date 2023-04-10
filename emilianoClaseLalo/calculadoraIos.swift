//
//  calculadoraIos.swift
//  emilianoClaseLalo
//
//  Created by Facultad de Contaduría y Administración on 10/04/23.
//

import SwiftUI



class EstadoCalculadora: ObservableObject{
    @Published var textoNumeros : String = ""
    @Published var estadoInicial = false
    
    @Published var banderaNuevoNumero = false
    
    @Published var num1 : Int = 0
    
    var operacion : String = ""
    
    func cleanAll() {
        textoNumeros = ""
        estadoInicial = true
        operacion = ""
        num1 = 0
    }
    
    func cleanNumero() {
        textoNumeros = ""
    }
    
    func capturarTecla(caracter: String) {
        
        if banderaNuevoNumero {
            cleanNumero()
        }
        
        textoNumeros = "\(textoNumeros)\(caracter)"
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
        switch self.operacion{
        case "x":
            textoNumeros = "\(self.num1 * (Int(textoNumeros) ?? 0))"
            break
        default:
            textoNumeros = " \(-10)"
            
        }
    }
    
}


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
                    
                    //botonesAcciones(estadoCalculadora: estadoCalculadora,lblsimbolo: "=")
                    botonIgual(estadoCalculadora: estadoCalculadora,lblsimbolo: "=")
                    botonesAcciones(estadoCalculadora: estadoCalculadora,lblsimbolo: "/")
                }
                
                Spacer()
                
                
            }
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
    
    var lblsimbolo: String
    
    var body: some View {
        Button(action: {
            estadoCalculadora.capturarOperacion(operacion: lblsimbolo)
            estadoCalculadora.realizarOperacion()
        }, label: {
                
            CustomColorBoton(color: .yellow, lblString: lblsimbolo)
                
            
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








struct calculadoraIos_Previews: PreviewProvider {
    static var previews: some View {
        calculadoraIos()
    }
}
