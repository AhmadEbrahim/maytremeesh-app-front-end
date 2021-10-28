import 'package:maytremeesh/models/item.dart';
import 'package:maytremeesh/models/venue.dart';

List<Item> dummyItems = [
  Item(
      name: 'Strawberry tart',
      imgPath:
          'https://cdn.pixabay.com/photo/2018/11/05/03/03/strawberry-tart-3795363_960_720.jpg',
      id: 1,
      description:
          'a light and delicate strawberry tart. The crust is a simple no-chill version of a pie crust that we are obsessed with. Nothing says spring like this strawberry tart.',
      quantity: 3,
      price: 22.50,
      availabilityTime: 5,
      venueLogoPath:
          'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/13be4f154d47a2fd61cb0d60a9b985d2d0dd7e5d/la%20poire.svg',
      venueName: 'La Poire',
      discount: 30,
      venueID: 1),
  Item(
      name: 'Cheese Cake',
      imgPath:
          'https://cdn.pixabay.com/photo/2016/03/27/19/23/tart-1283822_960_720.jpg',
      id: 2,
      description:
          'Look no further for a creamy and ultra smooth classic cheesecake.' +
              '\nPaired with a buttery graham cracker crust, no one can deny it' +
              's simple decadence.',
      quantity: 3,
      price: 33.25,
      availabilityTime: 5,
      venueLogoPath:
          'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/13be4f154d47a2fd61cb0d60a9b985d2d0dd7e5d/la%20poire.svg',
      venueName: 'La Poire',
      discount: 30,
      venueID: 1),
  Item(
      name: 'Croissant',
      imgPath:
          'https://cdn.pixabay.com/photo/2012/02/28/00/55/background-17943_960_720.jpg',
      id: 4,
      description:
          'A freshly baked croissant, light, flaky and delicatly sweet only for you.',
      quantity: 3,
      price: 15.50,
      availabilityTime: 3,
      venueLogoPath:
          'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/f73bc11e3d9d29e2b34a45fa622ad810f7fb45bb/dukes.svg',
      venueName: 'Dukes',
      discount: 30,
      venueID: 1),
  Item(
      name: 'Caramel Latte',
      imgPath:
          'https://cdn.pixabay.com/photo/2016/04/26/03/55/salmon-1353598_960_720.jpg',
      id: 5,
      description:
          'A delecious and fargrant cup of coffee, with sweet caramel to lighten your day',
      quantity: 3,
      price: 10.00,
      availabilityTime: 5,
      venueLogoPath:
          'https://drive.google.com/file/d/1AOn9L1dk5d3Sn71i64UegjoXfx4DtToU/view?usp=sharing',
      venueName: 'Dukes',
      discount: 30,
      venueID: 1),
  Item(
      name: 'tart',
      imgPath:
          'https://cdn.pixabay.com/photo/2012/02/28/00/55/background-17943_960_720.jpg',
      id: 6,
      description: 'Look no further for a creamy and ultra smooth classic tart.' +
          '\nPaired with a buttery graham cracker crust, no one can deny it' +
          's simple decadence.',
      quantity: 3,
      price: 10.00,
      availabilityTime: 5,
      venueLogoPath:
          'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/13be4f154d47a2fd61cb0d60a9b985d2d0dd7e5d/la%20poire.svg',
      venueName: 'La Poire',
      discount: 30,
      venueID: 1),
  Item(
      name: 'club sandwich',
      imgPath:
          'https://cdn.pixabay.com/photo/2019/01/29/20/01/club-sandwich-3963184_960_720.jpg',
      id: 7,
      description: 'Look no further for a creamy classic cake.' +
          '\nPaired with a buttery graham cracker crust, no one can deny it' +
          's simple decadence.',
      quantity: 3,
      price: 10.00,
      availabilityTime: 5,
      venueLogoPath:
          'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/13be4f154d47a2fd61cb0d60a9b985d2d0dd7e5d/la%20poire.svg',
      venueName: 'La Poire',
      discount: 30,
      venueID: 1),
];

final List<Venue> dummyVenues = [
  Venue(
    id: 1,
    name: 'Dunkin Donuts',
    logoPath:
        'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/f73bc11e3d9d29e2b34a45fa622ad810f7fb45bb/dunkin-donuts-1.svg',
  ),
  Venue(
    id: 2,
    name: 'Dukes',
    logoPath:
        'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/f73bc11e3d9d29e2b34a45fa622ad810f7fb45bb/dukes.svg',
  ),
  Venue(
      id: 3,
      name: 'La Poire',
      logoPath:
          'https://raw.githubusercontent.com/mahmoudesmail51/Maytrmeesh---backend/13be4f154d47a2fd61cb0d60a9b985d2d0dd7e5d/la%20poire.svg')
];
