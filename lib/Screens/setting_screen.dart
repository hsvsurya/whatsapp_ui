import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';
  final List<Map> settings = [
    {
      'icon': Icon(Icons.vpn_key),
      'title': 'Account',
      'subtitle': 'Privacy,security,change number'
    },
    {
      'icon': Icon(Icons.message),
      'title': 'Chats',
      'subtitle': 'Theme,wallpapers,chat history'
    },
    {
      'icon': Icon(Icons.notifications),
      'title': 'Notifications',
      'subtitle': 'Message,group & call tones'
    },
    {
      'icon': Icon(Icons.data_usage),
      'title': 'Data and storage usage',
      'subtitle': 'Network usage,auto-download'
    },
    {
      'icon': Icon(Icons.help_outline),
      'title': 'Help',
      'subtitle': 'FAQ,contact us,privacy policy'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Icon(Icons.person),
              ),
              title: Text('Name'),
              subtitle: Text('Status'),
            ),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            Container(
              height: 360,
              child: SizedBox(
                child: ListView.builder(
                  itemCount: settings.length,
                  itemBuilder: (ctx, ind) {
                    return ListTile(
                      leading: settings[ind]['icon'],
                      title: Text(settings[ind]['title']),
                      subtitle: Text(settings[ind]['subtitle']),
                    );
                  },
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1.2,
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Invite a friend'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Center(
                child: Column(
                  children: [
                    Text('From'),
                    Text('HSVSURYA'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
