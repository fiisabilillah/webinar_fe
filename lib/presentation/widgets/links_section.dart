import 'package:webinar_fe/presentation/constants.dart';
import 'package:webinar_fe/presentation/extensions/build_context_extension.dart';
import 'package:webinar_fe/presentation/widgets/socmed_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LinksSection extends StatelessWidget {
  const LinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: primaryColor,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: context.contentWidth >= 680 ? 600 : context.contentWidth - 80,
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: SvgPicture.asset('assets/svgs/codecon.svg'),
              ),
              sizedBoxHeight10,
              const Text(
                'We began in 2015 with a simple idea: bring together the best minds around the world in the tech industry to share their knowledge and insights with the community.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              sizedBoxHeight40,
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  SocmedIcon(platform: Socmeds.facebook),
                  SocmedIcon(platform: Socmeds.instagram),
                  SocmedIcon(platform: Socmeds.x),
                  SocmedIcon(platform: Socmeds.threads),
                  SocmedIcon(platform: Socmeds.telegram),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
