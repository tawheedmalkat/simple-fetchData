

class Photo{
  final int albumId;
  final int id;
  String title;
  String url;
  String thumbnailUrl;
  Photo({required this.title,required this.url,
      required this.albumId,required this.id,required this.thumbnailUrl,} );
  factory Photo.fromjson(Map<String,dynamic>map){
  return Photo(
  title: map['title'],
  url: map['url'],
  thumbnailUrl: map['thumbnailUrl'],
  albumId: map['albumId'],
  id: map['id'],
  );


  }
}