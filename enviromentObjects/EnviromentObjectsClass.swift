//
//  EnviromentObjectsClass.swift
//  emilianoClaseLalo
//
//  Created by Facultad de Contaduría y Administración on 03/05/23.
//

import SwiftUI

struct EnviromentObjectsClass: View {
    
    var body: some View {
        
        VistaLogin().environmentObject(Sesion())
    }
}

class Sesion: ObservableObject {
    @Published var isLogin: Bool = false
    
    func cerrarSesion() {
        isLogin = false
    }
    
    func iniciarSesion() {
        isLogin = true
    }
}

struct VistaLogin: View{
    @EnvironmentObject var sesion: Sesion
    
    var body: some View {
        
        VStack {
            Button(action: {
                
                if (sesion.isLogin){
                    sesion.cerrarSesion()
                } else {
                    sesion.iniciarSesion()
                }
            }, label: {
                if (sesion.isLogin){
                    Text("Cerrar sesion").font(.largeTitle)
                } else {
                    Text("iniciar sesion").font(.largeTitle)
                }
        })
            VistaEstadoSesion()
        }
        
        
    }
}

struct VistaEstadoSesion: View{
    @EnvironmentObject var sesion: Sesion
    
    var body: some View {
        if(sesion.isLogin){
            Text("sesion iniciada").font(.largeTitle)
        } else {
            Text("Aun no has iniciado sesion").font(.largeTitle)
        }
    }
}

struct EnviromentObjectsClass_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentObjectsClass()
    }
}
