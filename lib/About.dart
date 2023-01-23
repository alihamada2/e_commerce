import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),

        ),
        title: Text('Back'),
        backgroundColor: Colors.deepPurple[500],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 180,),
            Center(

                child: Text(
                    'Hello i am ali hamada student at '
                        'computer science helwan uv and this my first app ',style: TextStyle(fontSize: 25),),)
          ],
        ),
      ),
    );
  }
}
