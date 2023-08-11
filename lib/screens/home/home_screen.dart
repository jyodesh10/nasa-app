import 'package:flutter/material.dart';
import 'package:nasa_app/screens/apod/apod_screen.dart';

import '../../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String,dynamic>> titles = [
    {"title":"Astronomy Picture of the Day","img": exoplanet},
    {"title":"Earth","img": earth},
    {"title":"Earth Polychromatic Imaging Camera","img": exoplanet2},
    {"title":"Exoplanets","img": exoplanet3},
    {"title": "Mars Rover Photos","img": mars},
    {"title":"InSight","img": sun},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greydrk,
      body: SafeArea(
        child: Center(
          child: Wrap(
            runSpacing: 20,
            spacing: 20,
            runAlignment: WrapAlignment.center,
            children: List.generate(titles.length, (index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                highlightColor: primary,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ApodScreen(), ) );
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: base,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 80,  
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(titles[index]['img'], 
                            height: 150, 
                          ),
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Colors.black26,Colors.black45 ],
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3,0.8]
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(child: Text(titles[index]['title'].toString(), style: titleStyle, )),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}