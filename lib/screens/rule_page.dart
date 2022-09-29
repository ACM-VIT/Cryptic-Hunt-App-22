import 'package:cryptic_hunt/Providers/rule_page_notifier.dart';
import 'package:cryptic_hunt/Providers/timeline_page_notifier.dart';
import 'package:cryptic_hunt/widgets/custom_app_bar.dart';
import 'package:cryptic_hunt/widgets/generalCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/card.dart';

class RulePage extends StatefulWidget {
  static String id = "Rule";
  RulePage({Key? key, required this.notifier}) : super(key: key);

  RulePageNotifier notifier = RulePageNotifier();

  @override
  State<RulePage> createState() => _RulePage();
}

class _RulePage extends State<RulePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getRule());

    super.initState();
  }

  Future<void> getRule() async {
    widget.notifier.getRules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(
              title: "Rules",
            ),
            Expanded(
                child: (widget.notifier.busy)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RefreshIndicator(
                          onRefresh: getRule,
                          child: ListView.builder(
                            itemCount: widget.notifier.rules.length,
                            itemBuilder: (context, index) {
                              return GenralCard(
                                  description:
                                      widget.notifier.rules[index].description);
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
