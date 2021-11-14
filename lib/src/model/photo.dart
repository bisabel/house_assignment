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

///Represents a picture file (JPG) of a property in sale. The url represent the address where the resource can be accessed
class Photo {

  final int category;//Category
  final int height;//Height
  final int width;//Width  
  final String url;
  
  //final String media; //MediaItems; MediaItems Map:Category,Height,Url

  Photo({
    required this.category,
    required this.height,
    required this.width,
    required this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(     
        category: json['Category'],
        height: json['Height'],
        width: json['Width'],
        url: json['Url'],
    );
  }

}