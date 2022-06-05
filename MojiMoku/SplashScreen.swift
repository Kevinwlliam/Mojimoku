//
//  SplashScreen.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 29/05/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            LoginView()
        }else{
            ZStack{
                Color.purple
                    .ignoresSafeArea()
                VStack{
                    Image(systemName: "hare.fill")
                        .font(.system(size:80))
                        .foregroundColor(.white)
                    Text("MojiMoku")
                        .font(.largeTitle)
                        .foregroundColor(.white.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
