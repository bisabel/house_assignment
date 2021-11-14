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

import 'package:house_assignment/src/model/photo.dart';

///Generally, represents a media resource of a property in sale
///At the moment, only represents a JPG file (Category == 1 and contentType == 1)
///Can contains diferent Photo resolutions
class Media {

  final int category;//Categorie
  final int contentType;//ContentType
  final int indexNumber;//IndexNumber
  final List<Photo> listPhoto;
  
  //final String media; //MediaItems; MediaItems Map:Category,Height,Url

  Media({
    required this.category,
    required this.contentType,
    required this.indexNumber,
    required this.listPhoto,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    var list = json['MediaItems'] as List;
    //print("Index:"+json['IndexNumber'].toString()+" cat: "+json['Categorie'].toString()+" type: "+json['ContentType'].toString());
    List<Photo> listPhoto = list.map((i) => Photo.fromJson(i)).toList();    
    return Media(     
        category: json['Categorie'],
        contentType: json['ContentType'],
        indexNumber: json['IndexNumber'],
        listPhoto: listPhoto,
    );
  }

}