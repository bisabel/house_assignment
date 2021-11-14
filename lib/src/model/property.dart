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

import 'package:house_assignment/src/model/media.dart';

///Represents a Property "in sale"
class Property {

  final int id;//Id
  final int price;//Koopprijs
  final String title;//Adres
  final String description;//Omschrijving,VolledigeOmschrijving
  final String city; //Plaats;
  final String postcode; //Postcode;
  ///Contains a list of media sources such as images.
  final List<Media> media;//MediaItems; MediaItems Map:Category,Height,Url
  final double x;//WGS84_X looks like latitude
  final double y;//WGS84_Y looks like longitude
  final int wonen;//WoonOppervlakte
  final int parcel;//PerceelOppervlakte
  final DateTime publicationDate;//PublicatieDatum
  final int numberBathrooms;//AantalBadkamers
  final int numberRooms;//AantalKamers
  final String contactTitle;//Makelaar
  final String contactPhone;//MakelaarTelefoon
//  final String vendedor;//Makelar

  Property({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.city,
    required this.postcode,
    required this.media,
    required this.x,
    required this.y,
    required this.wonen,
    required this.parcel,
    required this.publicationDate,
    required this.numberBathrooms,
    required this.numberRooms,
    required this.contactTitle,
    required this.contactPhone,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    var list = json['Media'] as List;
    //TODO I am filtering to get only picture. 
    //But is need to remove the filter and how videos and other media types.
    list = list.where((element) => (element['Categorie'] == 1 && element['ContentType'] == 1)).toList();
    List<Media> mediaList = list.map((i) => 
        Media.fromJson(i)).toList();
    return Property(
      id: json['Id'],
      price: json['Koopprijs'],
      title: json['Adres'],
      description: json['VolledigeOmschrijving'],
      city: json['Plaats'],
      postcode: json['Postcode'],
      media: mediaList,
      x: json['WGS84_X'],
      y: json['WGS84_Y'],
      wonen: json['WoonOppervlakte'],
      parcel: json['PerceelOppervlakte'],  
      publicationDate: formatJsonDate(json['PublicatieDatum']),          
      numberBathrooms: json['AantalBadkamers'],          
      numberRooms: json['AantalKamers'],          
      contactTitle: json['Makelaar'],          
      contactPhone: json['MakelaarTelefoon'],          
    );
  }

  ///Parse a JSON date into DateTime UTC local
  //extract from https://stackoverflow.com/questions/56505658/parse-json-date-in-flutter
  static DateTime formatJsonDate(String raw){
    var numeric = raw.split('(')[1].split(')')[0];
    var negative = numeric.contains('-');
    var parts = numeric.split(negative ? '-' : '+');
    var millis = int.parse(parts[0]);
    return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
  }
}