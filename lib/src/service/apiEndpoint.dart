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

import 'dart:convert';
import 'package:house_assignment/src/model/property.dart';
import 'package:http/http.dart' as http;

///Intermediate class to retrieve the data from the API and represent it in the user interface
class ApiEndpoint {

  ///Key to call the external API
  static const KEY = "NEED TO SET ONE";
  ///The property's id that will be use to request its data to the API
  static const IDPROPERTY = "NEED TO SET ONE";
  
  ///Return the data of a property using a external API.
  ///Note you have to set a correctly the constant KEY, otherwise will throw an Exception
  static Future<Property> fetchData(String idProperty) async {
    final response = await http.get(Uri.parse('http://partnerapi.funda.nl/feeds/Aanbod.svc/json/detail/${KEY}/koop/${idProperty}'));
    if (response.statusCode == 200) {
      //TODO remove the variable. Now "p" in use to debug purpose
      Property p =  Property.fromJson(jsonDecode(response.body));
      return p;
    } else {
      throw Exception('Failed to load property');
    }
  }

  ///For internal purposes. In case to need a searching of new property Id
  static Future<dynamic> searchData() async {
    final response = await http.get(Uri.parse('http://partnerapi.funda.nl/feeds/Aanbod.svc/${KEY}/?type=koop&zo=/amsterdam/tuin/video/'));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to searching properties');
    }
  }

}