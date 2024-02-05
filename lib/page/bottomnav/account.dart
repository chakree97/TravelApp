import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 60.0,bottom: 20.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/phiphi.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: -10.0),
                    title: const Text(
                      'Naikree Devcode',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                    subtitle: const Text(
                      'Full Stack Developer',
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
                ]
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                              const ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Your Profile',style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 18
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.history),
                    title: Text(
                      'History',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 18
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.payment),
                    title: Text(
                      'Payment',style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 18
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 18
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        ) 
      );
  }
}