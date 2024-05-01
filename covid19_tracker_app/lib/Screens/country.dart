import 'dart:convert';

import 'package:covid19_tracker_app/Screens/deatil.dart';
import 'package:covid19_tracker_app/model/getdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Countrydata extends StatefulWidget {
  const Countrydata({super.key});

  @override
  State<Countrydata> createState() => _CountrydataState();
}

class _CountrydataState extends State<Countrydata> {
  getpost() async {
    var url = Uri.parse(countryWise);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  List? itemsearch;
  final TextEditingController _texteditingController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();

  @override
  void dispose() {
    _textFocusNode.dispose();
    _texteditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FutureBuilder(
          future: getpost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search Country Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      controller: _texteditingController,
                      focusNode: _textFocusNode,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data[index]['country'];
                        if (_texteditingController.text.isEmpty) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                    child: Image(
                                  image: NetworkImage(snapshot.data[index]
                                      ['countryInfo']['flag']),
                                )),
                                title:
                                    Text('${snapshot.data[index]['country']}'),
                              )
                            ],
                          );
                        } else if (name.toLowerCase().contains(
                            _texteditingController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                   
                                  
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                      child: Image(
                                    image: NetworkImage(snapshot.data[index]
                                        ['countryInfo']['flag']),
                                  )),
                                  title: Text(
                                      '${snapshot.data[index]['country']}'),
                                ),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
//