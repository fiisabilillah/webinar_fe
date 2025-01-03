import 'package:webinar_fe/domain/entities/speaker.dart';
import 'package:webinar_fe/presentation/constants.dart';
import 'package:webinar_fe/presentation/widgets/brief_description_section.dart';
import 'package:webinar_fe/presentation/widgets/home_page_header.dart';
import 'package:webinar_fe/presentation/widgets/speaker_widget.dart';
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
            children: [
              HomePageHeader(),
              sizedBoxHeight60,
              BriefDescriptionSection(),
              SpeakerWidget(
                  speaker: Speaker(
                      name: 'Jessamine Mumtaz',
                      title: 'CTO',
                      affiliation: 'Microsoft',
                      photoUrl: 'assets/pngs/jessamine_mumtaz.png')),
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
