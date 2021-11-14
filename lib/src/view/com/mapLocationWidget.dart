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
import 'package:flutter_map/flutter_map.dart';
import 'package:house_assignment/src/view/propertyView.dart';
import 'package:latlong2/latlong.dart';

/// Show a location over a Open Street Map
/// Centered in the point passed.
class MapLocationWidget extends StatelessWidget{

  static const double INITIALMAPZOOM = 13.0;
  static const double SIZEMARKER = 80.0;

  final LatLng latlng;
  MapLocationWidget(this.latlng);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PropertyViewWidget.PADDINGBETWEENELEMENTS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: PropertyViewWidget.PADDINGSECTIONTITLE,
              child: Text("Location:", style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.left,),
            ),
            //why aspect ratio 3/2? Need check portrait / landscape screen
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
              width: MediaQuery.of(context).size.width,
              child: FlutterMap(
                options: MapOptions(
                  center: latlng,
                  zoom: INITIALMAPZOOM,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return Text("© OpenStreetMap");
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: SIZEMARKER,
                        height: SIZEMARKER,
                        point: latlng,
                        builder: (ctx) =>
                        Container(
                          child: Icon(Icons.house, color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],

              )),
            ),
          ]
        )
    );
  }

}