# house_assignment

A Flutter project with a single page

## Getting Started

Project for demonstration purposes. It is a starting point for a Flutter application. It contains a single page that shows the data of a property for sale. On the page appears an image, its location on the map, and various information such as address or description of the property. 

Use a external API to retrieve the property data. Need to configurate with a correctly KEY and IDPROPERTY, so please, set at lib/src/service/ApiEndpoint.dart

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Description

The source code are divide in three folders:
- Model: with the classes that modeling the data
- Service: with the classes that conect the data laye with the interface layer
- View: the clases that build the pages and visual components.

Regarding nomenclature: Navigable pages end with the word 'View'. Reusable components end with the word 'Widget'. 

## Future

- Implement for tablet and landscape screen.
- Implement a config file to store the KEY and IDPROPERTY.
