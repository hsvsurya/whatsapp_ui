import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Screens/call_screen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_ui/Screens/chat_sccreen.dart';
import 'package:whatsapp_ui/Screens/msg_screen.dart';
import 'package:whatsapp_ui/Screens/setting_screen.dart';
import 'package:whatsapp_ui/Screens/status_screen.dart';
import 'package:camera/camera.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        MsgScreen.routeName: (ctx) => MsgScreen(),
        SettingScreen.routeName: (ctx) => SettingScreen(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // List tabs = [
  //   ChatScreen(),
  //   StatusScreen(),
  //   CallScreen(),
  // ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('WhatsApp'),
        actions: [
          Container(
            padding: EdgeInsets.only(top: 7),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                return SearchBar(
                  onSearch: null,
                  onItemFound: null,
                );
              },
            ),
          ),
          PopupMenuButton(
            itemBuilder: (ctx) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Text('New group'),
              ),
              PopupMenuItem(
                child: Text('New broadcast'),
              ),
              PopupMenuItem(
                child: Text('Whatsapp Web'),
              ),
              PopupMenuItem(
                child: Text('Starred messages'),
              ),
              PopupMenuItem(
                child: Text('Payments'),
              ),
              PopupMenuItem(
                child: InkWell(
                  child: Text(
                    'Settings',
                  ),
                  splashColor: Theme.of(context).primaryColor,
                  onTap: () {
                    Navigator.of(context).pushNamed(SettingScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          // indicatorPadding: EdgeInsets.all(0),
          controller: _tabController,
          tabs: [
            Tab(
              child: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text('CHATS'),
            ),
            Tab(
              child: Text('STATUS'),
            ),
            Tab(
              child: Text('CALLS'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CamScreen(),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
    );
  }
}

class CamScreen extends StatefulWidget {
  @override
  _CamScreenState createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  CameraController _controller;
  Future<void> _initialiazeController;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    _initialiazeController = _controller.initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // You must wait until the controller is initialized before displaying the
// camera preview. Use a FutureBuilder to display a loading spinner until the
// controller has finished initializing.
          FutureBuilder<void>(
        future: _initialiazeController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
// (
      //         child: AspectRatio(
      //     aspectRatio: _controller.value.aspectRatio,
      //     child: CameraPreview(_controller),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initialiazeController;

            // Construct the path where the image should be saved using the path
            // package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
