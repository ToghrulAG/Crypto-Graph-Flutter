import 'package:crypto_graph/features/crypto_list/presentation/crypto_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/network/api_client.dart';
import 'data/repository/crypto_repository.dart';
import 'features/crypto_list/bloc/crypto_list_bloc.dart';
import 'features/crypto_list/bloc/crypto_list_event.dart';

void main() {

  final apiClient = ApiClient();
  final cryptoRepository = CryptoRepository(apiClient: apiClient);

  runApp(MyApp(repository: cryptoRepository));
}

class MyApp extends StatelessWidget {
  final CryptoRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Monitor',
      theme: ThemeData.dark(), 
      

      home: BlocProvider(
   
        create: (context) => CryptoListBloc(repository: repository)..add(LoadCoins()),
        
      
        child: const Scaffold(
          body: Center(
            child: CryptoListScreen()),
          ),
        ),
    );
  }
}