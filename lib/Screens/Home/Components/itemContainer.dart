import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Components/fav_button.dart';
import '../../../constants.dart';

class ItemContainer extends StatelessWidget {
  final Size size;
  final String imgPath;
  final double price;
  final String venueLogoPath;
  final String itemName;
  final String venueName;
  final int availabilityTime;
  final int id;

  const ItemContainer({
    required this.size,
    required this.imgPath,
    required this.price,
    required this.venueLogoPath,
    required this.itemName,
    required this.venueName,
    required this.availabilityTime,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: size.width * 0.67,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.network(
                    imgPath,
                    width: 0.65 * size.width,
                    height: 0.2 * size.height,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FavoriteButton(
                                id: id,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.network(
                                  venueLogoPath,
                                  width: size.width * 0.08,
                                  height: size.height * 0.06,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(29),
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: size.width * 0.18,
                                    height: size.height * 0.03,
                                    child: Center(
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Text(
                                          'EGP $price',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            fontFamily: 'Caturra',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          child: Container(
            height: size.height * 0.048,
            width: size.width * 0.65,
            decoration: BoxDecoration(color: primaryColor.withOpacity(0.32)),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.026,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        itemName + ' - ' + venueName,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Proxima',
                            color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.022,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '$availabilityTime hrs left!',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
