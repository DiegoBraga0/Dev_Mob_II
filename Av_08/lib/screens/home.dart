import 'package:flutter/material.dart';

import '../components/lista_filmes.dart';
import '../models/filme.dart';
import '../repositories/repository.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Filme>>? futureFilmes;

  @override
  void initState() {
    futureFilmes = getFilmes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmes Studio Ghibli → Diego Braga"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureFilmes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final filmes = snapshot.data as List<Filme>;
            return ListaFilmes(filmes: filmes);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
