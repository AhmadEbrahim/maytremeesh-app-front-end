class PackageItem {
  final String id;
  final String name;
  final String imgPath;
  PackageItem({required this.id, required this.name, required this.imgPath});
  factory PackageItem.fromJson(Map<String, dynamic> json) {
    return PackageItem(
        id: json['id'].toString(), name: json['name'], imgPath: json['image']);
  }
}
