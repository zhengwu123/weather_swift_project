//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by Zheng wu on 2/22/21.
//


import UIKit
import SwiftUI

struct SecondView: View {
  var body: some View {
      VStack {
          Text("Second View").font(.system(size: 36))
          Text("Loaded by SecondView").font(.system(size: 14))
      }
  }
}

class ChildHostingController: UIHostingController<SecondView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: SecondView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
