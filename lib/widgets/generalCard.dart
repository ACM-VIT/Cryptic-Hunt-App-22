import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenralCard extends StatelessWidget {
  final String? title;
  final String description;
  late DateTime? date;

  GenralCard({
    Key? key,
    this.title,
    String? date,
    required this.description,
  }) : super(key: key) {
    if (date != null) {
      this.date = DateTime.parse(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
        alignment: TimelineAlign.start,
        isFirst: true,
        indicatorStyle: const IndicatorStyle(
          // indicator: ,
          color: Color.fromRGBO(255, 122, 1, 1),
          padding: EdgeInsets.all(10),
          indicatorXY: 0,
        ),
        afterLineStyle: const LineStyle(
          thickness: 2,
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 8),
          child: Container(
            width: double.infinity,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                            ),
                          Text(
                            description,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          if (date != null)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                DateFormat.EEEE().add_jm().format(date!),
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
