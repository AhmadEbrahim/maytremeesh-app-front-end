import 'package:flutter/material.dart';
import 'package:maytremeesh/constants.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelect extends StatelessWidget {
  const MultiSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MultiSelectItem> _advantages = [
      MultiSelectItem(0, 'Fresh food'),
      MultiSelectItem(1, 'Tastes good'),
      MultiSelectItem(2, 'Great experience'),
      MultiSelectItem(3, 'Good service'),
    ];

    List<MultiSelectItem> _disAdvantages = [
      MultiSelectItem(4, 'Tastes bad'),
      MultiSelectItem(5, 'Bad experience'),
      MultiSelectItem(6, 'Bad service'),
    ];
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.9,
          child: MultiSelectDialogField(
            chipDisplay: MultiSelectChipDisplay(
              chipColor: primaryColor.withOpacity(0.1),
              textStyle: TextStyle(
                  color: navyBlue, fontSize: 16, fontWeight: FontWeight.bold),
              icon: Icon(Icons.check),
            ),
            items: _advantages,
            title: Text(
              "What is your review on that venue?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            selectedColor: primaryColor,
            selectedItemsTextStyle:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(40)),
              border: Border.all(
                color: navyBlue,
                width: 2,
              ),
            ),
            buttonIcon: Icon(
              Icons.reviews_outlined,
              color: navyBlue,
            ),
            buttonText: Text(
              "What was good?",
              style: TextStyle(
                  color: navyBlue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onConfirm: (results) {
              _advantages = results.cast();
            },
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        SizedBox(
          width: size.width * 0.9,
          child: MultiSelectDialogField(
            chipDisplay: MultiSelectChipDisplay(
              chipColor: Colors.red.withOpacity(0.1),
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            items: _disAdvantages,
            title: Text(
              "What is your review on that venue?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            selectedColor: Colors.redAccent,
            selectedItemsTextStyle:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(40)),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            buttonIcon: Icon(
              Icons.reviews_outlined,
              color: Colors.black,
            ),
            buttonText: Text(
              "what was bad?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onConfirm: (results) {
              _disAdvantages = results.cast();
            },
          ),
        ),
      ],
    );
  }
}
