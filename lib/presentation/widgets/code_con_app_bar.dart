import 'package:webinar_fe/presentation/constants.dart';
import 'package:webinar_fe/presentation/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CodeConAppBar extends StatelessWidget {
  const CodeConAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
          child: Center(
        child: SizedBox(
          width: context.contentWidth - 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 25,
                  width: 85,
                  child: SvgPicture.asset(
                    'assets/svgs/codecon.svg',
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  sizedBoxWidth20,
                  InkWell(
                      onTap: () {},
                      child: const Text('Contact',
                          style: TextStyle(color: Colors.white))),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
