//
//  DragButton.swift
//  SwiftUIJam21
//
//  Created by Emilio Peláez on 5/11/21.
//

import SwiftUI

struct DragButton: View {
	let thumbSize: Double = 35
	let expandedHeight: Double = 125
	let notches: Int = 10
	
	@State var expanded = false
	
	var body: some View {
		ZStack {
			Circle()
				.fill(Color(.systemGray6))
				.shadow(color: Color(white: 0, opacity: 0.25), radius: 3, x: 0, y: 3)
			Circle()
				.stroke(Color(.systemGray5))
			Image(systemName: "plus")
				.foregroundColor(.primary)
		}
		.frame(width: thumbSize, height: thumbSize)
		.onTapGesture {
			withAnimation(.easeIn(duration: 0.2)) {
				expanded.toggle()
			}
		}
		.background(alignment: .bottom) {
			Track(thumbSize: thumbSize, expandedHeight: expandedHeight, notches: notches, expanded: expanded)
		}
	}
}

struct DragButton_Previews: PreviewProvider {
	static var previews: some View {
		DragButton()
		//			.previewLayout(.fixed(width: 55, height: 55))
		//			.padding(.top, 90)
	}
}
