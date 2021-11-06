//
//  DragButtonTrack.swift
//  SwiftUIJam21
//
//  Created by Emilio Peláez on 6/11/21.
//

import SwiftUI

extension DragButton {
	struct Track: View {
		let thumbSize: Double
		let expandedHeight: Double
		let notches: Int
		let expanded: Bool
		
		var body: some View {
			ZStack {
				Capsule()
					.fill(Color(UIColor.systemGray5))
				VStack(spacing: 0) {
					ForEach(0..<notches) { index in
						if index != 0 {
							Spacer(minLength: 0)
								.layoutPriority(0)
						}
						if expanded {
							Capsule()
								.fill(Color(.systemGray3))
								.frame(height: 1 + Double(notches - index) * 0.2)
								.transition(.asymmetric(insertion: .scale(scale: 0.01)
																					.animation(.linear.delay(0.015 * Double(notches - index))),
																				removal: .offset(x: 0, y: (expandedHeight - thumbSize) * Double(notches - index) / Double(notches))))
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

struct DragButtonTrack_Previews: PreviewProvider {
	static var previews: some View {
		DragButton.Track(thumbSize: 35, expandedHeight: 125, notches: 10, expanded: true)
			.previewLayout(.fixed(width: 35, height: 125))
		
	}
}
