import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
                ),
                radius: 23),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
            ),
          ],
        ),
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_calendar,
              color: Colors.black,
            ),
            iconSize: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                width: double.infinity,
                height: 30,
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                    ),
                    Text(
                      'search',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStory(),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15,
                        ),
                    itemCount: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => buildItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStory() => Container(
        width: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
                    ),
                    radius: 30),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            const Text('Ahmed Elshazly   dfssdfsd sdfsd f',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
          ],
        ),
      );

  Widget buildItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
                  ),
                  radius: 30),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ahmed Elshazly',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'How are you?',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: CircleAvatar(
                          radius: 1,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                      Text(
                        '03:45 pm',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
