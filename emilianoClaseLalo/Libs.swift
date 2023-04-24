//
//  Libs.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import Foundation
import SwiftUI



//MARK: funciones de textos
struct Title: View {
    var texto: String
    var body: some View {
        
        Text(texto)
            .font(.largeTitle)
            .foregroundColor(.black)
            .bold()
    }
    
}

struct TareasCustom: View {
    var listTareas: [tarea]
    var body: some View {
        
        
        
        List(listTareas) { tarea in
            Text(tarea.tareaName)
                .font(.subheadline)
                .foregroundColor(.gray)
            //Divider()
        }
            
    }
    
}

//MARK: Funciones de asignacion

struct asignarMaterias: View {
    @ObservedObject var materiasList : Materias
    @State var show = false
    
    
    var body: some View {
        VStack{
            Button("nueva materia") {
                show.toggle()
            }
            .fullScreenCover(isPresented: $show, content: {
                newMateria(materiasList: materiasList)
            })
            
            
        }
        
    }
}

struct asignarTarea: View {
    @ObservedObject var materiasList : Materias
    @State var show = false
    var opcion: options
    
    
    var body: some View {
        VStack{
            Button("nueva tarea") {
                show.toggle()
            }
            .fullScreenCover(isPresented: $show, content: {
                newTarea(opcion: opcion, materiasList: materiasList)
            })
            
            
        }
        
    }
}




// MARK: funciones de la calculadora
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
