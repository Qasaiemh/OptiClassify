import 'package:OptiClassify/widget/bep.dart';
import 'package:OptiClassify/widget/global_variables.dart';
import 'package:OptiClassify/widget/modem.dart';
import 'package:OptiClassify/widget/oto.dart';
import 'package:flutter/material.dart';

import 'widget/plant_recogniser.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/HomePage';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
              child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const SizedBox(
                    height: 100,
                    width: 280,
                    //child: Image.asset('assets/Orange Logo.png'),
                    child: Text(
                      'Check List',
                      style: TextStyle(
                        fontFamily: 'MazzardM',
                        fontWeight: FontWeight.w700,
                        fontSize: 55.0,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {Navigator.pushNamed(context,
                  //       PlantRecogniser.routeName);},
                  //   child: Container(
                  //     height: 90,
                  //     decoration: BoxDecoration(
                  //         color: const Color(0xff023e8a),
                  //         borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     child: const Padding(
                  //       padding: EdgeInsets.symmetric
                  //         (vertical: 20, horizontal: 20),
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment:
                  //         MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           SizedBox(
                  //             height: double.infinity,
                  //             width: 150,
                  //             child: Text(
                  //               'DB',
                  //               style: TextStyle(
                  //                   fontSize: (40),
                  //                   fontWeight: FontWeight.w700,
                  //                   color: Colors.white),
                  //             ),
                  //           ),
                  //           Icon( Icons.arrow_forward, size: 50,
                  //             color: Colors.white,),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, BEP.routeName);
                    },
                    child: Container(
                      width: 200,
                      height: 90,
                      decoration: BoxDecoration(
                          color: const Color(0xffFD7901),
                          borderRadius: BorderRadius.circular(20)),
                      child:  Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                          children: [
                            Text(
                                      'BEP',
                                      style: TextStyle(
                                          fontSize: (40),
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                          ],
                        ),

                        // child: Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment:
                        //   MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SizedBox(
                        //       height: double.infinity,
                        //       width: 150,
                        //       child: Text(
                        //         'BEP',
                        //         style: TextStyle(
                        //             fontSize: (40),
                        //             fontWeight: FontWeight.w700,
                        //             color: Colors.white),
                        //       ),
                        //     ),
                        //     Icon( Icons.arrow_forward, size: 50,
                        //       color: Colors.white,),
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (continuation == false && !blocke) {
                        showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    "Can't Continue",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Please make sure that the '
                                    'BEP is correctly classified to continue',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  actions: [
                                    TextButton(
                                        child: const Text(
                                          'Ok',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        })
                                  ],
                                ));
                      } else {
                        Navigator.pushNamed(context, Modem.routeName);
                      }
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          width: 200,
                          height: 90,
                          decoration: BoxDecoration(
                              color: (continuation == false)
                                  ? Colors.grey
                                  : const Color(0xffFD7901),
                              borderRadius: BorderRadius.circular(20)),
                          child:  const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                                 child : Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment:
                                     MainAxisAlignment.center,
                                   children: [
                                     Text(
                                        'Modem',
                                        style: TextStyle(
                                            fontSize: (40),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                   ],
                                 ),


                            //  Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   mainAxisAlignment:
                            //   MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     SizedBox(
                            //       height: double.infinity,
                            //       width: 150,
                            //       child: Text(
                            //         'Modem',
                            //         style: TextStyle(
                            //             fontSize: (40),
                            //             fontWeight: FontWeight.w700,
                            //             color: Colors.white),
                            //       ),
                            //     ),
                            //     Icon( Icons.arrow_forward, size: 50,
                            //       color: Colors.white,),
                            //   ],
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  // GestureDetector(
                  //   onTap: () {Navigator.pushNamed(context,
                  //       OTO.routeName);},
                  //   child: Container(
                  //     height: 90,
                  //     decoration: BoxDecoration(
                  //         color: const Color(0xff023e8a),
                  //         borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     child: const Padding(
                  //       padding: EdgeInsets.symmetric
                  //         (vertical: 20, horizontal: 20),
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment:
                  //         MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           SizedBox(
                  //             height: double.infinity,
                  //             width: 150,
                  //             child: Text(
                  //               'OTO',
                  //               style: TextStyle(
                  //                   fontSize: (40),
                  //                   fontWeight: FontWeight.w700,
                  //                   color: Colors.white),
                  //             ),
                  //           ),
                  //           Icon( Icons.arrow_forward, size: 50,
                  //             color: Colors.white,),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}
