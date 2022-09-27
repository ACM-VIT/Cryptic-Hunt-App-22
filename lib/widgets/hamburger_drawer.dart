import 'package:cryptic_hunt/Providers/profile_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/Providers/timeline_page_notifier.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:cryptic_hunt/screens/timeline.dart';
import 'package:cryptic_hunt/screens/archive_screen.dart';
import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:cryptic_hunt/screens/profile_page.dart';
import 'package:cryptic_hunt/screens/team_page.dart';
import 'package:cryptic_hunt/screens/timeline.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../screens/faq_screen.dart';

import '../Providers/archive_page_notifier.dart';

import 'hamburger_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptic_hunt/widgets/countdown_timer.dart';

class HamburgerDrawer extends StatelessWidget {
  HamburgerDrawer({Key? key}) : super(key: key);

  ProfileService profileService = GetIt.I<ProfileService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: Column(
          // Important: Remove any padding from the ListView.
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 20),
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFFF7A01), width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(
                        profileService.getUser()?.picture ??
                            "www.defaultImage.com",
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                      height: 0,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profileService.getUser()?.name ?? "loading...",
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/timeline.svg'),
              text: 'Timeline',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider<TimelinePageNotifier>(
                            create: (context) => TimelinePageNotifier(),
                            builder: (context, child) => Timeline(
                                notifier:
                                    Provider.of<TimelinePageNotifier>(context)),
                          )),
                );
              },
            ),
            HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/archive.svg'),
              text: 'Archive',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                            create: (context) => ArchivePageNotifier(),
                            builder: (context, child) => ArchiveScreen(
                                notifier: Provider.of<ArchivePageNotifier>(
                              context,
                            )),
                          )),
                );
              },
            ),
            // HamburgerItem(
            //     svgPicture: SvgPicture.asset('assets/HamBurger/resources.svg'),
            //     text: 'Resources'),
            HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/faq.svg'),
              text: 'Frequently Asked Questions',
              onTap: () {
                Navigator.pushNamed(context, FaqScreen.id);
              },
            ),
            // HamburgerItem(
            //     svgPicture: SvgPicture.asset('assets/HamBurger/sponsors.svg'),
            //     text: 'Our Sponsors'),
            HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/profile.svg'),
              text: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                            create: (_) => ProfileNotifier(),
                            builder: (context, child) {
                              return ProfilePage(
                                state: Provider.of<ProfileNotifier>(context),
                              );
                            },
                          )),
                );
              },
            ),
            const Expanded(child: SizedBox()),
            SvgPicture.asset('assets/HamBurger/hamburger_owl.svg'),
          ],
        ),
      ),
    );
  }
}
