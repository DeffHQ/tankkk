import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CamPage extends StatefulWidget {
  const CamPage({Key? key}) : super(key: key);

  @override
  State<CamPage> createState() => _CamPageState();
}



class _CamPageState extends State<CamPage> {
  String led = '0';
  String sound = 'Not detected';
  String up = '0';
  String right = '0';
  String left = '0';
  String down = '0';
  String stop = '0';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent.shade200,
            actions: [
              Padding(  
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 9),
                child: IconButton( // led
                  icon: const Icon(Icons.flashlight_on_rounded),
                  onPressed: () async {

                    DatabaseReference myRef = FirebaseDatabase.instance.ref();
                    final snapshot = await myRef.child("led").get();
                    Object? led = snapshot.value;
                    print(led);
                    if (led == "0") {
                      led = "1";
                    } else {
                      led = "0";
                    }
                    await myRef.update({
                      "led":  led
                    });
                  },
                ),
              )
            ],
            title: const Text('Camera', textAlign: TextAlign.center),

              ),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.red,
                Colors.blue,
              ],
            )


          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  width: 300,
                  child: Text(
                    'Sound is $sound',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  height: 250,
                  width: 300,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell( // up
                      splashColor: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                      onTap: () async {

                        DatabaseReference myRef = FirebaseDatabase.instance.ref();
                        final snapshot = await myRef.child("car/up").get();
                        var up = snapshot.value;
                        final snapshot1 = await myRef.child("car/left").get();
                        var left = snapshot1.value;
                        final snapshot2 = await myRef.child("car/right").get();
                        var right = snapshot2.value;
                        final snapshot3 = await myRef.child("car/down").get();
                        var down = snapshot3.value;
                        print(up.toString());
                        if (up == "0") {
                          up = "1";
                        } else {
                          up = "0";
                        }
                        await myRef.update({
                          "car": {"up": up , "left" : left , "right" : right , "down" : down }
                        });
                      },
                      highlightColor: Colors.red,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.arrow_upward_sharp,
                          color: Colors.black,
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: (MainAxisAlignment.center),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell( //left
                          splashColor: Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                          onTap: () async {

                            DatabaseReference myRef = FirebaseDatabase.instance.ref();
                            final snapshot = await myRef.child("car/left").get();
                            var left = snapshot.value;
                            final snapshot1 = await myRef.child("car/up").get();
                            var up = snapshot1.value;
                            final snapshot2 = await myRef.child("car/right").get();
                            var right = snapshot2.value;
                            final snapshot3 = await myRef.child("car/down").get();
                            var down = snapshot3.value;
                            print(left);
                            if (left == "0") {
                              left = "1";
                            } else {
                              left = "0";
                            }
                            await myRef.update({
                              "car": {"up": up , "left" : left , "right" : right , "down" : down }
                            });
                          },
                          highlightColor: Colors.red,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell( //right
                          splashColor: Colors.orange,
                          borderRadius: BorderRadius.circular(25),
                          onTap: () async {

                            DatabaseReference myRef = FirebaseDatabase.instance.ref();
                            final snapshot = await myRef.child("car/left").get();
                            var left = snapshot.value;
                            final snapshot1 = await myRef.child("car/up").get();
                            var up = snapshot1.value;
                            final snapshot2 = await myRef.child("car/right").get();
                            var right = snapshot2.value;
                            final snapshot3 = await myRef.child("car/down").get();
                            var down = snapshot3.value;
                            print(right);
                            if (right == "0") {
                              right = "1";
                            } else {
                              right = "0";
                            }
                            await myRef.update({
                              "car": {"up": up , "left" : left , "right" : right , "down" : down }
                            });

                          },
                          highlightColor: Colors.red,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell( //down
                      splashColor: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                      onTap: () async {

                        DatabaseReference myRef = FirebaseDatabase.instance.ref();
                        final snapshot = await myRef.child("car/left").get();
                        var left = snapshot.value;
                        final snapshot1 = await myRef.child("car/up").get();
                        var up = snapshot1.value;
                        final snapshot2 = await myRef.child("car/right").get();
                        var right = snapshot2.value;
                        final snapshot3 = await myRef.child("car/down").get();
                        var down = snapshot3.value;
                        print(down);
                        if (down == "0") {
                          down = "1";
                        } else {
                          down = "0";
                        }
                        await myRef.update({
                          "car": {"up": up , "left" : left , "right" : right , "down" : down }
                        });
                      },
                      highlightColor: Colors.red,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.black,
                        ),
                      )),
                ),
                Row(
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          primary: Colors.red,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: () async {
                          DatabaseReference myRef = FirebaseDatabase.instance.ref();
                          final snapshot = await myRef.child("car/stop").get();
                          var stop = snapshot.value;
                          if (stop == "0") {
                            stop = "1";
                          } else {
                            stop = "0";
                          }
                          myRef.update({"car" : {"stop" : stop }
                          });
                        },
                        child: const Icon(Icons.stop),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
