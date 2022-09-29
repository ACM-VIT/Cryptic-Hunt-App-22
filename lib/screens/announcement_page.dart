import 'package:cryptic_hunt/Providers/announcement_page_notifier.dart';
import 'package:cryptic_hunt/Providers/rule_page_notifier.dart';
import 'package:cryptic_hunt/Providers/timeline_page_notifier.dart';
import 'package:cryptic_hunt/widgets/custom_app_bar.dart';
import 'package:cryptic_hunt/widgets/generalCard.dart';
import 'package:cryptic_hunt/widgets/progressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/card.dart';

class AnnouncementPage extends StatefulWidget {
  static String id = "Announcement";
  AnnouncementPage({Key? key, required this.notifier}) : super(key: key);

  AnnouncementPageNotifier notifier = AnnouncementPageNotifier();

  @override
  State<AnnouncementPage> createState() => _AnnouncementPage();
}

class _AnnouncementPage extends State<AnnouncementPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getAnnouncement());

    super.initState();
  }

  Future<void> getAnnouncement() async {
    widget.notifier.getAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(
              title: "Announcement",
            ),
            Expanded(
                child: (widget.notifier.busy)
                    ? Center(
                        child: OwlProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RefreshIndicator(
                          onRefresh: getAnnouncement,
                          child: ListView.builder(
                            itemCount: widget.notifier.announcements.length,
                            itemBuilder: (context, index) {
                              return GenralCard(
                                  title: widget
                                      .notifier.announcements[index].title,
                                  date:
                                      widget.notifier.announcements[index].date,
                                  description: widget.notifier
                                      .announcements[index].description);
                            },
                          ),
                        ),
                      )

                // ListView(
                //   padding: const EdgeInsets.all(10),
                //   children: const [
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 1",
                //       desc: "Works ig",
                //       time: "8am-10pm",
                //     ),
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 2",
                //       desc: "idts ... it doesnt work so far",
                //       time: "8am-10pm",
                //     ),
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 3",
                //       desc: "nahi dalte hai",
                //       time: "8am-10pm",
                //     ),
                //     CustomCard(
                //       day: "THU",
                //       date: "25th",
                //       heading: "Speaker Session 4",
                //       desc: "Okay ab chal raha hai",
                //       time: "8am-10pm",
                //     ),
                //   ],
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
