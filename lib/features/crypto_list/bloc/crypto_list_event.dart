import 'package:equatable/equatable.dart';

abstract class CryptoListEvent extends Equatable {
  const CryptoListEvent();


  @override
  List<Object> get props => [];
}

class LoadCoins extends CryptoListEvent {

}

class RefreshCoins extends CryptoListEvent {

}