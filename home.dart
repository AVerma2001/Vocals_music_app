import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/models/category.dart';
import 'package:spotify_app/services/category_operations.dart';
import 'package:spotify_app/services/music_operations.dart';
import '../models/music.dart';

class Home extends StatelessWidget {
  // const Home({super.key});

  Function _miniPlayer;
  Home(this._miniPlayer);

  Widget createCategory(Category category) {
    return Container(
      color: Colors.deepPurpleAccent,
      child: Row(
        children: [
          Image.network(category.imageURL, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createListOfCategory() {
    List<Category> categoryList =
        CategoryOperations.getCategories(); // Recieved Data
    // Converting data to widget using map function
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all((10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: InkWell(
              onTap: () {
                _miniPlayer(music, stop: true);
              },
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            music.desc,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList =
        MusicOperations.getMusic(); // get music stored in music_operations
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            // wrappint up with widget - container to specify dimensions and alignment
            height: 275,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategory(),
        crossAxisCount: 2, // number of cells to be visible
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
            padding: EdgeInsets.only(
                right: 10), // space from right --> space is called as padding
            child: Icon(Icons.settings))
      ],
    );

    //function with return type as widget
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          // aligning the text on safe place in the app
          child: Container(
        // container contains the complete window/frame of the application
        child: Column(
          children: [
            createAppBar('Hi - Welcome to VOCALS!'),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            createMusicList('Made For You'),
            createMusicList('Popular Playlist')
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3])),
      )),
    );
  }
}
