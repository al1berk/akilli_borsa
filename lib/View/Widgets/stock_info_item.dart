import 'package:flutter/material.dart';
class StockInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon; // Optional icon for the label

  const StockInfoItem({
    Key? key,
    required this.label,
    required this.value,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0), // Added more margin for spacing
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Increased padding for more breathing room
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey[50]!, Colors.white], // Soft gradient from top to bottom
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0), // More rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Subtle black shadow
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4), // Deeper shadow for more depth
          ),
        ],
        border: Border.all(color: Colors.grey[300]!, width: 1.0), // Light border for a clean outline
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.blueGrey, size: 24.0), // Icon size and color
            const SizedBox(width: 10), // Space between icon and text
          ],
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.right, // Align the value to the right
            ),
          ),
        ],
      ),
    );
  }
}


