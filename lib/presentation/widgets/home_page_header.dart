import 'package:webinar_fe/presentation/constants.dart';
import 'package:webinar_fe/presentation/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 340,
          color: primaryColor,
        ),
        Center(
          child: Wrap(
            children: headerElements(context),
          ),
        )
      ],
    );
  }

  List<Widget> headerElements(BuildContext context) {
    double elementWidth = context.windowsSize == WindowsSizes.compact
        ? context.contentWidth
        : context.contentWidth / 2;

    return [
      SizedBox(
          width: elementWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eventDate(),
                ...tagLine(),
                sizedBoxHeight20,
                eventLocation(width: elementWidth),
                eventPrice(),
                sizedBoxHeight30,
                registerButton(),
                sizedBoxHeight40,
              ],
            ),
          )),
      headerPicture(
        width: elementWidth,
      ),
    ];
  }

  Widget registerButton() => ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(secondaryColor)),
      child: const Text('Register Now', style: TextStyle(color: Colors.white)));

  Widget eventPrice() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(MdiIcons.ticketConfirmation, color: Colors.white, size: 18),
          sizedBoxWidth5,
          const Text('IDR 750,000', style: TextStyle(color: Colors.white)),
        ],
      );

  Widget eventLocation({required double width}) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(MdiIcons.mapMarkerRadius, color: Colors.white, size: 18),
          sizedBoxWidth5,
          SizedBox(
            width: width - 65,
            child: const Text('International Bali Resort, Bali Indonesia',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      );

  List<Widget> tagLine() => [
        const Text('The Ultimate',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30)),
        const Text('Event for Developers',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30)),
      ];

  Widget eventDate() => const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: Colors.white,
            size: 18,
          ),
          sizedBoxWidth5,
          Text(
            'August 8 - 9, 2004',
            style: TextStyle(color: Colors.white),
          )
        ],
      );

  Widget headerPicture({required double width}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width,
        height: 390,
        child: Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/pngs/header_bg.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10))),
      );
}
