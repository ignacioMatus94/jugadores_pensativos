import 'package:flutter/material.dart';
import 'package:jugadores_pensativos/pantallas/home.dart';

class Usuario extends StatefulWidget {
  const Usuario({Key? key}) : super(key: key);

  @override
  _UsuarioState createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  late TextEditingController _usuario;
  late TextEditingController _clave;

  @override
  void initState() {
    super.initState();
    _usuario = TextEditingController();
    _clave = TextEditingController();
  }

  @override
  void dispose() {
    _usuario.dispose();
    _clave.dispose();
    super.dispose();
  }

  void _submit() {
    
    // Variables del usuario
    final username = _usuario.text;
    final password = _clave.text;
    
    //imprimir los datos en la consola
    print('Username: $username, Password: $password');
    
     // Navegar a la pantalla Home
    Navigator.pushReplacement(
    context,
    //navega a la clase Home
    MaterialPageRoute(builder: (context) => const Home()),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      //Aqui empieza el appbar de Usuario
      appBar: AppBar(
        
        //Agregando propiedades al Appbar
        title: const Text('Ingreso de Usuario'),
        automaticallyImplyLeading: false,
        
        //icono rostro
        actions: [
          IconButton(
            onPressed: (){}
          , icon: const Icon(Icons.face))
        ],

        //Fin de agregacion de propiedades
      ),


      body: Padding(

        padding: const EdgeInsets.all(20.0),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            TextField(
              
              controller: _usuario,

              decoration: const InputDecoration(

                labelText: 'Nombre de Usuario',
                prefixIcon: Icon(Icons.person),

              ),

              onSubmitted: (_) => _submit(),

            ),

            const SizedBox(height: 20),

            TextField(
              
              controller: _clave,
              decoration: const InputDecoration(
                
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),

              ),

              obscureText: true,
              onSubmitted: (_) => _submit(),

            ),

            const SizedBox(height: 20),

            ElevatedButton(
              
              //agrego el metodo _submit
              onPressed: _submit,
              child: const Row(
                
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text('Ingresar'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
