import 'package:flutter/material.dart';

class WatingPage extends StatelessWidget {
  static String routeName = '/ProcessCompletePage';

  const WatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  width: 280,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Color(0xfffd7901),
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  child: const Center(
                      child: Text('Continue',
                          style: TextStyle(
                            fontFamily: 'MazzardM',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ))),
                ),
                SizedBox(height: 50,),
                const Text(
                  'Processing',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
