import SwiftUI

struct EmployeeListCell: View {
    
    var employee: EmployeeData
    
    var body: some View {
        HStack(spacing: 30) {
            
            AsyncImage(url: URL(string: employee.photo_url_small),
                       content: { image in image.imageModifier()},
                       placeholder: {
                Image(systemName: "photo.circle.fill")
                .iconModifier() })
                .scaledToFit()
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            
            EmployeeView(employee: employee)
        }
    }
}

struct EmployeeView: View {
    
    var employee: EmployeeData
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 7) {
            VStack(alignment:.leading, spacing: 5) {
                Text(employee.full_name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(employee.biography)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment:.leading, spacing: 10) {
                Button {
                    let phone = "tel://"
                    let phoneNumberformatted = phone + employee.phone_number
                    guard let url = URL(string: phoneNumberformatted) else { return }
                    UIApplication.shared.open(url)
                }
            label: {
                HStack {
                    Image(systemName: "mail")
                        .imageScale(.large)
                    Text("Email")}}
                Button {}
            label: {
                HStack {
                    Image(systemName:"phone")
                        .imageScale(.large)
                    Text("phone")}}
                
                HStack {
                    Text("Team:")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                    Text(employee.team)
                        .font(.caption2)
                }.padding(.trailing,20)
            }
            .foregroundColor(.black)
            .font(.caption2)
        }
    }
}
