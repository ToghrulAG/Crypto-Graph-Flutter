import 'package:flutter/material.dart';

class CryptoListHeader extends StatelessWidget {
  const CryptoListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Coin · Market Cap',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              child: Text(
                'Price',
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(

              child: Text(
                '24%',
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
