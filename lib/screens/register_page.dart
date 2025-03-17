import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers for text fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Dropdown values
  String? selectedRole = 'Student';
  String? selectedDepartment = 'Computer Science';

  bool termsAccepted = false; // Checkbox value

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    TextFormField(
                      controller: fullNameController,
                      decoration: const InputDecoration(labelText: 'Full Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Email Address
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email Address'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Phone Number (Mandatory)
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Student ID
                    TextFormField(
                      controller: studentIdController,
                      decoration: const InputDecoration(labelText: 'Student ID'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your student ID';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Confirm Password
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Confirm Password'),
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Select Role (Dropdown)
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      decoration: const InputDecoration(labelText: 'Select Role'),
                      items: ['Student', 'Faculty'].map((String role) {
                        return DropdownMenuItem<String>(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRole = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),

                    // Select Department (Dropdown/Text)
                    DropdownButtonFormField<String>(
                      value: selectedDepartment,
                      decoration: const InputDecoration(labelText: 'Department'),
                      items: ['Computer Science','Software','Architecture','EEE','Civil', 'BBA', 'NFE','Pharmacy','Agriculture','Public Health']
                          .map((String dept) {
                        return DropdownMenuItem<String>(
                          value: dept,
                          child: Text(dept),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDepartment = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),

                    // Terms & Conditions Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: termsAccepted,
                          onChanged: (value) {
                            setState(() {
                              termsAccepted = value!;
                            });
                          },
                        ),
                        const Text('I agree to the Terms & Conditions'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (termsAccepted) {
                              // You can submit the form here
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Registration Successful')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please agree to the Terms & Conditions')),
                              );
                            }
                          }
                        },
                        child: const Text('Register'),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Login Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Navigate back to Login page
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
