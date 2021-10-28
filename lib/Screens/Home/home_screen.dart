import 'package:flutter/material.dart';
import 'package:maytremeesh/Data/dummy_data.dart';
import 'package:maytremeesh/Screens/Home/Components/drawer.dart';
import 'package:maytremeesh/Screens/Home/Components/drop_down.dart';
import 'package:maytremeesh/Screens/Home/Components/package_row_builder.dart';
import 'package:maytremeesh/Screens/Home/Components/recommended_row_builder.dart';
import 'package:maytremeesh/Screens/Home/Components/search_delegate.dart';
import 'package:maytremeesh/Screens/Home/Components/venues_row_builder.dart';
import 'package:maytremeesh/constants.dart';
import 'Components/item_row_builder.dart';
import '../../Components/header.dart';
import './Components/home_page_haeder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: DropDown(),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => showSearch(context: context, delegate: Search()),
              icon: Icon(Icons.search))
        ],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageHeader(head1: 'Freshly Made ', head2: 'Meals!'),
              Header(header: 'Recommended', size: 26),
              SizedBox(
                height: size.height * 0.015,
              ),
              RecommendedRow(size: size),
              SizedBox(
                height: size.height * 0.025,
              ),
              Header(header: 'Items', size: 26),
              SizedBox(
                height: size.height * 0.015,
              ),
              ItemRow(
                size: size,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Header(header: 'Packages', size: 26),
              SizedBox(
                height: size.height * 0.015,
              ),
              PackageRow(size: size),
              SizedBox(
                height: size.height * 0.025,
              ),
              Header(header: 'Venues', size: 26),
              SizedBox(
                height: size.height * 0.015,
              ),
              VenueBuilder(
                size: size,
                venues: dummyVenues,
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
