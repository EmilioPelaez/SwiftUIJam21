//
//  DragButtonIndicator.swift
//  SwiftUIJam21
//
//  Created by Emilio Peláez on 6/11/21.
//

import SwiftUI

extension DragButton {
	struct Indicator: View {
		let value: String
		
		struct BackgroundShape: Shape {
			func path(in rect: CGRect) -> Path {
				var path = Path()
				let tip: CGFloat = rect.width / 50
				path.addArc(center: CGPoint(x: rect.midX, y: rect.midX),
										radius: rect.midX, startAngle: Angle(degrees: 75),
										endAngle: Angle(degrees: 105),
										clockwise: true)
				path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY - tip * 1.1),
										radius: tip,
										startAngle: Angle(degrees: 150),
										endAngle: Angle(degrees: 30),clockwise: true)
				path.closeSubpath()
				return path
			}
		}
		
		var body: some View {
			ZStack(alignment: .top) {
				BackgroundShape()
					.fill(.white)
					.shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 2)
				BackgroundShape()
					.stroke(Color(white: 0.9, opacity: 1))
				ZStack {
					Color.clear
					Text(value)
						.font(.caption)
						.monospacedDigit()
						.foregroundColor(.black)
				}
				.aspectRatio(1, contentMode: .fit)
			}
		}
	}
}

struct DragButtonIndicator_Previews: PreviewProvider {
	static var previews: some View {
		DragButton.Indicator(value: "1")
			.frame(width: 35, height: 40)
	}
}
