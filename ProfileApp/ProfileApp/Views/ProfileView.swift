import SwiftUI

struct ProfileView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var nickname: String
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Text("👤") // Базовая эмодзи для профиля
                    .font(.system(size: 50))
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    TextField("Nickname", text: $nickname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
            
            Spacer()
            Button(action: {
                dismiss()
            }) {
                Text("Save")
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Profile Info")
        .padding()
    }
}

#Preview {
    ProfileView(firstName: .constant(""), lastName: .constant(""), nickname: .constant(""))
}
