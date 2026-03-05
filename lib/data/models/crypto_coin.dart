class CryptoCoin {
  final String symbol;
  final String price;
  final String changePercent;

  CryptoCoin({
    required this.symbol,
    required this.price,
    required this.changePercent
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
      symbol: json['symbol'] as String,

      price: json['lastPrice'] as String, 

      changePercent: json['priceChangePercent'] as String, 
    );
  }
  
  String get baseSymbol => symbol.replaceAll('USDT', '');

  String get imageUrl => 'https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@1x/32/color/${baseSymbol.toLowerCase()}.png';
}