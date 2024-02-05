import 'package:flutter/material.dart';
import 'package:travelapp/detail.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Map<String,dynamic>> value = [
      {'image': 'assets/phiphi.png', 'title': 'Phi-Phi','review': 4.8},
      {'image': 'assets/kohtao.jpeg', 'title': 'Koh Tao','review': 4.2},
      {'image': 'assets/doiinthanon.jpeg', 'title': 'Doi Inthanon','review': 4.6},
      {'image': 'assets/chaingkhan.jpeg', 'title': 'Chaing Khan','review': 4.3},
    ];
    return Container(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0,bottom: 20.0),
      child:  ListView(
        children: [
          const Text(
            'My Bookmark',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0,bottom: 30.0),
            width: width,
            height: height*0.05,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins'
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Container(
            width: width,
            height: height*0.7,
            child: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            children: value.map(
              (e) => GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> DetailPage(title: e['title'], image: e['image'], review: e['review']))
                  );
                },
                child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
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
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(e['image']),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Center(
                              child: KeepButton(
                                keep: true,
                              ),
                            )
                          )
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            e['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              )
            ).toList()
          ),
          )
        ],
      ),
    );
  }
}