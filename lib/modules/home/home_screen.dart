import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text('First app'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
              icon: const Icon(Icons.notification_add), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Image(
                    image: NetworkImage(
                        'https://media.istockphoto.com/vectors/sunglasses-emoticon-with-big-smile-vector-id1191260149?s=612x612'),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 200,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Smile please',
                    style: TextStyle(fontSize: 30, color: Colors.amber),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
