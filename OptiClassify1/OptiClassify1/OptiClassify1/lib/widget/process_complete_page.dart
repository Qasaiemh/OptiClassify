import 'package:flutter/material.dart';

class ProcessCompletePage extends StatelessWidget {
  static String routeName = '/ProcessCompletePage';

  const ProcessCompletePage({super.key});

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
                SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.network(
                        'https://static-00.iconduck.com/assets.00/info-orange-icon-2048x2048-850l5w20.png')),
                SizedBox(height: 50,),
                const Text(
                  'Process Completed',
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
