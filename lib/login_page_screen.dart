import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:grocery_app/product_page.dart";

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  bool isobscureText = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Check if the username is 'deep' and the password is '123'
      if (_email == 'deep' && _password == '123') {
        // Navigate to ProductPage if login is successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 55, 56),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Shop Smart, Save Big On Groceries !",
                style: GoogleFonts.dmSans(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      width: 1.7, color: Colors.grey)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.7, color: Colors.grey
                                  )
                              ),
                              hintText: "Email or Username",
                              hintStyle:
                                  GoogleFonts.dmSans(color: Colors.grey)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter username";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isobscureText = !isobscureText;
                                  });
                                },
                                child: Icon(
                                  isobscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: GoogleFonts.dmSans(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      width: 1.7, color: Colors.grey)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.7, color: Colors.grey
                                  )
                              )
                              ),
                          obscureText: isobscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _login();
                        },
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 3, 55, 56),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle Forgot Password action
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
