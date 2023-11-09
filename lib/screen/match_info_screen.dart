import 'package:cricket_score/model/cricket_info.dart';
import 'package:cricket_score/model/match_api_response.dart';
import 'package:cricket_score/screen/match_details_screen.dart';

import 'package:cricket_score/service/match_api_service.dart';
import 'package:flutter/material.dart';

import '../model/match_info.dart';

class MatchInfoScreen extends StatefulWidget {
  const MatchInfoScreen({super.key});

  @override
  State<MatchInfoScreen> createState() => _MatchInfoScreenState();
}

class _MatchInfoScreenState extends State<MatchInfoScreen> {
  MatchApiResponse? matchApiResponse;
  MatchApiService? matchApiService;

  @override
  void initState() {
    getMatchInformation();
    super.initState();
  }

  getMatchInformation() async {
    matchApiResponse = await MatchApiService.getMatchInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("FEATURED"),
        ),
        body: ListView.builder(
            itemCount: matchApiResponse?.data?.length ?? 0,
            itemBuilder: (context, index) {
              MatchInfo data = matchApiResponse!.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MatchDetailsScreen(matchInfo: MatchInfo(),

                        );
                      },
                    ),
                  );
                },
                child: Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(

                      children: [
                        Text(matchApiResponse!.data![index].date.toString()),
                        SizedBox(width: 24,),
                        Icon(Icons.location_on),
                        Text(matchApiResponse!.data![index].venue.toString()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Image.network(
                          data.teamInfo![0].img.toString(),
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(data.teamInfo![0].shortname.toString()),
                        SizedBox(
                          width: 24,
                        ),
                         Row(
                           children: [

                           ],
                         )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Image.network(
                          data.teamInfo![1].img.toString(),
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(data.teamInfo![1].shortname.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        matchApiResponse!.data![index].status.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
              );
            }));
  }
}
