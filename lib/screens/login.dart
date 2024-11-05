import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isUsernameValid = false;
  bool _isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.01,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username Input Field with Animated Opacity
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText:
                      _isUsernameValid || _usernameController.text.isEmpty
                          ? null
                          : 'Please enter a valid username',
                ),
                onChanged: (value) {
                  setState(() {
                    // Here, you can use your own validation logic.
                    _isUsernameValid = value.isNotEmpty && value.length >= 3;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            // Password Input Field with Animated Opacity
            AnimatedOpacity(
              opacity: _isUsernameValid ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isUsernameValid
                  ? TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText:
                            _isPasswordValid || _passwordController.text.isEmpty
                                ? null
                                : 'Please enter a valid password',
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          // Here, you can use your own validation logic.
                          _isPasswordValid =
                              value.isNotEmpty && value.length >= 6;
                        });
                      },
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),

            // Login Button with Animated Opacity
            AnimatedOpacity(
              opacity: _isPasswordValid ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isPasswordValid
                  ? ElevatedButton(
                      onPressed: () {
                        // Handle login logic here.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logging in...')),
                        );
                      },
                      child: const Text('Login'),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
