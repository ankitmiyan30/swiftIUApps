//
//  EditMeetingSwiftUIView.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 28/09/20.
//

import SwiftUI

struct EditMeetingSwiftUIView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var meetingTitle: String = ""
    var btnBack : some View { Button(action: {
        
        self.presentationMode.wrappedValue.dismiss()
        
    }) {
        HStack {
            if #available(iOS 14.0, *) {
                Image("back")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                
            } else {
                
            }
        }
    }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            
        })
    }
}

struct EditMeetingSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EditMeetingSwiftUIView()
    }
}










//VStack {
//    NavigationView {
//        ScrollView(.vertical) {
//            VStack (alignment: .leading, spacing: 8) {
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//
//                HStack (alignment: .top, spacing: 8){
//                    Image("rubicoit")
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .center)
//                    TextField("Meeting Tile", text: $meetingTitle, onEditingChanged: { (changed) in
//                        print("Updated Title - \($meetingTitle)")
//                    }) {
//                        print("Delete")
//                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
//                    .padding(.top, 8)
//                    .padding(.bottom, 8)
//                    .padding(.leading, 8)
//                    .border(Color.gray, width: 1)
//                    .cornerRadius(4)
//                    .edgesIgnoringSafeArea(.all)
//                }.padding()
//            }
//        }
//
//    }.navigationBarTitle("Edit Meeting")
//    .navigationBarBackButtonHidden(true)
//    .navigationBarItems(leading: btnBack)
//}.foregroundColor(.blue)
