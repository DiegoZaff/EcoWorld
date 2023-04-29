import 'package:eco_app/components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import '../api/user.dart';

class Login extends HookWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    var username = useState("");
    var password = useState("");

    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 191, 57),
        leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(
              Ionicons.arrow_back_circle,
              color: Colors.white,
              size: 36,
            )),
        middle: const Text("Login", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Form(
              child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Username: ",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                CupertinoTextField(
                  onChanged: (value) => username.value = value.trim(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Password: ",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                CupertinoTextField(
                  obscureText: true,
                  onChanged: (value) => password.value = value.trim(),
                ),

                // "Login" button
                Button(
                    text: 'login',
                    onPressed: () {
                      // TODO login
                    }),
                // "Register" button
                Button(
                  text: 'register',
                  type: ButtonType.secondary,
                  onPressed: () {
                    if (username.value.isNotEmpty &&
                        password.value.isNotEmpty) {
                      try {
                        registerUser(username.value, password.value);
                        // ignore: empty_catches
                      } catch (e) {}
                    }
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
