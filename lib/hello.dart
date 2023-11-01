import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Helloulator',
      debugShowCheckedModeBanner: false,
      home: MyHello(),
    );
  }
}

class MyHello extends StatefulWidget {
  const MyHello({super.key});

  @override
  State<MyHello> createState() => _MyHelloState();
}

class _MyHelloState extends State<MyHello> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text('WELCOME',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  )),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){},
                      child: const Text('Welcome')),
                  const SizedBox(width: 30),
                  ElevatedButton(onPressed: (){},
                      child: const Text('Clear'))
                ],
              )
            ],
          ),
        )
    );
  }
}
