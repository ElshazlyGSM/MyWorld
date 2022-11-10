import 'package:flutter/material.dart';

import '../models/user/user_model.dart';


// ignore: must_be_immutable
class UsersScreen extends StatelessWidget {
   const UsersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    List<UserModel> users = [
      UserModel(id: 1,name: 'Ahmed elshazly',phone: '01008686891'),
      UserModel(id: 2,name: 'Asmaa mahmoud',phone: '01008566891'),
      UserModel(id: 3,name: 'Mahmoud ahmed',phone: '01005245891'),
      UserModel(id: 1,name: 'Ahmed elshazly',phone: '01008686891'),
      UserModel(id: 2,name: 'Asmaa mahmoud',phone: '01008566891'),
      UserModel(id: 3,name: 'Mahmoud ahmed',phone: '01005245891'),
      UserModel(id: 1,name: 'Ahmed elshazly',phone: '01008686891'),
      UserModel(id: 2,name: 'Asmaa mahmoud',phone: '01008566891'),
      UserModel(id: 3,name: 'Mahmoud ahmed',phone: '01005245891'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.2)),
              ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
             CircleAvatar(
              radius: 25,
              child: Text(
                '${user.id}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    user.phone,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
