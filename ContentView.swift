//
//  ContentView.swift
//  Neumorphism
//
//  Created by Giuseppe, De Masi on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    //slider..
    //sample slider value..
    @State var value: CGFloat = 50
    
    @State private var isTapped: Bool = false
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                HStack {
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "arrow.left")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black.opacity(0.5))
                            .padding()
                            .background(Color("Color"))
                            .clipShape(Circle())
                        //adding neumorphic effect..
                            .shadow(color: Color("Color1").opacity(0.55), radius: 5, x: 5, y: 5)
                            .shadow(color: .white, radius: 5, x: -5, y: -5)
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black.opacity(0.5))
                            .padding()
                            .background(Color("Color"))
                            .clipShape(Circle())
                            .shadow(color: Color("Color1").opacity(0.55), radius: 5, x: 5, y: 5)
                            .shadow(color: .white, radius: 5, x: -5, y: -5)
                    })
                }
                
                Text("Now Playing")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(.black.opacity(0.5))
            }
            
            //Track image..
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding()
                .background(Color("Color").opacity(0.7))
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.4), radius: 5, x: 8, y: 8)
                .shadow(color: .white, radius: 10, x: -10, y: -10)
                .padding(8)
                .padding(.top, 20)
            
            //music details..
            Text("Chicago Freestyle")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.5))
                .padding(.top, 25)
            
            Text("Drake feat. Giveon")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.45))
                .padding(-1)
            
            HStack {
                Text("0:00")
                    .font(.caption2)
                    .foregroundColor(.black.opacity(0.75))
                
                Spacer()
                
                Text("3:41")
                    .font(.caption2)
                    .foregroundColor(.black.opacity(0.75))
            }
            .padding(.top, 25)
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                
                Capsule()
                    .fill(Color.gray.opacity(0.25))
                    .frame(height: 6)
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                    
                    Capsule()
                        .fill(Color("Color1").opacity(0.65))
                        .frame(width: value, height: 6)
                    
                    //drag button..
                    Circle()
                        .fill(Color("Color1").opacity(0.7))
                        .frame(width: 8, height: 8)
                        .padding(10)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.55), radius: 5, x: 0, y: 0)
                }
            })
            
            .gesture(DragGesture().onChanged({ (value) in
                    
                    //tracking location
                    //limiting value for only slider...
                    //horizontal padding..
                if value.location.x <= UIScreen.main.bounds.width - 30 && value.location.x >= 0 {
                        
                        self.value = value.location.x
                    }
                
            }))
            
            //playground Buttons..
            HStack(spacing: 20) {
                
                Button(action: {}, label: {
                    
                    Image(systemName: "backward.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.black.opacity(0.5))
                        .padding(20)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.55), radius: 5, x: 5, y: 5)
                        .shadow(color: .white, radius: 5, x: -5, y: -5)
                })
                
                Button(action: {
                    withAnimation(.easeOut(duration: 0.25)) { self.isTapped.toggle() }
                }, label: {
                    
                    Image(systemName: self.isTapped ? "play.fill" : "pause.fill")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color("Color1").opacity(0.65))
                        //.rotationEffect(.degrees(self.isTapped ? 360 : 180))
                        .padding(20)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.55), radius: 5, x: 5, y: 5)
                        .shadow(color: .white, radius: 5, x: -5, y: -5)
                    })
                
                Button(action: {}, label: {
                    
                    Image(systemName: "forward.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.black.opacity(0.5))
                        .padding(20)
                        .background(Color("Color"))
                        .clipShape(Circle())
                        .shadow(color: Color("Color1").opacity(0.55), radius: 5, x: 5, y: 5)
                        .shadow(color: .white, radius: 5, x: -5, y: -5)
                })
            }
            .padding(.top, 25)
            
            Spacer()
        }
        .padding()
        .background(Color("Color")
                        .edgesIgnoringSafeArea(.all))
    }
}
