import 'package:flutter/material.dart';
import 'package:pantallas_fitlabs/pantallas/resumen_dia.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // --- PALETA DE COLORES (Consistente con las otras pantallas) ---
  final Color _accentLila = const Color(0xFFD5D0FF); // El lila claro del borde

  @override
  Widget build(BuildContext context) {
    // Usamos MediaQuery para que sea responsivo
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF3E2B68), Color(0xFF2B2042), Color(0xFF241D35)],
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height, // Asegura que ocupe toda la pantalla
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),

                  // 1. LOGO CIRCULAR
                  Image(
                    image: AssetImage('assets/images/logoFitlabs.png'),
                    width: 240,
                    height: 240,
                  ),

                  const SizedBox(height: 30),

                  // 2. TEXTO "FitLabs"
                  // Nota: La fuente de la imagen es custom. Aquí uso una estándar estilizada.
                  const Text(
                    "FitLabs",
                    style: TextStyle(
                      color: Color(0xFFD5D0FF),
                      fontSize: 56,

                      letterSpacing: 1.5,
                      fontFamily: 'RubikVinyl',
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 3. INPUT EMAIL
                  _buildMinimalInput(label: "Email"),

                  const SizedBox(height: 30),

                  // 4. INPUT CONTRASEÑA
                  _buildMinimalInput(label: "Contraseña", isPassword: true),

                  const Spacer(flex: 1),

                  // 5. BOTÓN "Iniciar Sesión"
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResumenDiaScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: _accentLila, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        foregroundColor: Colors.white, // Efecto al pulsar
                      ),
                      child: const Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 6. TEXTO REGISTRO
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/registrarse');
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        children: [
                          TextSpan(text: "¿No tienes cuenta? "),
                          TextSpan(
                            text: "Regístrate",
                            style: TextStyle(
                              color: Color(0xFFD5D0FF),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline, // Subrayado
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para los campos de texto minimalistas
  Widget _buildMinimalInput({required String label, bool isPassword = false}) {
    return Column(
      children: [
        TextFormField(
          obscureText: isPassword,
          textAlign: TextAlign.center, // Texto centrado como en la imagen
          style: const TextStyle(color: Colors.white, fontSize: 16),
          cursorColor: _accentLila,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(
              color: Color.fromARGB(153, 255, 255, 255),
            ),
            // Quitamos bordes laterales y superior, dejamos solo la línea abajo
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD5D0FF), width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 107, 96, 214),
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.only(bottom: 10),
          ),
        ),
      ],
    );
  }
}
