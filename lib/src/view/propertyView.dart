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

import 'package:expandable_text/expandable_text.dart';
import 'package:house_assignment/main.dart';
import 'package:house_assignment/src/view/com/attributeSquareWidget.dart';
import 'package:house_assignment/src/view/com/mapLocationWidget.dart';
import 'package:house_assignment/src/model/property.dart';
import 'package:house_assignment/src/service/apiEndpoint.dart';

import 'package:flutter/material.dart';
import 'package:house_assignment/src/view/sliverPropertyBarWidget.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

/// Draws a navigable page with the info and media of a property.
class PropertyViewWidget extends StatefulWidget {

  ///Used in the padding between page elements
  static const EdgeInsets PADDINGBETWEENELEMENTS = EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 14.0);
  static const EdgeInsets PADDINGSECTIONTITLE = EdgeInsets.only(bottom: 4.0, top: 4.0);

  ///Identifier of the property,
  ///Will be use as a param in the API data request.
  final String idProperty;

  PropertyViewWidget(this.idProperty);

  @override
  _PropertyViewWidgetState createState() => _PropertyViewWidgetState();
}

class _PropertyViewWidgetState extends State<PropertyViewWidget> {

  late Future<Property> futureProperty;

  @override
  void initState() {
    super.initState();
    futureProperty = ApiEndpoint.fetchData(widget.idProperty);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Property>(
      future: futureProperty,
      builder: (context, snapshot) {

        //When data is available
        if (snapshot.hasData)
          return Scaffold(
          //backgroundColor: whiteVumer,
          body: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [

            SliverPropertyBarWidget(
              snapshot.data!.title, 
              snapshot.data!.media.reduce((value, element) => 
                value.indexNumber < element.indexNumber ? value:element)
            ),

            SliverToBoxAdapter(
              //key: Key("value1"),
              child: Container(
                color: MyApp.onNeutralColor,
                child: Column(
                  children: [

                    //highlights attributes
                    Container(
                      color: MyApp.primaryColor,
                      alignment: Alignment.center,                      
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AttributeSquareWidget(Icons.crop_square_outlined,"Dimension",snapshot.data!.wonen.toString()+"m²"),
                          AttributeSquareWidget(Icons.bed,"Rooms",snapshot.data!.numberRooms.toString()),
                          AttributeSquareWidget(Icons.calendar_today,"Since",DateFormat.yMd().format(snapshot.data!.publicationDate)),                          
                        ],
                      ),
                    ),

                    //collapsable container
                    Padding(
                      padding: PropertyViewWidget.PADDINGBETWEENELEMENTS,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: PropertyViewWidget.PADDINGSECTIONTITLE,
                                child: Text(snapshot.data!.price.toString()+"€", style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.left,),                           
                              ),
                              Text(snapshot.data!.postcode+" "+ snapshot.data!.city, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,),                           
                            ]
                          ),
                        ],
                      )
                    ),                 

                    //collapsable container
                    Padding(
                      padding: PropertyViewWidget.PADDINGBETWEENELEMENTS,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: PropertyViewWidget.PADDINGSECTIONTITLE,
                            child: Text("Description:", style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.left,),
                          ),
                          ExpandableText(
                            snapshot.data!.description,
                            style: Theme.of(context).textTheme.bodyText1,
                            expandText: 'show more',
                            collapseText: 'show less',
                            linkStyle: Theme.of(context).textTheme.caption,
                            maxLines: 3,
                            linkColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),

                    //The map
                    MapLocationWidget(LatLng(snapshot.data!.y,snapshot.data!.x)),

                    //contact buttons
                    Padding(
                      padding: PropertyViewWidget.PADDINGBETWEENELEMENTS,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: PropertyViewWidget.PADDINGSECTIONTITLE,
                            child: Text("Contact:", style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.left,),
                          ),
                          Text(snapshot.data!.contactTitle, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.left,),
                          Padding(
                            //Note, these values are arbitrary because is at the bottom of the page
                            padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: (){},
                                  child: Text("Phone", style: Theme.of(context).textTheme.headline6),
                                ),
                                ElevatedButton(
                                  onPressed: (){},
                                  child: Text("Email", style: Theme.of(context).textTheme.headline6),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              )
            ),

        ])
          );
             
        else if (snapshot. hasError)
          //TODO improve error/no data widget. Create a reusable widget
          return Scaffold(
            body: Center(
              child: Padding(
                padding: PropertyViewWidget.PADDINGBETWEENELEMENTS,
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ERROR"),
                    Text("Please, check if you set correctly the keys in the class ApiEndpoint located at lib/src/service/"),
                  ],
                ),
              )
            )
          );
        else
          //TODO improve error/no data . Create a reusable widget
          return Scaffold(
            body: Center(
              child: Padding(
                padding: PropertyViewWidget.PADDINGBETWEENELEMENTS,
                child: Text("LOADING"),
              )
            )
          );
        
      }
    );
  }

}