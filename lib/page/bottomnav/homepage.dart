import 'package:flutter/material.dart';
import 'package:travelapp/widget/querycard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 60.0,bottom: 20.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/phiphi.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: -10.0),
                    title: const Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                    subtitle: const Text(
                      'Explore Your World Beauty',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.white
                      ),
                    ),
                    trailing: CircleAvatar(
                      radius: 30,
                      child: Image.asset('assets/profile.png',width: 60,height: 60,),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0,bottom: 30.0),
                    width: width,
                    height: height*0.07,
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
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                ),
                color: Colors.white70
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 SizedBox(
                  height: 20.0,
                 ),
                  Text('Category',style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 28,
                    fontWeight: FontWeight.w600
                  ),),
                  QueryCard()
                ],
              ),
            )
          ],
        ),
      );
  }
}