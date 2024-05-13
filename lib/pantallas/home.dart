import 'package:flutter/material.dart';
import 'package:jugadores_pensativos/pantallas/usuario.dart';
import 'rutinas.dart';
import 'detalle.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //Aqui empieza el Appbar
      appBar: AppBar(

        //Agregando propiedades al Appbar
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        

        //icono Home
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
        ],
        //Fin de agregacion de propiedades
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(200),
          color: Colors.lightBlue, // Color asignado al Card
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Rutina()),
                    );
                  },
                  child: const Text('Rutina'),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Detalle()),
                    );
                  },
                  child: const Text('Detalle'),
                ),
               
               const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Usuario()),
                    );
                  },
                  child: const Text('Usuario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
