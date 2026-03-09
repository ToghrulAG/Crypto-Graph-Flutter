import 'package:crypto_graph/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_graph/features/crypto_list/presentation/crypto_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/crypto_list_state.dart';
import 'crypto_list_header.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Crypto Monitor'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        builder: (context, state) {
          if (state is CryptoListLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CryptoListError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (state is CryptoListLoaded) {
            return Column(
              children: [
                const CryptoListHeader(),
                Expanded(child: ListView.builder(
                  itemCount: state.coins.length,
                  itemBuilder: (context, index)  {
                    final coin = state.coins[index];
                    return CryptoListItem(coins: coin);
                  },
                ))
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
