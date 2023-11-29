import 'package:flutter/material.dart';
import '/Classes/responsiveness/responsiveness.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final Function(int) onSelectedQuantityChanged; // Function to update selected quantity
  final Color? color;
  final Color? text_color;

  QuantitySelector({
    required this.initialValue,
    required this.onSelectedQuantityChanged, // Pass the function
    required this.color,
    required this.text_color,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: quantity<10? 120 * WR: 130 * WR,
      // height: 36,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.fromLTRB(7 * WR, 0, 7 * WR, 0),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(100),
          right: Radius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (quantity > 0) {
                  --quantity;
                  widget.onSelectedQuantityChanged(quantity); // Call the function to update selected quantity
                }
              });
            },
            icon: Icon(Icons.remove, color: widget.text_color),
            padding: EdgeInsets.all(0),
          ),
          Text(
            quantity.toString(),
            style: TextStyle(
              color: widget.text_color,
              fontWeight: FontWeight.w600,
              fontSize: 17 * HR,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                ++quantity;
                widget.onSelectedQuantityChanged(quantity); // Call the function to update selected quantity
              });
            },
            icon: Icon(Icons.add, color: widget.text_color),
            padding: EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}