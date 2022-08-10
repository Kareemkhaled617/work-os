import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:work_os/screens/auth/sing_up.dart';

import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  late final TextEditingController _emailTextController =
  TextEditingController(text: '');
  late final TextEditingController _passTextController =
  TextEditingController(text: '');
  bool _obscureText = true;
  final FocusNode _passFocusNode = FocusNode();
  final _loginFormKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  void submitFormOnLogin() async {
    final isValid = _loginFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    // if (isValid) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   try {
    //     await _auth.signInWithEmailAndPassword(
    //         email: _emailTextController.text.toLowerCase().trim(),
    //         password: _passTextController.text.trim());
    //     Navigator.canPop(context) ? Navigator.pop(context) : null;
    //   } catch (error) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     GlobalMethods.showErrorDialog(
    //         error: error.toString(), context: context);
    //   }
    // } else {
    //   print('Form not valid');
    // }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://media.istockphoto.com/photos/businesswoman-using-computer-in-dark-office-picture-id557608443?k=6&m=557608443&s=612x612&w=0&h=fWWESl6nk7T6ufo4sRjRBSeSiaiVYAzVrY-CLlfMptM=",
            placeholder: (context, url) => Image.asset(
              'assests/images/wallpaper.jpg',
              fit: BoxFit.fill,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(animation.value, 0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 9,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: '   '),
                      TextSpan(
                        text: 'Register',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen())),
                        style: TextStyle(
                            color: Colors.blue.shade300,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(_passFocusNode),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid Email adress';
                          }
                          return null;
                        },
                        controller: _emailTextController,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink.shade700),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //Password TextField

                      TextFormField(
                        onEditingComplete: submitFormOnLogin,
                        focusNode: _passFocusNode,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        controller: _passTextController,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink.shade700),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                      },
                      child: const Text(
                        'Forget password?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: submitFormOnLogin,
                  color: Colors.pink.shade700,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide.none),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.login,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
