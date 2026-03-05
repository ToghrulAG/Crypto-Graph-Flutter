import '../models/crypto_coin.dart';
import '../network/api_client.dart';

class CryptoRepository {
  final ApiClient apiClient;

  CryptoRepository({required this.apiClient});

  List<CryptoCoin> _cachedCoins = [];

  Future<List<CryptoCoin>> getCoins({int page = 1, int limit = 20}) async {

    if(_cachedCoins.isEmpty) {
      final rawData = await apiClient.getTickers();

      _cachedCoins = rawData
          .map((json) => CryptoCoin.fromJson(json as Map<String, dynamic>))
          .where((coin) => coin.symbol.endsWith('USDT')) 
          .toList();
    }
    final startIndex = (page - 1) * limit;

    if(startIndex >= _cachedCoins.length) {
      return [];
    }
    
    return _cachedCoins.skip(startIndex).take(limit).toList();

  }
}