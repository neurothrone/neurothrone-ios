//
//  Tab.swift
//  Neurothrone-iOS
//
//  Created by Zaid Neurothrone on 2022-11-28.
//

import Foundation

enum Tab: String {
  case home = "Home",
       about = "About",
       contact = "Contact",
       cv = "CV",
       portfolio = "Portfolio"
}

extension Tab: Identifiable, CaseIterable {
  var id: Self { self }
}
