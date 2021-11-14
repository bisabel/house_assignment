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
import 'package:house_assignment/main.dart';
import 'package:house_assignment/src/model/media.dart';

///A collapsible app-bar for a property page view. When is extended, show a property's picture
class SliverPropertyBarWidget extends StatelessWidget {

  ///Padding for action icons
  static const EdgeInsets PADDINGACTIONCION = EdgeInsets.all(8.0);

  ///Title of the porperty
  final String title;
  ///Media to show in this SliverBar
  final Media media;

  SliverPropertyBarWidget(String this.title, this.media);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      onStretchTrigger: () {
        // Function callback for stretch
        return Future.value();
      },
      elevation: 0,
      floating: false,
      pinned: true,
      snap: false,
      //TODO change to the height of the picture show, or maximum
      expandedHeight: MediaQuery.of(context).size.height/3,
      backgroundColor: MyApp.primaryColor,
      centerTitle: true,
      actions: [
        Padding(
          padding: PADDINGACTIONCION,
          child: Icon(Icons.share, size: 28, color: Theme.of(context).textTheme.headline2?.color ),
        ),
        Padding(
          padding: PADDINGACTIONCION,
          child: Icon(Icons.favorite_border_outlined, size: 28, color: Theme.of(context).textTheme.headline2?.color ),
        ),
      ],
      title: Text(this.title,style: Theme.of(context).textTheme.headline2 ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        background:
          FittedBox(
            child: Image.network(this.media                  
                  .listPhoto.reduce((value, element) => 
                    value.height > element.height ? value:element).url ),
            fit: BoxFit.cover,
          )
          /*
          Stack(
            fit: StackFit.expand,
              children:[                          
                //Image.network('https://picsum.photos/250?image=9'),
                Image.network(this.media                  
                  .listPhoto.reduce((value, element) => 
                    value.height > element.height ? value:element).url ),
                //Row(),
              ],
          ),*/
      )
    );
  }

  
}