import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  final List<Album> albuns = [
    Album("Clube da Esquina", "Milton Nascimento", 21),
    Album("Acabou Chorare", "Novos Baianos", 9),
    Album("Tropicália", "Vários", 12)
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Álbuns'),
          Icon(Icons.search)
        ],
      )
    ),
    body: ListView(
      children: [
        for (final a in albuns)
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text(a.titulo),
            subtitle: Row(
              children: [
                Text(a.artista),
                Text(" · "),
                Text(a.faixas.toString())
              ],
            ),
          ),
        ListTile(
          title: Text("menor: ${menorAlbum(albuns)} faixas"),
          tileColor: Colors.blue,
        ),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Início"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favoritos"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Perfil"
        )
      ],
    ),

  );
}

class Album{
  final String titulo;
  final String artista;
  final int faixas;

  const Album(this.titulo, this.artista, this.faixas);
}

String menorAlbum(List<Album> albuns){
  int menor = albuns[0].faixas;
    for(final a in albuns){
      if(a.faixas < menor){
        menor = a.faixas;
      }
    }
  return menor.toString();
}
