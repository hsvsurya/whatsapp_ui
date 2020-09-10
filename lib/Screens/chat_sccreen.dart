import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Screens/msg_screen.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context, ind) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(MsgScreen.routeName);
                },
                child: ListTile(
                  title: Text('Name'),
                  subtitle: Text('message'),
                  leading: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (ctx, _, __) {
                            return Center(
                              child: Container(
                                height: 400,
                                width: 400,
                                color: Colors.indigo,
                                child: Hero(
                                  child: Icon(
                                    Icons.person,
                                    size: 80,
                                  ),
                                  tag: ind,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: ind,
                      child: Material(
                        // color: Colors.indigo,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[700],
                          child: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  trailing: Text(
                    'online',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }
}
