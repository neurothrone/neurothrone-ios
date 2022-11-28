//
//  ContentView.swift
//  Neurothrone-iOS
//
//  Created by Zaid Neurothrone on 2022-11-28.
//

import SwiftUI

private extension Tab {
  var systemImage: String {
    switch self {
    case .home:
      return "house"
    case .about:
      return "person.fill"
    case .contact:
      return "envelope.fill"
    case .cv:
      return "note.text"
    case .portfolio:
      return "briefcase.fill"
    }
  }
  
  @ViewBuilder
  var screen: some View {
    switch self {
    case .home:
      HomeScreen()
    case .about:
      AboutScreen()
    case .contact:
      ContactScreen()
    case .cv:
      CVScreen()
    case .portfolio:
      PortfolioScreen()
    }
  }
  
  @ViewBuilder
  var view: some View {
    NavigationStack {
      ZStack {
        Color(Constant.Color.secondaryBackgroundColor)
          .ignoresSafeArea()
        
        self.screen
      }
      .navigationTitle(self.rawValue)
//      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ContentView: View {
  @AppStorage("selectedTab")
  private var selectedTab: Tab = .home
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Group {
        ForEach(Tab.allCases) { tab in
          tab.view
            .tabItem {
              Label(tab.rawValue, systemImage: tab.systemImage)
            }
        }
      }
      .toolbarBackground(.visible, for: .tabBar)
      .toolbarBackground(Color(Constant.Color.primaryBackgroundColor), for: .tabBar)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
