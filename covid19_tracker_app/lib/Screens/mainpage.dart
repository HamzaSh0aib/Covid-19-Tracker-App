import 'dart:convert';

import 'package:covid19_tracker_app/Screens/country.dart';
import 'package:covid19_tracker_app/model/getdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  getpostapi() async {
    var url = Uri.parse(worldwide);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Corona Virus Tracking App'),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getpostapi(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Global Data',
                      style: TextStyle(fontSize: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                              color: const Color(0xff375E97),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Cases',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                snapshot.data['cases'].toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                              color: const Color(0xffFB6542),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Deaths',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                snapshot.data['deaths'].toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff375E97), width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Recovered',
                                style: TextStyle(
                                    color: Color(0xff375E97),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data['recovered'].toString(),
                                style: const TextStyle(
                                    color: Color(0xff375E97),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff375E97), width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Active',
                                style: TextStyle(
                                    color: Color(0xff375E97),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data['active'].toString(),
                                style: const TextStyle(
                                    color: Color(0xff375E97),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 120,
                          decoration: BoxDecoration(
                              // color: Color(0xffFB6542),
                              border: Border.all(
                                  color: const Color(0xffFB6542), width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Critical',
                                style: TextStyle(
                                    color: const Color(0xffFB6542),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data['critical'].toString(),
                                style: const TextStyle(
                                    color: Color(0xffFB6542),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff375E97)),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Countrydata();
                              },
                            ));
                          },
                          child: Text(
                            'Trace Countries',
                            style: TextStyle(color: Colors.white,fontSize: 16),
                          )),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
