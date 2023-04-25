import 'package:firebase_works/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:firebase_auth/firebase_auth.dart';

class datasaveFirbase extends StatefulWidget {
  const datasaveFirbase({super.key});

  @override
  State<datasaveFirbase> createState() => _datasaveFirbaseState();
}

class _datasaveFirbaseState extends State<datasaveFirbase> {
  @override
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  Widget build(BuildContext build) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: TextField(
// inputDecoration
            decoration: InputDecoration(
                hintText: "arygalaxy@gamil.com",
                filled: true,
                fillColor: Colors.black12,
                suffixIcon: Icon(Icons.mail),
                iconColor: Colors.black,
// TextPart
                label: Text(
                  'email',
// TextStyle
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
//border and outlineInputBorder
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.pink),
                )),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: TextField(
// inputDecoration
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "ary22gupta1",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.black12,
                  suffixIcon: Icon(Icons.password_outlined),
                  iconColor: Colors.black,
// TextPart
                  label: Text(
                    'Password',
// TextStyle
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
//border and outlineInputBorder
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.pink),
                  )),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ElevatedButton(
                child: Text('Sign In'),
                onPressed: () async{
                  try {
                    final newuser = await auth. createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newuser != null) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> homeScreen()));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
              child: ElevatedButton(
            child: Text("Login In"),
            onPressed: () {},
          ))
        ]),
      ]),
    );
  }
}
