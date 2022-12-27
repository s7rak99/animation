import 'package:flutter/material.dart';

class ExampleLoginAnimation extends StatefulWidget {
  const ExampleLoginAnimation({Key? key}) : super(key: key);

  @override
  State<ExampleLoginAnimation> createState() => _ExampleLoginAnimationState();
}

class _ExampleLoginAnimationState extends State<ExampleLoginAnimation>
    with SingleTickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();

   Curve curves = Curves.easeIn;
  String sign = 'signIn';
  String signText = 'Sign Up Now!';
  bool choice = false;

  late AnimationController _controller;

  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 8,
          child: AnimatedContainer(
            curve: choice? Curves.bounceOut : Curves.easeIn,
            height: sign == 'signIn' ? 260 : 320,
            padding: const EdgeInsets.all(16),
            duration: const Duration(milliseconds: 500),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'email',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          )),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'password',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    if(sign == 'signUp')
                    FadeTransition(
                      opacity: _animation!,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'phone Number',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 100,
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: const Text('login'),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            choice = !choice;
                            if (choice) {
                              sign = 'signUp';
                              signText = 'Sign In now!';
                            } else {
                              sign = 'signIn';
                              signText = 'Sign Up now!';
                            }
                          });
                        },
                        child: Text(signText))
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
