import 'package:chapter_1/utilits/routes.dart';
import 'package:flutter/material.dart';

class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Image.asset(
                'images/login.png',
                height: 200,
                fit: BoxFit.fill,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Name', hintText: 'Enter your Name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password', hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoute.homepage);
                },
                child: Container(
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  child: Text('Log In'),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
