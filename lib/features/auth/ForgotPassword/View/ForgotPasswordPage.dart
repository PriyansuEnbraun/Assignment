import 'package:flutter/material.dart';

class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({super.key});

  @override
  State<Forgotpasswordpage> createState() => _Forgotpasswordpage();
}

class _Forgotpasswordpage extends State<Forgotpasswordpage> {
  final TextEditingController loginIDController = TextEditingController();
  final FocusNode loginIDFocusNode = FocusNode();
  String? loginIdError;

  @override
  void dispose() {
    loginIDController.dispose();
    loginIDFocusNode.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      loginIdError = _validateLoginId(loginIDController.text);
      if (loginIdError != null) return;
    });
  }

  String? _validateLoginId(String value) {
    if (value.isEmpty) {
      return 'Login ID cannot be empty';
    }
    else if (value.length < 8 || value.length > 50) {
      return 'Login ID must be between 8 and 50 characters';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    // Fetch screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine if it's a small or large screen
    final isSmallPhoneScreen = screenWidth < 400 && screenHeight < 750;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isSmallScreen = constraints.maxWidth < 400;

                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Image.asset(
                              'core/Assets/images/ers.png',
                              height: 60,
                              width: 150,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 25),
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontSize: isSmallPhoneScreen ? 15 : 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                focusNode: loginIDFocusNode,
                                cursorColor: Colors.blue,
                                controller: loginIDController,
                                style: TextStyle(
                                  fontSize: isSmallPhoneScreen ? 15 : 20,
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: isSmallPhoneScreen ? 8 : 10,
                                    fontFamily: 'Poppins',
                                  ),
                                  errorText: loginIdError,
                                  border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                                  ),
                                  hintText: "Login ID",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Image.asset(
                                        'core/Assets/images/profile.png',
                                        width: 10,
                                        height: 10,
                                        color: Colors.black),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: isSmallPhoneScreen ? 16 : 18,
                                    fontFamily: 'Poppins',
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onChanged: (value) => setState(() =>
                                loginIdError = _validateLoginId(value)),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              margin: EdgeInsets.only(left: 25, right: 25),
                              child: Row(
                                children: [
                                  Text(
                                    'Note : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontSize: isSmallPhoneScreen ? 10 : 12,
                                        fontFamily: 'Poppins'),
                                  ),
                                  Text(
                                    'Login ID might not be same as email address',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: isSmallPhoneScreen ? 10 : 12,
                                        fontFamily: 'Poppins'),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 100),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  shadowColor: Colors.lightBlueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.blue,
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                onPressed: () {
                                  _validateFields();
                                },
                                child: Text(
                                  "Get OTP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isSmallPhoneScreen ? 16 : 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: isSmallPhoneScreen ? 16 : 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Enbraun Technologies Private Limited',
                                    style: TextStyle(
                                      fontSize: isSmallPhoneScreen ? 10 : 12,
                                      fontFamily: 'Poppins',
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.copyright_outlined,
                                    color: Colors.grey,
                                    size: isSmallPhoneScreen ? 12 : 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '2025',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: isSmallPhoneScreen ? 10 : 12,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
