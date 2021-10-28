import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maytremeesh/models/venue.dart';

class SearchBuilder extends StatelessWidget {
  final List<Venue>? venues;
  final Size size;
  const SearchBuilder({
    required this.size,
    this.venues,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: venues!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/venue-menu', arguments: {
                    'id': venues![index].id,
                    'name': venues![index].name,
                    'logo': venues![index].logoPath,
                  });
                },
                child: Container(
                    width: size.width * 0.64,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.network(
                            venues![index].logoPath,
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                        )),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            venues![index].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ))
                      ],
                    )),
              );
            }));
  }
}
