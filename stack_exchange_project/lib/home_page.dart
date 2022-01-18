import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:stack_exchange_project/second.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var numarayagorecekilenid = Uri.parse(
  //     'https://api.stackexchange.com/2.3/answers?order=desc&sort=activity&site=stackoverflow&filter=!nKzQUR6(B-');
  // var url = Uri.parse(
  //     'https://api.stackexchange.com/2.3/answers?order=desc&sort=activity&site=stackoverflow&filter=!6VvPDzQHbd2UL');
  var url2 = Uri.parse(
      'https://api.stackexchange.com/2.3/answers?order=desc&sort=activity&site=stackoverflow&filter=!T1gn2_e_B4sD4XhW4T');

  var deneme = Uri.parse(
      "https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow&filter=!6VvPDzPyz3f6q");

//  ScrollController controller = ScrollController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  Future verigetir() async {
    final response = await http.get(deneme);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body.toString());

      return result;

      // return (json.decode(response.body) as List)
      //     .map((tekGonderiMap) => StackExchange.fromJson(tekGonderiMap))
      //     .toList();
    } else {
      debugPrint("bağlanmıyor    " + response.toString());
      //  debugPrint("bağlanmıyor    " + response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: verigetir(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data["items"].length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(snapshot.data["items"][index]["title"]
                                .toString()),
                            leading: Image.network(snapshot.data["items"][index]
                                    ["owner"]["profile_image"]
                                .toString()),
                            trailing: Text(
                              snapshot.data["items"][index]["owner"]
                                      ["display_name"]
                                  .toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                      title: snapshot.data["items"][index]
                                              ["title"]
                                          .toString(),
                                      questionid: snapshot.data["items"][index]
                                          ["question_id"],
                                      answerbody: snapshot.data["items"][index]
                                              ["body_markdown"]
                                          .toString(),
                                      answerid: snapshot.data["items"][index]
                                                  ["answer_count"] ==
                                              0
                                          ? null
                                          : snapshot.data["items"][index]
                                              ["answers"][0]["answer_id"],
                                      time: snapshot.data["items"][index]
                                          ["creation_date"],
                                      answerusername: snapshot.data["items"]
                                              [index]["answers"]?[0]["owner"]
                                              ["display_name"]
                                          .toString(),
                                    ),
                                  ));
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 28,
                          ),
                        ],
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
