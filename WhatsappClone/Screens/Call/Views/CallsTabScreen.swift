//
//  CallsTabScreen.swift
//  WhatsappClone
//
//  Created by Raju Singh on 16/06/25.
//








import SwiftUI

struct CallsTabScreen: View {
    @State private var searchText = ""
    @State private var callHistory = CallHistory.all
    var body: some View {
        NavigationStack {
            List {
                Section {
                    CreateCallLinkSection()
                }
                Section {
                    ForEach (0..<20){ item in
                        RecentCallItemView()
                    }
                } header: {
                    Text("Recent")
                        .foregroundStyle(.whatsAppBlack).bold()
                        .font(.headline)
                        .textCase(nil)
                        
                }
            }
            .navigationTitle(Text("Calls"))
            .searchable(text: $searchText)
            .toolbar {
                leadingNavItem()
                trailingNavItem()
                principalNavItem()
            }
        }
    }
}
extension CallsTabScreen {
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading){
            Button("Edit") {
                
            }
        }
        
    }
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing){
            Button {
                
            } label: {
                Image(systemName: "phone.arrow.up.right")
            }
        }
        
    }
    @ToolbarContentBuilder
    private func principalNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("Call history", selection: $callHistory) {
                ForEach(CallHistory.allCases) { item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
    }
    
    private enum CallHistory: String, CaseIterable,Identifiable {
        case all, missed
        
        var id: String {
            return rawValue
        }
        
    }
}

private struct CreateCallLinkSection: View {
    var body: some View {
        HStack{
            Image(systemName: "link")
                .padding(7)
                .background(Color(.systemGray6))
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text("Creat Call Link")
                    .foregroundStyle(.blue)
                Text("Share a link for your WhatsApp call")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }
    }
}

private struct RecentCallItemView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 45 , height: 45)
            
            recentCallsTextView()
            
            Spacer()
            
             Text("Yesterday")
                .foregroundStyle(.gray)
            
            Image(systemName: "info.circle")
            
        }
    }
    
    private func recentCallsTextView() -> some View {
        VStack (alignment: .leading){
            Text("John Smith")
                .bold()
            HStack(spacing: 5){
                Image(systemName: "phone.arrow.up.right.fill")
                    
                Text("Outgoing")
                    
            }
            .font(.system(size: 14))
            .foregroundStyle(.gray)
        }
    }
}


#Preview {
    CallsTabScreen()
}
