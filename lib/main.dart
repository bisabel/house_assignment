/*
 * Copyright (c) 2021 Bisabel
 *
 * This file is part of House_Assignment.
 *
 * House_Assignment is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * House_Assignment is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with House_Assignment. If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:house_assignment/src/service/apiEndpoint.dart';
import 'package:house_assignment/src/view/propertyView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  static const Color neutralColor = Color(0xFF000000);
  ///to user over the neutral color
  static const Color onNeutralColor = Color(0xFFFFFFFF);

  static const Color primaryColor = Color(0xFF20C1BD);
  ///to user over the primary color
  static const Color onPrimaryColor = Color(0xFFFFFFFF);

  static const Color secondaryColor = Color(0xFF3D3D3D);
  ///to user over the primary color
  static const Color onSecondaryColor = Color(0xFFFFFFFF);

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: onPrimaryColor,
    primary: primaryColor,
    padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Merriweather',
        primaryColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
        textTheme: const TextTheme(
            headline2: TextStyle(fontSize: 30.0, fontFamily: 'WorkSans', color: onNeutralColor, fontWeight: FontWeight.w800),

            headline5: TextStyle(fontSize: 20.0, fontFamily: 'WorkSans', color: onPrimaryColor, fontWeight: FontWeight.w800),
            headline6: TextStyle(fontSize: 18.0, fontFamily: 'WorkSans', color: onPrimaryColor, ),

            //for paragraphs
            subtitle1: TextStyle(fontSize: 22.0, fontFamily: 'WorkSans', color: primaryColor),
            bodyText1: TextStyle(fontSize: 18.0, fontFamily: 'Merriweather', color: secondaryColor, height: 1.75 ),
            bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Merriweather', color: secondaryColor ),

            caption: TextStyle(fontSize: 18.0, fontFamily: 'WorkSans', color: secondaryColor, fontWeight: FontWeight.w800),
            button: TextStyle(fontSize: 24.0, fontFamily: 'WorkSans', color: onPrimaryColor, fontWeight: FontWeight.w800),
        ),
      ),
      //TODO change to a variable
      home: PropertyViewWidget(ApiEndpoint.IDPROPERTY),
    );
  }
}