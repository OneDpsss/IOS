import SwiftUI

struct ProfileButton: View {
    var title: String

    var body: some View {
        Text(title)
            .bold()
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView: View {
    let navigationManager = NavigationManager()
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var nickname: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to the Profile App")
                    .bold()
                    .font(.title)
                
                Text("Please enter your profile data to continue")
                    .padding()
                
                NavigationLink(destination: navigationManager.navigateToProfile(firstName: $firstName, lastName: $lastName, nickname: $nickname)) {
                    ProfileButton(title: "Go to Profile")
                }

                if !firstName.isEmpty || !lastName.isEmpty || !nickname.isEmpty {
                    HStack {
                        Text("👤") // Базовая эмодзи для профиля
                            .font(.system(size: 50))
                            .padding(.trailing, 10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("First Name: \(firstName)")
                            Text("Last Name: \(lastName)")
                            Text("Nickname: \(nickname)")
                        }
                    }
                    .padding()
                }
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
