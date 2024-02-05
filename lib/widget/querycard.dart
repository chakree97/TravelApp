import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:travelapp/model/cardinfomodel.dart';
import 'package:travelapp/state/category.dart';
import 'package:travelapp/widget/cardinfo.dart';
import 'package:collection/collection.dart';

class QueryCard extends StatelessWidget {
  const QueryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> category = ['Popular','Recommend','Hotel','Other'];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final List<List<CardInfoModel>> cardInfo = [
      [
        CardInfoModel(title: 'Phuket', image: 'assets/phuket.png', review: 4.5),
        CardInfoModel(title: 'Phi-Phi', image: 'assets/phiphi.png', review: 4.8),
        CardInfoModel(title: 'Samui', image: 'assets/kohsamui.png', review: 4.3)
      ],
      [
        CardInfoModel(title: 'Phi-Phi', image: 'assets/phiphi.png', review: 4.8),
        CardInfoModel(title: 'Doi Inthanon', image: 'assets/doiinthanon.jpeg', review: 4.6),
        CardInfoModel(title: 'Chaing Khan', image: 'assets/chaingkhan.jpeg', review: 4.3)
      ],
      [],
      [
        CardInfoModel(title: 'Sai Yok', image: 'assets/saiyok.jpeg', review: 4.4),
        CardInfoModel(title: 'Koh Tao', image: 'assets/kohtao.jpeg', review: 4.2),
      ]
    ];
    final categoryController = Get.put(CategoryController());
    ScrollController _listviewController = ScrollController();
    return GetBuilder<CategoryController>(
      builder: (_) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: category.mapIndexed((index,e) => InkWell(
                    onTap: (){
                      categoryController.onChangeCurrentIndex(index);
                      if(_listviewController.offset != 0){
                      _listviewController.animateTo(0, duration: const Duration(microseconds: 500), curve: Curves.linear);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: categoryController.current == index ? Colors.blue : Colors.white
                      ),
                      child:  Center(
                        child: Text(e,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: categoryController.current == index ? Colors.white : Colors.black
                          ),
                        ),
                      ),
                    ),
                  )
                ).toList()
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: width,
            height: height*0.42-20,
            child: cardInfo[categoryController.current].isEmpty ?
            Container(
              width: width,
              height: height*0.42-20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/notfound.png",width: 100,height: 100,),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Not Found',style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    fontSize: 20
                  ),)
                ],
              ),
            ):
            ListView(
              controller: _listviewController,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              children: cardInfo[categoryController.current].map((e) => CardInfo(
                image: e.image, 
                review: e.review, 
                title: e.title,
                margin: 20.0,
              )).toList(),
            )
          )
        ],
      )
    );
  }
}