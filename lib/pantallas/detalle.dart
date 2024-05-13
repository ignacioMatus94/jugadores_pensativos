import 'package:flutter/material.dart';
import 'package:jugadores_pensativos/pantallas/home.dart';


class Detalle extends StatefulWidget {
  const Detalle({Key? key}) : super(key: key);

  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  List<Map<String, String>> perfiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Acción al hacer clic en el icono del AppBar
            },
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          color: Colors.lightBlue, // Color asignado al Card
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _mostrarAgregarPerfilDialog(context);
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text('Agregar perfil de usuario'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    _verPerfilDialog(context);
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Ver perfiles de usuario'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    _mostrarDetallesUsuarioDialog(context);
                  },
                  icon: const Icon(Icons.details),
                  label: const Text('Detalles de los Usuarios'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    _mostrarAgregarVideojuegoDialog(context);
                  },
                  icon: const Icon(Icons.videogame_asset),
                  label: const Text('Agregar detalles del videojuego'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.blueAccent,
        tooltip: "Volver al Home",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _mostrarAgregarPerfilDialog(BuildContext context) {
    String nombre = '';
    String correo = '';
    String hobbies = '';
    String juegosFavoritos = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar perfil de usuario'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onChanged: (value) {
                  nombre = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Correo electrónico'),
                onChanged: (value) {
                  correo = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Hobbies'),
                onChanged: (value) {
                  hobbies = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Juegos Favoritos'),
                onChanged: (value) {
                  juegosFavoritos = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.cancel),
              label: const Text('Cancelar'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  perfiles.add({
                    'nombre': nombre,
                    'correo': correo,
                    'hobbies': hobbies,
                    'juegosFavoritos': juegosFavoritos,
                  });
                });
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save),
              label: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _verPerfilDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Perfiles de usuario'),
          content: SizedBox(
            width: double.maxFinite,
            height: 200,
            child: ListView.builder(
              itemCount: perfiles.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(perfiles[index]['nombre'] ?? ''),
                  subtitle: Text(perfiles[index]['correo'] ?? ''),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
              label: const Text('Cerrar'),
            ),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  perfiles.clear();
                });
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.refresh),
              label: const Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDetallesUsuarioDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalles de los Usuarios'),
          content: SizedBox(
            width: double.maxFinite,
            height: 200,
            child: ListView.builder(
              itemCount: perfiles.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text('Nombre: ${perfiles[index]['nombre'] ?? ''}'),
                    ),
                    ListTile(
                      title: Text('Correo: ${perfiles[index]['correo'] ?? ''}'),
                    ),
                    ListTile(
                      title: Text('Hobbies: ${perfiles[index]['hobbies'] ?? ''}'),
                    ),
                    ListTile(
                      title: Text('Juegos Favoritos: ${perfiles[index]['juegosFavoritos'] ?? ''}'),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
              label: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarAgregarVideojuegoDialog(BuildContext context) {
    String titulo = '';
    String descripcion = '';
    String clasificacionEdad = '';
    String genero = '';
    String fechaLanzamiento = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar detalles del videojuego'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Título del videojuego'),
                onChanged: (value) {
                  titulo = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Descripción'),
                onChanged: (value) {
                  descripcion = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Clasificación por edad'),
                onChanged: (value) {
                  clasificacionEdad = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Género'),
                onChanged: (value) {
                  genero = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Fecha de lanzamiento'),
                onChanged: (value) {
                  fechaLanzamiento = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.cancel),
              label: const Text('Cancelar'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Detalles del Videojuego'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text('Título del videojuego: $titulo'),
                          ),
                          ListTile(
                            title: Text('Descripción: $descripcion'),
                          ),
                          ListTile(
                            title: Text('Clasificación por edad: $clasificacionEdad'),
                          ),
                          ListTile(
                            title: Text('Género: $genero'),
                          ),
                          ListTile(
                            title: Text('Fecha de lanzamiento: $fechaLanzamiento'),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.save),
              label: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}

