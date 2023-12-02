import 'package:flutter/material.dart';
import 'Bienvenida.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiformulario',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController txtLogin = TextEditingController();
  final TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiformulario'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Image.asset(
                'img/usuario.png',
                width: 100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Login",
              ),
              controller: txtLogin,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Contraseña",
              ),
              controller: txtPass,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text("Validar Usuario"),
              onPressed: () {
                // Validar las credenciales aquí
                String username = txtLogin.text;
                String password = txtPass.text;

                // Ejemplo de credenciales válidas (puedes cambiarlas según tus necesidades)
                String validUsername = "moises";
                String validPassword = "moises999";

                if (username == validUsername && password == validPassword) {
                  // Credenciales válidas, navegar a la pantalla de bienvenida con usuario válido
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Bienvenida(usuarioValido: true, username: username),
                    ),
                  );
                } else {
                  // Credenciales no válidas, mostrar un mensaje de error
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error de autenticación'),
                        content: Text('Usuario o contraseña incorrectos.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(
          255, 206, 105, 105), // Cambia el color de fondo del Scaffold
    );
  }
}
