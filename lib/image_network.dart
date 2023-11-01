import 'package:flutter/material.dart';

void main() {
  runApp(const ImageNetwork());
}

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ImageNetworkulator',
      debugShowCheckedModeBanner: false,
      home: MyImageNetwork(),
    );
  }
}

class MyImageNetwork extends StatefulWidget {
  const MyImageNetwork({super.key});

  @override
  State<MyImageNetwork> createState() => _MyImageNetworkState();
}

class _MyImageNetworkState extends State<MyImageNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://modulabs.co.kr/wp-content/uploads/2023/06/flutter-logo-sharing.png'),

            ],
          ),
        )
    );
  }
}
