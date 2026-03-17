import 'package:crypto_graph/features/crypto_list/screens/coin_details_screen/coin_details_header.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/crypto_coin.dart';

class CryptoDetailsScreen extends StatelessWidget {
  final CryptoCoin coin;
  const CryptoDetailsScreen({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        title: Text('bitcoin'),
        // ,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          CryptoDetailsHeader(coin: coin),
          Expanded(child: Center(child: Text('Graphic'))),
          Text('buy'),
          Text('sell'),
        ],
      ),
    );
  }
}
