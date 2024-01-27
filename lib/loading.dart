import 'dart:async';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackjnu_dumper/database/Apis.dart';
import 'package:hackjnu_dumper/help.dart';
import 'package:hackjnu_dumper/moving.dart';
import 'package:hackjnu_dumper/profile.dart';
import 'package:hackjnu_dumper/utils/socket_methods.dart';
import 'package:hackjnu_dumper/utils/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'map_provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late Timer timer;
  int time = 0;
  SocketMethods _socketMethods = SocketMethods();
  ApiService apiService = ApiService();
  bool loading = false;
  void startdump(String id, List loc) {
    apiService.startDumping(context, id, loc).then((value) => {
       nextScreenReplace(context, MovingPage(dumping: true,))
         
        });
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
       _socketMethods.sendLoadingData(time.toDouble());
      if (time < 100) {
       
        setState(() {
          time = time + 10;
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      var dumper = context.watch<MapProvider>().selectedDumper;
    var shovel = context.watch<MapProvider>().selectedShovel;
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello ${dumper["owner"][0]}!",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  InkWell(
                      onTap: () {
                        nextScreen(context, ProfilePage());
                      },
                      child: const Icon(Icons.person_2_outlined))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 250,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/truck.png",
                        ),
                        fit: BoxFit.contain)),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: time >= 90
                          ? MediaQuery.of(context).size.width * (time / 100) -
                              40
                          : MediaQuery.of(context).size.width * (time / 100),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.white,
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shovel["owner"][0],
                                style: TextStyle(
                                    color: Color(0xff101A29),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "+91 ${ shovel["owner"][3]}",
                                style: TextStyle(
                                  color: Color(0xff4A4A4A),
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              launch("tel://${shovel["owner"][3]}");
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: const Icon(
                                Icons.phone,
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Filled",
                                style: TextStyle(
                                  color: Color(0xff4A4A4A),
                                ),
                              ),
                              Text(
                                "${((time / 100) * 14).toStringAsFixed(2)}/14 ton",
                                style: TextStyle(
                                    color: Color(0xff101A29),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (time >= 100) {
                                    startdump(
                                        dumper["_id"], shovel["location"]);
                                   
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: loading?CircularProgressIndicator(color: Colors.white,):Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "FILLED",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: time >= 100
                                          ? Color(0xff101A29)
                                          : Colors.grey,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showdialog();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  padding: const EdgeInsets.all(8),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help_outline_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "HELP & SUPPORT",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void showdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
                child: Text(
              "ALERT",
              style: TextStyle(color: Color(0xff101A29)),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "Looks like something paused your progress. Need a hand getting back on track?"),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xff101A29),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Center(
                        child: Text(
                      "DISMISS",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    nextScreen(context, HelpPage());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff101A29)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: const Center(child: Text("HELP & SUPPORT")),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
