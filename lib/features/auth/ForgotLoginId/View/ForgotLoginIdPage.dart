import 'package:flutter/material.dart';

class Forgotloginidpage extends StatefulWidget {
  const Forgotloginidpage({super.key});

  @override
  State<Forgotloginidpage> createState() => _ForgotloginidpageState();
}

class _ForgotloginidpageState extends State<Forgotloginidpage> {
  final TextEditingController emailTextController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        // Auto-scroll to show the email field when focused
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            200, // Adjust this value based on your layout needs
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 400;

            return SingleChildScrollView(
              controller: scrollController,
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
                        const SizedBox(height: 50),
                        Image.asset(
                          'core/Assets/images/ers.png',
                          height: 70,
                          width: 170,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 35),
                        Text(
                          "Forgot Login ID",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 22 : 25,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 50),
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
                        const SizedBox(height: 40),
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
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
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
              ),
            );
          },
        ),
      ),
    );
  }
}