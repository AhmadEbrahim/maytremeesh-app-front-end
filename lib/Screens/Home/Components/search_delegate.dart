import 'package:flutter/material.dart';
import 'package:maytremeesh/Data/dummy_data.dart';
import 'package:maytremeesh/Screens/Home/Components/searched_venue.dart';
import 'package:maytremeesh/models/venue.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Venue> searchedVenues = [];
    for (Venue venue in dummyVenues) {
      if (venue.name.toLowerCase().startsWith(query.toLowerCase())) {
        searchedVenues.add(venue);
      }
    }
    return searchedVenues.isNotEmpty
        ? SearchBuilder(
            size: MediaQuery.of(context).size, venues: searchedVenues)
        : Center(
            child: Text(
              'No Results!',
              style: TextStyle(fontSize: 24),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Venue> searchedVenues = [];
    for (Venue venue in dummyVenues) {
      if (venue.name.toLowerCase().startsWith(query.toLowerCase())) {
        searchedVenues.add(venue);
      }
    }
    return searchedVenues.isNotEmpty
        ? SearchBuilder(
            size: MediaQuery.of(context).size, venues: searchedVenues)
        : Center(
            child: Text(
              'No Results!',
              style: TextStyle(fontSize: 20),
            ),
          );
  }
}
