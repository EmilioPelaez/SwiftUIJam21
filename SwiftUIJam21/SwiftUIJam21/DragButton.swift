//
//  DragButton.swift
//  SwiftUIJam21
//
//  Created by Emilio Peláez on 5/11/21.
//

import CGMath
import SwiftUI

struct DragButton: View {
	let thumbSize: Double = 35
	let expandedHeight: Double = 125
	let notches: Int = 10
	
	@State var expanded = false
	@State var offset: Double = 0
	@State var value: Int = 1
	
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
			VStack {
				if expanded{
					Indicator(value: "\(value)")
					.frame(width: 35, height: 40)
					.transition(.asymmetric(insertion: .scale(scale: 0.02, anchor: .bottom).animation(.linear.delay(0.25)),
																	removal: .opacity))
				}
				Track(thumbSize: thumbSize, expandedHeight: expandedHeight, notches: notches, expanded: expanded)
			}
			
		}
		.gesture(drag)
	}
	
	var drag: some Gesture {
		DragGesture(minimumDistance: 0)
			.onChanged { gesture in
				if !expanded {
					withAnimation { expanded = true }
				}
				let distance = min(0, max(-expandedHeight + thumbSize, gesture.translation.height))
				offset = distance
				value = Int(abs(distance).remap(from: (0, expandedHeight - thumbSize), to: (1, 100)))
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
		DragButton(expanded: true)
			.frame(width: 35, height: 170, alignment: .bottom)
			.padding()
			.previewLayout(.sizeThatFits)
		
		DragButton(expanded: true)
			.frame(width: 35, height: 170, alignment: .bottom)
			.padding()
			.previewLayout(.sizeThatFits)
			.colorScheme(.dark)
	}
}
