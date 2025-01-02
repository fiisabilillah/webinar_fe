import 'package:code_con_course_fe/presentation/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/code_con_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: CodeConAppBar()),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          ListView(
            children: const [
              Text('HomePageHeader'),
              sizedBoxHeight60,
              Text('BriefDescriptionSection'),
              Text('SpeakerSection'),
              Text('AgendaSection'),
              sizedBoxHeight60,
              Text('LinksSection'),
              Text('FooterSection'),
            ],
          )
        ],
      )),
    );
  }
}
