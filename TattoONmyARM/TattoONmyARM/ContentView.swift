//
//  ContentView.swift
//  TattoONmyARM
//
//  Created by Anthony Ankit on 22/10/20.
//

import SwiftUI

struct ContentView: View {
    let tattooArray = ["t1", "t2", "t3"]
    let boddyImageArray = ["b1", "b2", "b3"]
    @State var selectedTatto = ""
    @State var selectedPhoto = "b1"
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var angle: Angle = .zero
    @State private var zoomLevel: CGFloat = 1
    var body: some View {
        let pineGesture = MagnificationGesture().onChanged { (value) in
            self.zoomLevel = value
        }
        
        let rotationGesture = RotationGesture().onChanged { (value) in
            self.angle = value
        }
        
        let dragGesture = DragGesture().onChanged { value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
        }
        .onEnded { value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            self.newPosition = self.currentPosition
        }
        
        let allGesture = dragGesture.simultaneously(with: pineGesture).simultaneously(with: rotationGesture)
        
        NavigationView {
            VStack {
                GeometryReader{ _ in
                    VStack (alignment: .leading){
                        Text("Select Tattoo")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .padding(.top, 8)
                            .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: false){
                            VStack {
                                HStack {
                                    ForEach(tattooArray, id: \.self){tattoo in
                                        Image(tattoo)
                                            .resizable()
                                            .background(Color.red.opacity(0.3))
                                            .frame(width: 50, height: 60)
                                            .padding()
                                            .cornerRadius(4)
                                            .overlay(RoundedRectangle(cornerRadius: 4)
                                                        .stroke(Color("top").opacity(0.4), lineWidth: 1))
                                            .shadow(radius: 4)
                                            .onTapGesture(count: 1, perform: {
                                                selectedTatto = tattoo
                                            })
                                    }
                                }
                            }
                        }
                        .frame(height: 60)
                        .padding()
                        Text("Select Your Photo")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: false){
                            VStack {
                                HStack {
                                    ForEach(boddyImageArray, id: \.self){body in
                                        Image(body)
                                            .resizable()
                                            .background(Color.red.opacity(0.3))
                                            .frame(width: 50, height: 60)
                                            .padding()
                                            .cornerRadius(4)
                                            .overlay(RoundedRectangle(cornerRadius: 4)
                                                        .stroke(Color("top").opacity(0.4), lineWidth: 1))
                                            .shadow(radius: 4)
                                            .onTapGesture(count: 1, perform: {
                                                selectedPhoto = body
                                            })
                                    }
                                    
                                }
                            }
                        }
                        .frame(height: 60)
                        .padding()
                        Divider()
                        ZStack {
                            Image(selectedPhoto)
                                .resizable()
                                .padding()
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("top").opacity(0.4), lineWidth: 30))
                                .shadow(radius: 10)
                            
                            
                            Image(selectedTatto)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                                .rotationEffect(angle)
                                .scaleEffect(zoomLevel)
                                .gesture(allGesture)
                        }
                        .padding()
                        .padding(.horizontal, 20)
                        Divider()
                        HStack {
                            Spacer()
                            Button(action: {
                                print("share image")
                            }){
                                Image("ic_share")
                                    .resizable()
                                    .frame(width: 34, height: 34, alignment: .center)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .navigationBarTitle("Paint Your Tattoo", displayMode: .inline)
                }
            }.background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


