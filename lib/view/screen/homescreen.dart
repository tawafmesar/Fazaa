import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widget/auth/LogoAuth.dart';


class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.clockOutline,
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(AppImageAsset.logo),
          ),
          title:  Text("Home", style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),),
          actions: [
            IconButton(
              onPressed: () async {
              },
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
            ),
          ],
        ),
        body: SafeArea(
          child:ListView(
            children: [
              const LogoAuth(),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(8),
                margin:const EdgeInsets.only(right: 12),
                child: const Text("Allows sharing and downloading files that the student needs. \nAllows you to chat with our GPT chat. \nWe are Working on the map and it will be in Future Work.",
                    style:  TextStyle(color:AppColor.bottombar,
                      fontSize: 20, fontWeight: FontWeight.bold,
                      )
                ),
              ),

              const SizedBox(
                height: 12.0,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0), // Add padding for better visuals
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Optional border for clarity
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: AppColor.primaryColor3,
                              child: Center(child: Text('Study materiales'
                                ,style:  TextStyle(color:AppColor.white,
                                fontSize: 20, fontWeight: FontWeight.bold,
                              )
                              )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: AppColor.primaryColor3,
                              child: Center(child: Text('AI Chat'
                                  ,style:  TextStyle(color:AppColor.white,
                                    fontSize: 20, fontWeight: FontWeight.bold,
                                  )
                              )
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              child: Center(child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  'assets/images/share.gif' ,
                                ),
                              )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.green,
                              child: Center(child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  'assets/images/chat.gif' ,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row( // Second row with one column
                        children: [
                          Expanded(
                            child: Container(
                              width: 200,
                              color: AppColor.primaryColor3,
                              child: Center(child: Text('Location',            style:  TextStyle(color:AppColor.white,
                                  fontSize: 20, fontWeight: FontWeight.bold,
                              ))),
                            ),
                          ),
                        ],
                      ),
                      Row( // Second row with one column
                        children: [
                          Expanded(
                            child: Container(
                              child: Center(child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  'assets/images/location.gif' ,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),




            ],
          ) ,

        ));
  }
}
