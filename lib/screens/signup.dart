import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isUsernameValid = false;
  bool _isPasswordValid = false;
  bool _isEmailValid = false;
  bool _isEmailVerified = false;

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

            // Email Verification Field with Animated Opacity
            AnimatedOpacity(
              opacity: _isPasswordValid ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isPasswordValid
                  ? TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText:
                            _isEmailValid || _emailController.text.isEmpty
                                ? null
                                : 'Please enter a valid email',
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Here, you can use your own validation logic.
                          _isEmailValid =
                              value.isNotEmpty && value.contains('@');
                        });
                      },
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),

            // Email Verification Button with Animated Opacity
            AnimatedOpacity(
              opacity: _isEmailValid ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isEmailValid
                  ? ElevatedButton(
                      onPressed: () {
                        // Handle email verification logic here.
                        setState(() {
                          _isEmailVerified = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Email verified successfully.')),
                        );
                        // Navigate to Nickname Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NicknameScreen()),
                        );
                      },
                      child: const Text('Verify Email'),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

// NickName Screen

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  _NicknameScreenState createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final _nicknameController = TextEditingController();
  bool _isNicknameValid = false;

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
            // Nickname Input Field with Animated Opacity
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  labelText: 'Nickname',
                  errorText:
                      _isNicknameValid || _nicknameController.text.isEmpty
                          ? null
                          : 'Please enter a valid nickname',
                ),
                onChanged: (value) {
                  setState(() {
                    // Here, you can use your own validation logic.
                    _isNicknameValid = value.isNotEmpty && value.length >= 3;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

            // Signup Button with Animated Opacity
            AnimatedOpacity(
              opacity: _isNicknameValid ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isNicknameValid
                  ? ElevatedButton(
                      onPressed: () {
                        // Handle signup logic here.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signing up...')),
                        );
                      },
                      child: const Text('Sign Up'),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
