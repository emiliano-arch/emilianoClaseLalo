//
//

import SwiftUI

struct OperacionesVista: View {
    
    @State var estaActivo:Bool
    
    @State var valor:Int
    
    var body: some View {
        
        
        VStack{
            
            Spacer()
            
            Button(
                action: {
                    
                    valor = valor * valor
                    
                }, label: {
                    
                    Text("X")
                    //TextoTitulo(miTexto: "x")
                    
                })
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                ZStack{
                    
                    Button(
                        action: {
                            
                            valor = valor + 1
                            
                        }, label: {
                            
                            Text("+")
                            //TextoTitulo(miTexto: "+")
                            
                        })
                    
                }
                
                Spacer()
                
                Text("\(valor)")
                
                Spacer()
                
                ZStack{
                    
                    Button(
                        action: {
                            
                            valor = valor - 1
                            
                        }, label: {
                            
                            Text("-")
                            //TextoTitulo(miTexto: "-")
                            
                        })
                    
                }
                
                Spacer()
                
            }
            
            
            Spacer()
            
            Button(
                action: {
                    
                    valor = valor / valor
                    
                }, label: {
                    
                    Text("+")
                    //TextoTitulo(miTexto: "÷")
                    
                })
            
            Spacer()
            
        }
            
    }
}

struct SumaVista:View {
    
    var body: some View{
        
        VStack{
            
            Spacer()
            
            MasMenosVista(estaActivo: true, valor: 1)
            MasMenosVista(estaActivo: true, valor: 2)
            
            ResultadoVista(valor1: 1, valor2: 2, resultado: 3)
            
            Spacer()
            
        }
        
    }
    
}
                        

struct MasMenosVista: View {
    
    @State var estaActivo:Bool
    
    @State var valor:Int
    
    var body: some View {
        
        
        VStack{
            
            HStack{
                
                Spacer()
                
                ZStack{
                    
                    Button(
                        action: {
                            
                            valor = valor + 1
                            
                        }, label: {
                            
                            Text("+")
                           // TextoTitulo(miTexto: "+")
                            
                        })
                    
                }
                
                Spacer()
                
                Text("\(valor)")
                
                Spacer()
                
                ZStack{
                    
                    Button(
                        action: {
                            
                            valor = valor - 1
                            
                        }, label: {
                            Text("-")
                            //TextoTitulo(miTexto: "-")
                            
                        })
                    
                }
                
                Spacer()
                
            }
            
            
        }
            
    }
}

struct ResultadoVista: View {
    
    @State var valor1: Int
    @State var valor2: Int
    
    @State var resultado: Int
    
    var body: some View {
        
        HStack{
            
            Spacer()
            
            Button(
                action: {
                    
                    resultado = valor1 + valor2
                    
                }, label: {
                    
                    Text(" = ")
                    //TextoTitulo(miTexto: " = ")
                    
                })
            
            Spacer()
            
            Text("\(resultado)")
            
            Spacer()
            
        }
        
    }
    
    
}

struct MasMenosVista_Previews: PreviewProvider {
    static var previews: some View {
        SumaVista()
    }
}
