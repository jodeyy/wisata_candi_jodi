import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
   SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  void _signIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText =
            'pengguna belum terdaftar. silahkan daftar terlebih dahulu.';
      });

      if (enteredUsername == savedUsername && enteredPassword == savedPassword){
        setState(() {
          _errorText = '';
          _isSignedIn = true;
          prefs.setBool('isSignedIn', true);

        });
        // Pemanggilan untuk menghapus semua halaman dalam tumpukan navigasi
        WidgetsBinding.instance.addPostFrameCallback(_){
          Navigator.of(context).popUntil((route) => route.isFirst);
        });
        // Sign in berhasil, navigasikan ke layar utama
        WidgetsBinding.instance.addPostFrameCallback(_){
          Navigator.pushReplacementNamed(context, '/');
        });
      } else {
        setState(() {
          _errorText = 'Nama pengguna atau kata sandi salah.';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: 2 Pasang appbar
      appBar: AppBar(title: Text('Sign In'),),
        // TODO : 3. Pasang body
      body: Center(
        child : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              child: Column(
                // TODO : 4
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                // TODO : 5. Pasang TextFormField Nama Pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                    labelText: "Nama Pengguna" ,
                    border: OutlineInputBorder(),
                    ),
                  ),

              // TODO : 6. Pasang TextFormField Kata Sandi
             SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Kata Sandi",
                  errorText: _errorText.isNotEmpty ? _errorText : null,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    icon: Icon(
                        _obscurePassword ? Icons.visibility_off
                    : Icons.visibility,
                    ),),
                ),
                obscureText: _obscurePassword,
              ),
              // TODO : 7. Pasang ElevatedButton Sign In
              SizedBox(height: 28),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('Sign In')),
              // TODO 8. Pasang TextButton Sign Up
              SizedBox(height: 10),
              // ...

              RichText(
                  text: TextSpan(
                    text: 'Belum punya akun? ',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Daftar di sini.',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16
                        ),
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          Navigator.pushNamed(context, '/signup');
                          },
                      )
                    ],
                  ),)
              // TextButton(
              //     onPressed: (){},
              //     child: Text('Belum punya akun? Daftar di sini.')),
            ],
          ),
        ),
      ),
    ),
      ),
    );
  }
}
