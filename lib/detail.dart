import 'package:flutter/material.dart';
import 'package:travelapp/widget/cardinfo.dart';

class KeepButton extends StatefulWidget {
  final bool? keep;
  const KeepButton({
    super.key,
    this.keep
  });

  @override
  State<KeepButton> createState() => _KeepButtonState();
}

class _KeepButtonState extends State<KeepButton> {
  bool keep = false;

  @override
  void initState(){
    setState(() {
      keep = widget.keep ?? false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() {
          keep = !keep;
        });
      },
      icon: Icon(
        Icons.bookmark,
        color: keep ? Colors.amber : Colors.grey,
        size: 24,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String image;
  final double review;
  const DetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height*0.5,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
              )
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: 0,
                  child: Container(
                    width: width,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          }, 
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )
                        ),
                        Container(
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
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            width: width,
            height: height*0.5,
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const KeepButton(keep: false,)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.location_on,color: Colors.blue,),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Somewhere in the world',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade50,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                        leading: const SizedBox(
                          height: double.infinity,
                          child: Icon(Icons.star,size: 30,color: Colors.amber,),
                        ),
                        title: const Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: 'Poppins'
                          ),
                        ),
                        subtitle: Text(
                          '${review}/5',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Poppins'
                          ),
                        ),
                      )
                    ),
                    Container(
                      width: width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade50,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: const ListTile(
                        dense: true,
                        visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                        leading: SizedBox(
                          height: double.infinity,
                          child: Icon(Icons.navigation,size: 30,color: Colors.red,),
                        ),
                        title: Text(
                          'Distance',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: 'Poppins'
                          ),
                        ),
                        subtitle: Text(
                          '20 km',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Poppins'
                          ),
                        ),
                      )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Lorem ipsum dolor sit amet consectetur, adipisicing elit. Atque dolore delectus aliquam aperiam corporis autem molestiae, incidunt, dolorem nemo saepe vitae. Quaerat, velit quibusdam natus quas eos cum perspiciatis aspernatur.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: 'Poppins'
                ),),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 48.0,
                  child: ElevatedButton(
                  
                  onPressed: (){

                  }, 
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins'
                    ),
                  )
                )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}