import 'package:flutter/material.dart';
import 'package:maytremeesh/Provider/counter.dart';
import 'package:maytremeesh/constants.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  final Size size;
  final int max;
  const CounterPage({Key? key, required this.size, required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Counter counterBloc = Provider.of<Counter>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            counterBloc.decrement();
          },
          icon: Icon(
            Icons.remove,
          ),
          color: primaryColor,
          iconSize: 26,
        ),
        Text(
          '${counterBloc.counter}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        IconButton(
          onPressed: () {
            counterBloc.increment(max);
          },
          icon: Icon(
            Icons.add,
          ),
          color: primaryColor,
          iconSize: 26,
        )
      ],
    );
  }
}
