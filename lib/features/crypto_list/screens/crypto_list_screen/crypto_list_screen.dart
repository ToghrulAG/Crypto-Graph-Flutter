import 'package:crypto_graph/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_graph/features/crypto_list/screens/crypto_list_screen/crypto_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/crypto_list_state.dart';
import 'crypto_list_header.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

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
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    const CryptoListHeader(),
                    Expanded(
                      child: screenWidth > 500
                          ? _buildGridView(state.coins, screenWidth)
                          : _buildListView(state.coins),
                    ),
                  ],

                  ///
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildListView(List coins) {
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return CryptoListItem(coins: coin);
      },
    );
  }

  Widget _buildGridView(List coins, double screenWidth) {
    int crossAxisCount = screenWidth > 900 ? 3 : 2;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      itemBuilder: (context, index) {
        final coin = coins[index];
        return CryptoListItem(coins: coin);

      },
      itemCount: coins.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        childAspectRatio: 4,
      ),
    );
  }
}
