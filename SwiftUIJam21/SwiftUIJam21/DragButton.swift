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
	@State var offset: Double = 0
	
	var body: some View {
		Group {
			ZStack {
				Circle()
					.fill(Color(.systemGray6))
					.shadow(color: Color(white: 0, opacity: 0.25), radius: 3, x: 0, y: 3)
				Circle()
					.stroke(Color(.systemGray5))
				Image(systemName: "plus")
					.foregroundColor(.primary)
			}
			.offset(x: 0, y: offset)
		}
		.frame(width: thumbSize, height: thumbSize)
		.background(alignment: .bottom) {
			Track(thumbSize: thumbSize, expandedHeight: expandedHeight, notches: notches, expanded: expanded)
		}
		.gesture(drag)
	}
	
	var drag: some Gesture {
		DragGesture()
			.onChanged { value in
				if !expanded {
					return withAnimation { expanded = true }
				}
				offset = min(0, max(-expandedHeight + thumbSize, value.translation.height))
			}
			.onEnded { _ in
				withAnimation {
					expanded = false
					offset = 0
				}
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
