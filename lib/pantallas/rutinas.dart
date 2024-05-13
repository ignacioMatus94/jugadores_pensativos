import 'package:flutter/material.dart';
import 'home.dart'; 

class Rutina extends StatelessWidget {
  final String? nombreJuego;

  const Rutina({Key? key, this.nombreJuego}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estrategias de juegos'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        actions: [

          IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.verified_user)
          )

        ],
      ),
      body: Center(
        child: Card(
          elevation: 3,
          color: Colors.lightBlue, // Color asignado al Card
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            
            child: ElevatedButton(
              onPressed: () {
                _mostrarEstrategia(context);
              },
              child: Text(nombreJuego ?? 'Seleccionar juego'),
            ),
          ),
        ),
      ),
      // Agregamos el FloatingActionButton en la esquina inferior derecha
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()), 
          );
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Volver al Home',
      ),
      // Ajustamos la posición del FloatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _mostrarEstrategia(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Estrategias para Pac-Man'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              
              Text(
                'Estrategia 1 (Campear): Quedarse cerca de los poderes para comer a los fantasmas y luego comer las bolitas.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Estrategia 2 (Arriesgarse): Perseguir las bolitas lo más rápido posible independientemente de si los fantasmas te eliminan.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Estrategia 3 (Balanceado): Aplicar tanto el campeo obteniendo el poder y eliminando fantasmas, además de arriesgarse en los momentos oportunos.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: <Widget>[

            IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
                Navigator.of(context).pop();
            },
          ),

          ],
        );
      },
    );
  }
}
