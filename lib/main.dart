import 'package:flutter/material.dart';
import 'package:jugadores_pensativos/pantallas/usuario.dart';

void main() {
  runApp(const SplashImage());
}

class SplashImage extends StatelessWidget {
  const SplashImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      //Aqui inicia el Splash()
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _splashInicio();
  }

  void _splashInicio() async {
    
    //la duracion del splash
    await Future.delayed(const Duration(seconds: 3));

    //Navega a la clase usuario
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Usuario()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      //El icono del splash
      body: Center(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}



