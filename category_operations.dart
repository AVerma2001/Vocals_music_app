import 'package:spotify_app/models/category.dart';

class CategoryOperations {
  CategoryOperations._() {} // named constructor
  static List<Category> getCategories() {
    return <Category>[
      Category('Top Songs',
          'http://1.bp.blogspot.com/-LCPjCDQGmns/UMxHjTZ__mI/AAAAAAAAAn0/eYOKZ_oOSgA/s1600/top.png'),
      Category('MJ Hits',
          'https://c-cl.cdn.smule.com/rs-s80/arr/6e/dc/4ef11af4-a030-4a1b-98c4-0e4e67a878dd.jpg'),
      Category('Remix Songs',
          'https://c-cl.cdn.smule.com/rs-s-sf-3/arr/02/57/e31b430d-55be-4f04-9ad7-52859113a134.jpg'),
      Category('Old Songs',
          'https://www.androidfreeware.mobi/img2/old-hindi-songs-purane-gane.jpg')
    ];
  }
}
