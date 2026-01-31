import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      title: "Demo Form",
      home: DemoFormEx(),
    );
  }
}

class DemoFormEx extends StatefulWidget {
  const DemoFormEx({super.key});

  @override
  State<DemoFormEx> createState() => _DemoFormExState();
}

class _DemoFormExState extends State<DemoFormEx> {
  final _fromKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  String? _name;
  String? _email;
  String? _password;
  String? _age;
  String? _gender;
  String? _country;
  DateTime? _dob;
  bool _switchValue = false;
  List<String> countries = ['Bangladesh', 'India', 'USA', 'UK'];

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2026),
    );

    if (picked != null) {
      setState(() {
        _dob = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(backgroundColor: Colors.amber),
                ),
              ),

              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'please enter your name'
                    : null,
                onSaved: (value) => _name = value,
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.mail),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'please enter your email'
                    : null,
                onSaved: (value) => _email = value,
              ),

              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Age",
                  hintText: 'Enter your Age',
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'please enter your age'
                    : null,
                onSaved: (value) => _age = value,
              ),

              SizedBox(height: 16),
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
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber, width: 2),
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

              SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),

                  RadioGroup(
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    child: Row(
                      children: const [
                        Radio(value: "Male"),
                        Text("Male"),
                        SizedBox(width: 16),
                        Radio(value: "Female"),
                        Text("Female"),
                        SizedBox(width: 16),
                        Radio(value: "Others"),
                        Text("Others"),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Country",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      prefixIcon: Icon(Icons.map),
                    ),
                    items: countries
                        .map(
                          (coutry) => DropdownMenuItem(
                            value: coutry,
                            child: Text(coutry),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _country = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
