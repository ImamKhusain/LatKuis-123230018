import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/movie_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  bool isLoggedIn = false;

  void _login(){
    if (userC.text == 'ImamKhusain' && passC.text == '018'){
      setState(() {
        isLoggedIn = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MovieListPage(username: userC.text),
        ),
      );
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isLoggedIn ? 'Login berhasil' : 'gagal'),
      backgroundColor: isLoggedIn ? Colors.greenAccent : Colors.redAccent, 
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('L O G I N'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(!isLoggedIn ? 'Selamat Datang' : 'Imam Khusain',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            _usernameField(),
            SizedBox(height: 20,),
            _passwordField(),
            //button login
            SizedBox(height: 20,),
            ElevatedButton(
            onPressed: _login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 45)
            ),
            child: Text('Login'))
          ],
        ),
      )
    );
  }

//custom widget 
Widget _usernameField() {
  return TextField(
    controller: userC,
    decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'username.....',
  )
  );
}

Widget _passwordField() {
  return TextField(
    controller: passC,
    obscureText: true,
    decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'password.....',
  )
  );
}  
}