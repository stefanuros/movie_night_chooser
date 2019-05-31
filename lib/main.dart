import 'package:flutter/material.dart';

import 'homePage.dart';
import 'style.dart';

// This file starts the home page widget

// Main function that runs the MyApp function
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Movie Night Chooser',
			theme: ThemeData( 
				accentColor: Style.accentColour,
				// accentColor: Colors.teal,
				brightness: Brightness.dark,
			),
			// Load the home page
			home: HomePage(),
		);
	}
}
