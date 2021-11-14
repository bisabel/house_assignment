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

/// A column widget that shows: icon, heading, value.
/// Designed to show an property's attribute.
class AttributeSquareWidget extends StatelessWidget{

  final IconData iconData;
  final String heading;
  final String value;

  AttributeSquareWidget(this.iconData,this.heading, this.value)
    :super(key: Key("AttributeSquareWidget"+heading));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Icon(iconData, size: 28, color: Theme.of(context).textTheme.headline5?.color ),
          Text(heading, style: Theme.of(context).textTheme.headline5),
          Text(value, style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }

}