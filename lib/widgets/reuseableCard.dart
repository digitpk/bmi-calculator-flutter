import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild, this.pressingCard});

  final Color colour;
  final Widget cardChild;
  final Function pressingCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressingCard,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
