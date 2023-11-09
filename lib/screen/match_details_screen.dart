import 'package:cricket_score/model/match_info.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatefulWidget {
   MatchDetailsScreen({super.key,required this.matchInfo});
  MatchInfo? matchInfo;
  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Match Details"),
      ),
      body: Column(
        children: [
         Text(widget.matchInfo!.score.toString()),
        ],
      ),
    );
  }
}
