class Customer {
  final String token;
  String name;
  Customer({required this.name, required this.token});

  factory Customer.fromJson(Map<String, dynamic> parsedJson) {
    return Customer(
        name: parsedJson['first_name'].toString(),
        token: parsedJson['token'].toString());
  }
}
