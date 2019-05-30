// This file handles the home page
import 'package:flutter/material.dart';

import 'joinPage.dart';
import 'roomPage.dart';


class HomePage extends StatelessWidget {
	// The help dialog text
	final String _dialogText = """To create a room where you and your friends submit movies to be chosen, press \"Create New Room\". You will create a room where your friends can join and submit movies to be chosen.
	
	To join an already existing room, press \"Join Existing Room\". You will need to enter the code of the room you would like to join, or scan a QR code. The code can be found at the top of the page of the room you want to join.

	To choose a movie with only one device, follow the steps for creating a room and submit all the movies from the same device.""";

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			// appBar: AppBar(
			// 	backgroundColor: Colors.teal,
			// 	title: Text("Movie Night Chooser"),
			// ),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: <Widget>[
						// Heading for the home page
						HomePageTitle("Welcome to the Movie Night Movie Chooser"),
						// Create Room Button
						RoundedTealButton("Create New Room", () {
							Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => RoomPage()),
							);
						}),
						// Join Room Button
						RoundedTealButton("Join Existing Room", () {
							Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => JoinRoomPage()),
							);
						}),
						// The Help Button
						HelpButton(_dialogText)
					],
				),
			),
		);
	}
}

// The header title of the home page
class HomePageTitle extends StatelessWidget {
	final String _headerTitle;

	HomePageTitle(this._headerTitle);

	@override
	Widget build(BuildContext context) {
		return SizedBox(
			height: MediaQuery.of(context).size.height/2,
			child: Align(
				child: SizedBox(
					width: 300,
					child: Text(
						_headerTitle,
						style: TextStyle(
							fontSize: 32,
							fontWeight: FontWeight.bold,
							// fontFamily: 'Lato'
						),
						textAlign: TextAlign.center
					)
				)
			)
		);
	}
}

// Class that defines the help button
class HelpButton extends StatelessWidget {
	final String _dialogText;

	HelpButton(this._dialogText);

	@override
	Widget build(BuildContext context) {
		return Expanded( // Makes this take up the bottom of the screen
			child: Align( // Aligns it to the bottomt of the screen
				alignment: Alignment(0, 1),
				child: Padding( // Pushes it a little off of the bottom of the screen
					padding: EdgeInsets.only(bottom: 16),
					child: FlatButton( // The actual button
						child: Text( //The help text
							"Help",
							style: TextStyle(
								color: Colors.grey,
								fontSize: 18
							),
						),
						onPressed: () { //Create a dialog when the button is pressed
							showDialog(
								context: context,
								builder: (_) => new AlertDialog(
									title: new Text("Instructions"),
									content: new Text(_dialogText),
									actions: <Widget>[
										FlatButton(
											child: Text('OK'),
											onPressed: () {
												Navigator.of(context).pop();
											},
										),
									],
								)
							);
						}
					)
				)
			)
		);
	}
}

// The button that will be used on the home page to redirect the user
class RoundedTealButton extends StatelessWidget {
	// The text of the button
	final String buttonText;
	// The function the button will execute when pressed
	final Function buttonFunction;

	RoundedTealButton(this.buttonText, this.buttonFunction);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
			child: OutlineButton(
				// highlightColor: Colors.red,
				borderSide: BorderSide(
					color: Colors.teal,
					width: 2
				),
				highlightedBorderColor: Colors.teal,
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(30)
				),
				splashColor: Colors.teal[300],
				padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
				// color: Colors.teal,
				onPressed: buttonFunction,
				child: Text(
					buttonText,
					style: TextStyle(
						fontSize: 20
					)
				)
			),
		);
	}
}
