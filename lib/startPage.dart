import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackjnu_dumper/map_provider.dart';
import 'package:hackjnu_dumper/selectShovel.dart';
import 'package:hackjnu_dumper/utils/widgets.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    var dumper = context.watch<MapProvider>().selectedDumper;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dumper Info"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                        const Icon(
                          Icons.car_crash_rounded,
                          color: Color(0xff4A4A4A),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dumper ID",
                              style: TextStyle(
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 130,
                              height: 30,
                              child: TextFormField(
                                enabled: false,
                                initialValue: dumper["_id"],
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none),
                                style: const TextStyle(
                                    color: Color(0xff101A29),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    color: const Color(0xffEFEFEF),
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.monitor_weight,
                          color: Color(0xff4A4A4A),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dumper capacity",
                              style: TextStyle(
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 130,
                              height: 30,
                              child: TextFormField(
                                enabled: false,
                                initialValue: "1000 ton",
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none),
                                style: const TextStyle(
                                    color: Color(0xff101A29),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    color: const Color(0xffEFEFEF),
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.car_repair_outlined,
                          color: Color(0xff4A4A4A),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Shovel Id",
                              style: TextStyle(
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 130,
                              height: 30,
                              child: TextFormField(
                                enabled: false,
                                initialValue: dumper["shovelConn"],
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none),
                                style: const TextStyle(
                                    color: Color(0xff101A29),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    color: const Color(0xffEFEFEF),
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: Color(0xff4A4A4A),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Owner",
                              style: TextStyle(
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 130,
                              height: 30,
                              child: TextFormField(
                                enabled: false,
                                initialValue: dumper["owner"][0],
                                decoration: const InputDecoration(
                                  disabledBorder: InputBorder.none,
                                ),
                                style: const TextStyle(
                                    color: Color(0xff101A29),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    color: const Color(0xffEFEFEF),
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_3_outlined,
                          color: Color(0xff4A4A4A),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Age",
                              style: TextStyle(
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 130,
                              height: 30,
                              child: TextFormField(
                                enabled: false,
                                initialValue: dumper["owner"][1],
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none),
                                style: const TextStyle(
                                    color: Color(0xff101A29),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    color: const Color(0xffEFEFEF),
                    height: 2,
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    color: const Color(0xffEFEFEF),
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: Color(0xff4A4A4A),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Phone Number",
                              style: TextStyle(
                                color: Color(0xff4A4A4A),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 130,
                              height: 30,
                              child: TextFormField(
                                enabled: false,
                                initialValue: dumper["owner"][3],
                                decoration: const InputDecoration(
                                    disabledBorder: InputBorder.none),
                                style: const TextStyle(
                                    color: Color(0xff101A29),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                nextScreenReplace(context, SelectPage());
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 40,
                child: Center(
                    child: Text(
                  "Select shovel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                )),
                decoration: BoxDecoration(color: Colors.blue),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
