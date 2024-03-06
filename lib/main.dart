import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  bool isAnimating= false;
  
  
  @override
  void initState() {
    _controller = AnimationController(vsync: this,
    duration: Duration(seconds: 2)
    );
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Animation"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent
      ),

      body: ListView(

          children:
          [

            Lottie.network
              (
                "https://lottie.host/4be7c74f-56fa-4f16-bec1-0ea59d647c8f/PvmiO3P0qC.json",
              controller: _controller,
              onLoaded: (composition){
                 // _controller.duration=composition.duration;
                  //_controller.repeat();
              },
            ),
            
            Padding(
              padding: const EdgeInsets.only(right: 200,left: 200),
              child: TextButton(
                  onPressed: (){
                      if(_controller.isAnimating){
                        _controller.stop();
                        setState(() {
                          isAnimating= false;
                        });
                      }else{
                        _controller.forward();
                        setState(() {
                          isAnimating= true;
                        });
                      }
                  },
                  child: Text( isAnimating? "Stop":"Play")
              ),
            ),

            SizedBox(height: 30),

            Lottie.asset("assets/animations/Animation_man.json"),
            SizedBox(height: 30),

            Lottie.network("https://lottie.host/4be7c74f-56fa-4f16-bec1-0ea59d647c8f/PvmiO3P0qC.json"),
            SizedBox(height: 30),

            Lottie.asset("assets/animations/Animation_man.json"),

          ],
        ),

    );
  }
}
