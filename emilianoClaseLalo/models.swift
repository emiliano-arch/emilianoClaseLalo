//
//  models.swift
//  emilianoClaseLalo
//
//  Created by Emiliano Medina on 23/04/23.
//

import SwiftUI

//MARK: variables de prueba
var tareas = [
    tarea(tareaName: "prueba1"),
    tarea(tareaName: "prueba2"),
    tarea(tareaName: "prueba3"),
    tarea(tareaName: "prueba4"),
]

//MARK: enums
enum options {
case ADD
case EDIT
}

//MARK: structs
struct tarea: Identifiable {
    var id = UUID()
    var tareaName : String
}

struct Materia: Identifiable {
    var id = UUID()
    var materiaName : String
    var tareas: [tarea]
}




//MARK: observableObject

//Modelo de la calculadora
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

//Modelo de Materias
class Materias: ObservableObject, Identifiable{
    
    let id = UUID()
    @Published var List : [Materia] = []
    @Published var indice = 0
    
    func agregarMateria(materia: Materia) {
        List.append(materia)
    }
    
    func aumentar() {
        self.indice += 1
    }
    
    func agregarTarea(tarea: tarea) {
        
    }
    
    
}

