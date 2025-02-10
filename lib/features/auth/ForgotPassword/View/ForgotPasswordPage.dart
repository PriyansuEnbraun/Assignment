import 'package:flutter/material.dart';

class Forgotpasswordpage extends StatefulWidget {
  const Forgotpasswordpage({super.key});

  @override
  State<Forgotpasswordpage> createState() => _Forgotpasswordpage();
}

class _Forgotpasswordpage extends State<Forgotpasswordpage> {
  final TextEditingController emailTextController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 400;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: isSmallScreen ? 50 : 100),
                      Image.asset(
                        'core/Assets/images/ers.png',
                        height: 70,
                        width: 170,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 35),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 22 : 25,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 50 : 100),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: emailFocusNode,
                          cursorColor: Colors.blue,
                          controller: emailTextController,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 18,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email Id",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: isSmallScreen ? 24 : 28,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: isSmallScreen ? 16 : 18,
                              fontFamily: 'Poppins',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 40 : 75),
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
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 16 : 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Copyright footer (always stays at bottom)
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enbraun Technologies Private Limited',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 12,
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.copyright_outlined,
                      color: Colors.grey,
                      size: isSmallScreen ? 12 : 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '2025',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: isSmallScreen ? 10 : 12,
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
    );
  }
}