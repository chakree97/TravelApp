import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelapp/detail.dart';

class FavoriteButton extends StatefulWidget {
  final bool? favorite;
  const FavoriteButton({
    super.key,
    this.favorite
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool favorite = false;

  @override
  void initState(){
    setState(() {
      favorite = widget.favorite ?? false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() {
          favorite = !favorite;
        });
      },
      icon: Icon(
        Icons.favorite,
        color: favorite ? Colors.red : Colors.grey,
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  final String image;
  final String title;
  final double review;
  final double? margin;
  const CardInfo({
    super.key,
    required this.image,
    required this.review,
    required this.title,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> DetailPage(title: title, image: image, review: review))
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: margin??0.0),
        width: width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white
                ),
                child: const Center(
                  child: FavoriteButton(favorite: false,)
                )
              )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: width*0.9,
                color: Colors.transparent,
                padding: EdgeInsets.all(15.0),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.white, size: 30,),
                          Text(
                            title,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          RatingBarIndicator(
                            rating: review,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 24.0,
                            unratedColor: Colors.white,
                            direction: Axis.horizontal,
                          ),
                          Text(
                            'Rating ${review}/5',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}