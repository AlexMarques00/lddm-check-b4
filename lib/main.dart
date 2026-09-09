import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyApp(futuro: carregarHabitos()),
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
          title: Text("menor: " + menorAlbum(albuns).toString() + " faixas"),
          tileColor: Colors.blue,
        ),
      ],
    )

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

/*
1. Barra superior com o título Álbuns e um ícone de ação à
direita.

2. Abaixo da lista, uma faixa de resumo com o menor número
de faixas entre os álbuns, no formato menor: 9 faixas.

3. Lista rolável com três itens.

4. Cada item tem um ícone à esquerda, um título e uma linha
secundária no formato Artista · N faixas.

5. Os dados dos três itens ficam em uma estrutura de dados
separada da descrição da interface. O valor da faixa de
resumo deve ser calculado a partir dessa estrutura. Não
escreva o número à mão.

6. Sem interação: tocar em um item ou no ícone da barra não
faz nada. 
*/