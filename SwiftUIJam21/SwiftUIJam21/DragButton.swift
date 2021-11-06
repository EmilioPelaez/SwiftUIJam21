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
			Text("+")
				.monospacedDigit()
		}
		.frame(width: thumbSize, height: thumbSize)
		.onTapGesture {
			withAnimation(.easeIn(duration: 0.2)) {
				expanded.toggle()
			}
		}
		.background(alignment: .bottom) {
			ZStack {
				Capsule()
					.fill(.black)
				VStack(spacing: 0) {
					ForEach(0..<notches) { index in
						if index != 0 {
							Spacer(minLength: 0)
								.layoutPriority(0)
						}
						if expanded {
							Capsule()
								.fill(Color(.systemRed))
								.frame(height: 1 + Double(notches - index) * 0.2)
								.transition(.opacity)
//								.transition(.opacity.combined(with: .scale(scale: 2)).animation(.linear.delay(0.2 + 0.05 * Double(index))))
						}
					}
				}
				.padding(.horizontal, 4)
				.padding(.top, expanded ? 15 : 0)
				.padding(.bottom, expanded ? thumbSize + 5 : 9)
			}
			.frame(height: expanded ? expandedHeight : thumbSize)
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
