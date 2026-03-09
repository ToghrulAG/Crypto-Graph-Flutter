import 'package:flutter/material.dart';
import '../../../data/models/crypto_coin.dart';

class CryptoListItem extends StatelessWidget {
  final CryptoCoin coins;

  const CryptoListItem({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    final String rank = '1';
    final String marketCap = '\$1.3T';
    final double change24h = 2.07;

    final isPositive = change24h >= 0;
    final changeColor = isPositive ? Colors.greenAccent : Colors.redAccent;
    final changePrefix = isPositive ? '+' : '';

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.star_border, color: Colors.grey, size: 16),
                const SizedBox(width: 8),
                Text(
                  rank,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 8),
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.currency_bitcoin,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coins.symbol.replaceAll('USDT', ''),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      marketCap, // Placeholder for market cap
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "\$${double.parse(coins.price).toStringAsFixed(2)}", // Display price
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(child: Align(

            alignment: Alignment.centerRight,
            child: Text(
              '$changePrefix${change24h.toStringAsFixed(2)}%', // Display 24h change
              style: TextStyle(
                color: changeColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ))
        ],
      ),
    );
  }
}
