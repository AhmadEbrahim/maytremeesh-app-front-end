class Item {
  final String name;
  final String imgPath;
  final int id;
  final int venueID;
  final String description;
  final int quantity;
  final double price;
  final int discount;
  final int availabilityTime;
  final String venueLogoPath;
  final String venueName;
  const Item(
      {required this.name,
      required this.imgPath,
      required this.id,
      required this.description,
      required this.quantity,
      required this.price,
      required this.availabilityTime,
      required this.venueLogoPath,
      required this.venueName,
      required this.discount,
      required this.venueID});
  factory Item.fromJson(Map<String, dynamic> json) {
    return new Item(
        id: json['item']['id'],
        imgPath: json['item']['image'],
        name: json['item']['name'].toString(),
        description: json['item']['description'],
        availabilityTime: json['availablity_time'],
        venueLogoPath: json['food_venue']['image'],
        price: double.parse(json['price']),
        venueName: json['food_venue']['name'],
        quantity: json['quantity'],
        discount: json['discount'],
        venueID: json['food_venue']['id']);
  }
}
