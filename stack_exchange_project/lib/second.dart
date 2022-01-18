import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  String? questionbody;
  String? title;
  String? answerbody;
  String? answerusername;
  var time;
  int? questionid;
  int? answerid;
  SecondPage(
      {Key? key,
      this.answerid,
      this.answerbody,
      this.answerusername,
      this.questionbody,
      this.questionid,
      this.time,
      this.title})
      : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? gelenQuestionbody;
  String? gelentitle;
  String? gelenanswerbody;
  String? gelenanswerusername;
  var gelentime;
  int? gelenquestionid;
  int? gelenanswerid;

  @override
  void initState() {
    super.initState();
    gelenQuestionbody = widget.questionbody;
    gelentitle = widget.title;
    gelenanswerbody = widget.answerbody;
    gelenanswerusername = widget.answerusername;
    gelentime = widget.time;
    gelenanswerid = widget.answerid;
    gelenquestionid = widget.questionid;
  }

  String? d24;

  @override
  Widget build(BuildContext context) {
    var url = Uri.parse("https://api.stackexchange.com/2.3/questions/" +
        gelenquestionid.toString() +
        "?order=desc&sort=activity&site=stackoverflow&filter=!nKzQUR30SM");
    var url2 = Uri.parse("https://api.stackexchange.com/2.3/questions/" +
        gelenquestionid.toString() +
        "?order=desc&sort=activity&site=stackoverflow&filter=!*MZqiH2nLJUkb))*");

    Future verigetir() async {
      final response = await http.get(url2);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body.toString());

        print("object  " + gelenquestionid.toString());

        return result;

        // return (json.decode(response.body) as List)
        //     .map((tekGonderiMap) => StackExchange.fromJson(tekGonderiMap))
        //     .toList();
      } else {
        debugPrint("bağlanmıyor    " + response.toString());
        debugPrint("bağlanmıyor    " + gelenquestionid.toString());
        //  debugPrint("bağlanmıyor    " + response.body.toString());

      }
    }

    tarihayarla() async {
      var date = DateTime.fromMillisecondsSinceEpoch(gelentime * 1000);
      d24 = DateFormat('dd/MM/yyyy, HH:mm').format(date);
      print("second" + d24.toString());
      return d24;
    }

    print(gelenanswerid.toString());
    print(gelenquestionid.toString());
    print(gelentime.toString());

    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: verigetir(),
          builder: (context, AsyncSnapshot snapshot) {
            //   var url5 = snapshot.data!["items"][0]["link"].toString();
            if (snapshot.hasData) {
              tarihayarla();
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Center(
                    child: Text(
                      snapshot.data["items"][0]["title"],
                      textAlign: TextAlign.center,
                      //overflow: TextOverflow.clip,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Container(
                    //  margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                    )),
                    child: Text(
                      snapshot.data!["items"][0]["body_markdown"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  const Center(
                    child: Text(
                      "Popular Answer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Center(
                    child: Text(
                      gelenanswerid == null
                          ? "Henüz Cevaplanmadı"
                          : snapshot.data!["items"][0]["answers"][0]
                                  ["body_markdown"]
                              .toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        //  alignment: Alignment.bottomLeft,
                        child: Text(
                          gelenanswerid == null ? "" : d24!.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        // alignment: Alignment.bottomRight,
                        child: Text(
                          gelenanswerid == null
                              ? ""
                              : snapshot.data!["items"][0]["answers"][0]
                                      ["owner"]["display_name"]
                                  .toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () async {
                        var urlweb = snapshot.data!["items"][0]["link"];

                        return openUrl(urlweb);
                      },
                      child: const Text(
                        "For detailed review",
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: LinearProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future openUrl(String link) async {
    if (await canLaunch(link.toString()) == true) {
      await launch(link);
    } else {
      print("link açılmıyor");
    }
  }
}
