import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/crypto_list_event.dart';
import '../bloc/crypto_list_state.dart';
import '../../../data/repository/crypto_repository.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final CryptoRepository repository;
  int _currentPage = 1;

  CryptoListBloc({required this.repository}) : super(CryptoListLoading()) {
    on<LoadCoins>(_onLoadCoins);
    on<RefreshCoins>(_onRefreshCoin);
  }

  Future<void> _onLoadCoins(
    LoadCoins event,
    Emitter<CryptoListState> emit,
  ) async {
    try {
      if (state is CryptoListLoading) {
        final coins = await repository.getCoins(page: _currentPage);
        if (coins.isEmpty) {
          emit(const CryptoListError(message: 'No more coins to load'));
        } else {
          emit(CryptoListLoaded(coins: coins));
        }
      }
    } catch (e) {
      emit(const CryptoListError(message: 'Failed to load data'));
    }
  }

  Future<void> _onRefreshCoin(
    RefreshCoins event,
    Emitter<CryptoListState> emit,
  ) async {
    try {
      _currentPage = 1;
      emit(CryptoListLoading());
      final freshCoins = await repository.getCoins(page: _currentPage);
      emit(CryptoListLoaded(coins: freshCoins));
    } catch (e, stackTrace) {
    
      emit(const CryptoListError(message: 'Failed to refresh data'));
    }
  }
}
