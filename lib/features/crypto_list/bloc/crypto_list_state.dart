import 'package:equatable/equatable.dart';
import '/data/models/crypto_coin.dart';

abstract class CryptoListState extends Equatable {
  const CryptoListState();

  @override
  List<Object> get props => [];
}

class CryptoListLoading extends CryptoListState {}

class CryptoListError extends CryptoListState {
  final String message;

  const CryptoListError({required this.message});

  @override
  List<Object> get props => [message];
}

class CryptoListLoaded extends CryptoListState {
  
 final  List<CryptoCoin> coins;

  final bool hasReachedMax;


  const CryptoListLoaded({required this.coins, this.hasReachedMax = false});

  @override
  List<Object> get props => [coins, hasReachedMax];

  CryptoListLoaded copyWith({List<CryptoCoin>? coins, bool? hasReachedMax}) {
    return CryptoListLoaded(
      coins: coins ?? this.coins,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
