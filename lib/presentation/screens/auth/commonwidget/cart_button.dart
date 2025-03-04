import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final String initialQuantity;

  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  const CartButton({
    super.key,
    required this.initialQuantity,
    this.onDecrement,
    this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onDecrement, icon: const Icon(Icons.remove)),
          Text(initialQuantity.toString()),
          IconButton(onPressed: onIncrement, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
