import 'package:flutter/material.dart';

import '../style.dart';

// The button that will be used on the home page to redirect the user
class RoundedButton extends StatelessWidget {
	// The text of the button
	final String buttonText;
	// The function the button will execute when pressed
	final Function buttonFunction;

	RoundedButton(this.buttonText, this.buttonFunction);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
			child: OutlineButton(
				// highlightColor: Colors.red,
				borderSide: BorderSide(
					color: Style.accentColour,
					width: 2
				),
				highlightedBorderColor: Style.accentColour,
				shape: RoundedRectangleBorder(
					// borderRadius: BorderRadius.circular(50)
				),
				splashColor: Style.splashColour,
				padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
				onPressed: buttonFunction,
				child: Text(
					buttonText,
					style: TextStyle(
						fontSize: 22,
						fontWeight: FontWeight.w300
					)
				)
			),
		);
	}
}
