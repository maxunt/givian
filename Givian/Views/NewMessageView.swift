//
//  NewMessageView.swift
//  Givian
//
//  Created by Max U on 5/2/24.
//

import SwiftUI
import PhotosUI

struct NewMessageView: View {
    @State var targetPhoneNumber = ""
    @State var targetDate = Date()
    @State var uploadedImageItem: PhotosPickerItem?
    @State var uploadedImage: Image?
    var body: some View {
        VStack {
            // Target selection
            Text("New Message")
            HStack {
                Text("To: ")
                    .padding(10)
                TextField(
                    "(phone number)",
                    text: $targetPhoneNumber
                )
                .border(.secondary)
                .padding(10)
            }
            // Date selection
            HStack {
                DatePicker(
                    "Deliver Date: ",
                    selection: $targetDate,
                    displayedComponents: [.date]
                ).padding(10)
                Spacer()
            }
            Spacer()
            
            // Actions HStack
            HStack {
                VStack {
                    PhotosPicker("Image", selection: $uploadedImageItem, matching: .images)
    
                    // Any image we upload
                    uploadedImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                .task(id: uploadedImageItem) {
                    uploadedImage = try? await uploadedImageItem?.loadTransferable(type: Image.self)
                }
//                .onChange(of: uploadedImageItem) { _ in
//                    Task {
//                        do {
//                            let loaded = try await uploadedImageItem?.loadTransferable(type: Image.self)
//                            uploadedImage = loaded
//                            NSLog("Upload image success \(uploadedImage)")
//                        } catch {
//                            NSLog("Failed to upload image \(error.localizedDescription)")
//                        }
//                    }
//                }
                
                VStack {
                    Image(systemName: "plus.square")
                        .font(.system(size: 40, design: .rounded))
                        .foregroundColor(Color.black)
                        .padding(20)
                    Text("Image")
                }
                VStack {
                    Image(systemName: "plus.square")
                        .font(.system(size: 40, design: .rounded))
                        .foregroundColor(Color.black)
                        .padding(20)
                    Text("Video")
                }
                VStack {
                    Image(systemName: "plus.square")
                        .font(.system(size: 40, design: .rounded))
                        .foregroundColor(Color.black)
                        .padding(20)
                    Text("Giftcard")
                }
            }
        }
    }
}

#Preview {
    NewMessageView()
}
