import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/logic/cubit/cubit.dart';
import 'package:news_app/logic/cubit/states.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      "assets/images/abc.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Settings',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    leading: const Icon(Icons.settings_outlined),
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  const Divider(
                    height: 0,
                    thickness: 2,
                    indent: 18,
                    endIndent: 30,
                  ),
                  BlocConsumer<CubitNews, StateNews>(
                    listener: (context, state) {
                    },
                    builder: (context, state) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Dark',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Switch(
                              value: CubitNews.getCubit(context).isLight,
                              onChanged: (value) {
                                CubitNews.getCubit(context).changeAppMode();
                              },
                            ),
                            const Text(
                              'Light',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                        leading : const Icon(Icons.dark_mode_outlined,color: Colors.grey,),
                        trailing : const Icon(Icons.brightness_4_outlined,color: Colors.blue,),
                      );
                    },
                  ),
                  const Divider(
                    height: 0,
                    thickness: 2,
                    indent: 18,
                    endIndent: 30,
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text(
                'Follow Us',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 13),
              child: Row(
                children: [
                  buildIconSocial(
                      icon: FontAwesomeIcons.facebook,
                      function: () => lunchUrl(urlFacebook)),
                  const SizedBox(
                    width: 15,
                  ),
                  buildIconSocial(
                      icon: FontAwesomeIcons.instagram,
                      function: () => lunchUrl(urlInstagram)),
                  const SizedBox(
                    width: 15,
                  ),
                  buildIconSocial(
                      icon: FontAwesomeIcons.youtube,
                      function: () => lunchUrl(urlYouTube)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void lunchUrl(String url) async {
    await canLaunch(url) ? await launch(url) : throw " Could not launch $url";
  }

  InkWell buildIconSocial(
      {required IconData icon, required VoidCallback function}) {
    return InkWell(
        child: Icon(
          icon,
          color: Colors.blue,
          size: 35,
        ),
        onTap: function);
  }
}
