import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:tradenewsapp/screens/dictionary_view_screen.dart';
import 'package:tradenewsapp/utils/globals.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen>
    with AutomaticKeepAliveClientMixin<DictionaryScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Global.dictionary.clear();

    Timer.run(() async {
      final response = await http
          .get(Uri.parse("https://www.worldfinance.com/financial-dictionary"));
      var document = parser.parse(utf8.decode(response.bodyBytes));
      List<dom.Element> ll = document.getElementsByClassName('term-title');
      for (dom.Element node in ll) {
        try {
          Global.dictionary.add({
            "word": node.text,
            "details": node.nextElementSibling!.text,
          });
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      Global.dictionaryTemp.addAll(Global.dictionary);
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        foregroundColor: const Color(0xFFC4C4C4),
        elevation: 1,
        title: const Text(
          "DICTIONARY",
          style: TextStyle(color: Color(0xFFC4C4C4), fontSize: 25),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // Expanded(
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(right: 15),
                      //     child: IconButton(
                      //       splashRadius: 25,
                      //       icon: const Icon(
                      //         Icons.search,
                      //         color: Colors.white,
                      //       ),
                      //       onPressed: () {},
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 6,
                        child: TextFormField(
                          obscureText: false,
                          onChanged: (value) {
                            Global.dictionaryTemp.clear();
                            setState(() {
                              Global.dictionaryTemp.addAll(Global.dictionary
                                  .where((element) =>
                                      element["word"]!.contains(value)));
                            });
                          },
                          scrollPadding: EdgeInsets.zero,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.5),
                            contentPadding: const EdgeInsets.all(20),
                            // icon: Padding(
                            //   padding: const EdgeInsets.only(right: 15),
                            //   child: IconButton(
                            //     splashRadius: 25,
                            //     icon: const Icon(
                            //       Icons.search,
                            //       color: Colors.white,
                            //     ),
                            //     onPressed: () {},
                            //   ),
                            // ),
                            isDense: true,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: IconButton(
                                splashRadius: 25,
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4), width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFC4C4C4), width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: Global.dictionaryTemp.length,
                      itemBuilder: (lvContext, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DictionaryViewScreen(
                                      newsIndex: index,
                                    ),
                                  ),
                                );
                              },
                              child: Ink(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 0,
                                            ),
                                            Text(
                                              Global.dictionaryTemp[index]
                                                  ["word"]!,
                                              softWrap: true,
                                              style: const TextStyle(
                                                color: Color(0xFFC4C4C4),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: Color(0xFF8A8A8B),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
