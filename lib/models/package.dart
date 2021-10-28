import 'package:maytremeesh/models/package_item.dart';

class Package {
  final String name;
  final String imgPath;
  final int id;
  final int venueID;
  final List<PackageItem> items;
  final String description;
  final int discount;
  final int quantity;
  final double price;
  final int availabilityTime;
  final String venueName;
  final String venueLogoPath;
  const Package({
    required this.name,
    required this.imgPath,
    required this.id,
    required this.venueID,
    required this.description,
    required this.quantity,
    required this.price,
    required this.availabilityTime,
    required this.venueLogoPath,
    required this.venueName,
    required this.items,
    required this.discount,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    List<PackageItem> items = [];
    for (var item in json['package']['items']) {
      items.add(PackageItem.fromJson(item));
    }
    return new Package(
        id: json['package']['id'],
        imgPath: json['package']['image'],
        name: json['package']['name'].toString(),
        description: json['package']['description'],
        availabilityTime: json['availablity_time'],
        venueLogoPath: json['food_venue']['image'],
        price: double.parse(json['price']),
        venueName: json['food_venue']['name'],
        quantity: json['quantity'],
        items: items,
        discount: json['discount'],
        venueID: json['food_venue']['id']);
  }
}
