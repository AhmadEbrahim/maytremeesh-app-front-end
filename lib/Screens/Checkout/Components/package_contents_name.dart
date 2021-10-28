import 'package:flutter/material.dart';
import 'package:maytremeesh/models/package_item.dart';
import '../../../constants.dart';

class PackageContentsName extends StatelessWidget {
  const PackageContentsName({
    Key? key,
    required this.size,
    required this.items,
    required this.index,
  }) : super(key: key);

  final Size size;
  final List<PackageItem> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: size.width * 0.4,
          height: size.height * 0.05,
          padding: EdgeInsets.only(left: 8),
          color: primaryColor.withOpacity(0.8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${items[index].name}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    ));
  }
}
