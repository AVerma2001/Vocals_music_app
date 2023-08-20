import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/screens/home.dart';
import 'package:spotify_app/screens/search.dart';
import 'package:spotify_app/screens/yourlibrary.dart';

import '../models/music.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var Tabs = []; // List of all tabs -- Home(), Search(), YourLibrary()

  int currentTabIndex = 0; // Home tab is displayed

  bool isPlaying = false; // flag that tells that no song is running

  Music? music;

  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;

    if (music == null) {
      // no music is selected
      return SizedBox();
    }

    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.purple,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(music.image, fit: BoxFit.cover),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioPlayer.play(music.audioURL);
                } else {
                  await _audioPlayer.pause();
                }
                setState(() {});
              },
              icon: isPlaying
                  ? Icon(
                      Icons.pause,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [Home(miniPlayer), Search(), YourLibrary()];
  }

  // UI DESIGN CODE GOES INSIDE BUILD //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // its like a webpage
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black, // background color of spotify
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          BottomNavigationBar(
              currentIndex:
                  currentTabIndex, // currently opened tab is currenttabindex i.e. 0
              onTap: (currentIndex) {
                print("Current index is $currentIndex");
                currentTabIndex = currentIndex;
                setState(() {
                  // setstate triggers the build to rerun itself. it is only used in stateful widgets
                });
              },
              selectedLabelStyle: TextStyle(
                  color: Colors
                      .white), // to make the text of selected widget white
              selectedItemColor: Colors.white,
              backgroundColor: Colors.black45,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: Colors.white),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_add_outlined, color: Colors.white),
                    label: 'Your Library')
              ])
        ],
      ),
    );
  }
}
