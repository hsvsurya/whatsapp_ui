import 'package:flutter/material.dart';

class MsgScreen extends StatefulWidget {
  static const routeName = '/msg';

  @override
  _MsgScreenState createState() => _MsgScreenState();
}

class _MsgScreenState extends State<MsgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              flex: 40,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                foregroundColor: Colors.indigo,
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Text('View Contact'),
              ),
              PopupMenuItem(
                child: Text('Media,links and docs'),
              ),
              PopupMenuItem(
                child: Text('Search'),
              ),
              PopupMenuItem(
                child: Text('Wallpaper'),
              ),
            ],
          ),
        ],
        centerTitle: true,
        title: Text('Name'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
