import 'package:flutter/material.dart';

main(List<String> args) => runApp(MyApp());

// meu App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Visualizador de imagens",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(),
    );
  }
}

// Tela
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> imagens = [
    "assets/imagem 1.jpg",
    "assets/imagem 2.jpg",
    "assets/imagem 3.jpg",
    "assets/imagem 4.jpg",
    "assets/imagem 5.jpg"
  ];

  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Visualizador de imagens",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Imagem
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: AspectRatio(
              // Tamanho da imagem
              aspectRatio: 16 / 9,
              // imagem
              child: Image.asset(
                imagens[imageIndex],
                // preenche na tamanho
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Botoes
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Anterior
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (imageIndex > 0) {
                          imageIndex -= 1;
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Anterior",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Proxima
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (imageIndex < (imagens.length - 1)) {
                          imageIndex += 1;
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Próxima",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Informativo
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Quantidade de imagens:",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      imagens.length.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Imagem Atual:",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      (imageIndex + 1).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
