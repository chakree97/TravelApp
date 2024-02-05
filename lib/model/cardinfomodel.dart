class CardInfoModel{
  final String title;
  final String image;
  final double review;

  CardInfoModel({
    required this.title,
    required this.image,
    required this.review
  });

  factory CardInfoModel.fromJson(Map<String,dynamic> json) => CardInfoModel(
    image: json['image'],
    title: json['title'],
    review: json['review']
  );
}