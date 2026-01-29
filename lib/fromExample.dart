import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),

      home: LargeFormPage(),
    );
  }
}

class LargeFormPage extends StatefulWidget {
  const LargeFormPage({super.key});

  @override
  State<LargeFormPage> createState() => _LargeFormPageState();
}

class _LargeFormPageState extends State<LargeFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  String? _name;
  String? _email;
  String? _password;
  String? _gender;
  bool _subscribe = false;
  String? _country;
  bool _switchValue = false;
  DateTime? _dob;

  List<String> countries = ['Bangladesh', 'India', 'USA', 'UK'];

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2026),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dob = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      debugPrint("----- FORM DATA -----");
      debugPrint("Name: $_name");
      debugPrint("Email: $_email");
      debugPrint("Password: $_password");
      debugPrint("Gender: $_gender");
      debugPrint("Subscribed: $_subscribe");
      debugPrint("Country: $_country");
      debugPrint("Switch Value: $_switchValue");
      debugPrint(
        "Date of Birth: ${_dob != null ? _dob!.toIso8601String() : 'Not selected'}",
      );
      debugPrint("---------------------");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Example')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.account_circle_outlined),
                  hintText: 'Enter your name',

                  // Default border
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),

                  // Border when focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),

                  // Border when error
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),

                  // Border when focused + error
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'please enter your name'
                    : null,
                onSaved: (value) => _name = value,
              ),
              SizedBox(height: 8),

              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Enter your name',

                  // Default border
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),

                  // Border when focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),

                  // Border when error
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty
                    ? 'please enter your email'
                    : null,
                onSaved: (value) => _email = value,
              ),
              SizedBox(height: 8),

              // Password Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline),

                  // Show / Hide password
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2),
                  ),
                ),

                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a password';
                  }
                  if (value.length < 6) {
                    return 'password must be at least 6 characters';
                  }
                  return null;
                },

                onSaved: (value) => _password = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
