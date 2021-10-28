import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maytremeesh/Provider/token.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  final int id;
  FavoriteButton({required this.id});
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFav = false;
  Future<void> _changeFav() async {
    setState(() {
      isFav = !isFav;
    });
    if (isFav) {
      http.Response response = await http.post(
          Uri.parse(
              'http://maytrmeesh.herokuapp.com/api/items/${widget.id}/favorite/'),
          headers: <String, String>{
            'Authorization':
                'Token ${Provider.of<Token>(context, listen: false).token}'
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (isFav)
        ? IconButton(
            icon: Icon(
              Icons.favorite,
              size: 20,
              color: Colors.white,
            ),
            onPressed: _changeFav)
        : IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 20,
              color: Colors.white,
            ),
            onPressed: _changeFav);
  }
}
