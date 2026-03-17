import 'package:flutter/material.dart';
import '../../../../data/models/crypto_coin.dart';

class CryptoDetailsHeader extends StatelessWidget {

  final CryptoCoin coin;
  const CryptoDetailsHeader({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
        
      ),
      child: Column(
        children: [
          Text("${coin.price}", style: TextStyle(
            color: Colors.white, 
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),),
          Row(
            children: [
              Text("High"),
              Text("low"),
              Text("vol")
            ],
          )
        ],
      ),
    );
  }
}