//
//  calculadoraIos.swift
//  emilianoClaseLalo
//
//  Created by Facultad de Contaduría y Administración on 10/04/23.
//

import SwiftUI



class EstadoCalculadora: ObservableObject{
    @Published var textoNumeros : String = "0"
    
    func capturarTecla(caracter: String) {
        textoNumeros = "\(textoNumeros)\(caracter)"
    }
    
    func capturarOperacion(operacion: String){
        
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
                    
                    botonesAcciones(estadoCalculadora: estadoCalculadora,lblsimbolo: "=")
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
    
    func clean() {
        estadoCalculadora.textoNumeros = ""
    }
    
    var body: some View {
        Button(action: {
            clean()
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


    


struct botonesAcciones: View {
    
    @ObservedObject var estadoCalculadora : EstadoCalculadora
    
    var lblsimbolo: String
    
    var body: some View {
        Button(action: {
            estadoCalculadora.capturarTecla(caracter: lblsimbolo)
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
