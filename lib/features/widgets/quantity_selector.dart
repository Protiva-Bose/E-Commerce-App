import 'package:flutter/material.dart';
import '../../core/constant/app_colors.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35,
          height: 35,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: quantity > 1 ? onDecrement : null,
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        Text(
          '$quantity',
          style: const TextStyle(color: Colors.black),
        ),

        const SizedBox(width: 8),

        SizedBox(
          width: 35,
          height: 35,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onIncrement,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
