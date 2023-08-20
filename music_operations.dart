import 'package:spotify_app/models/music.dart';

class MusicOperations {
  MusicOperations._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
          'Aadat',
          'https://c-cl.cdn.smule.com/rs-s62/arr/9b/e2/c3863109-25e5-4a73-a678-ac1aea1f435f.jpg',
          'Song by Atif Aslam',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/dd/74/dc/dd74dc8f-e9c3-be88-9bf2-955c08bfa894/mzaf_1972748909962214971.plus.aac.p.m4a'),
      Music(
          'Mitwa',
          'https://c-cl.cdn.smule.com/rs-s-sf-1/arr/b1/9b/654e1f1e-2e51-4df5-88eb-207a8e4e977e.jpg',
          'Song by Shankar Mahadevan',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview123/v4/32/58/a4/3258a4ee-ed86-abcf-f0cf-98001eb56eb8/mzaf_10323936484270814422.plus.aac.p.m4a'),
      Music(
          'Numb',
          'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/812cWi7lGdL._CR0,204,1224,1224_UX256.jpg',
          'Song by Linkin Park',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/bb/13/76/bb1376a7-4db0-ed68-c1a6-d0278cc4b320/mzaf_17832584344687833283.plus.aac.p.m4a')
    ];
  }
}
