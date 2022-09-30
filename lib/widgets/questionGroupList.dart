import 'package:cryptic_hunt/Providers/archive_page_notifier.dart';
import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/Providers/question_screen_notifier.dart';
import 'package:cryptic_hunt/data/question_group.dart';
import 'package:cryptic_hunt/networking/notification_service.dart';
import 'package:cryptic_hunt/screens/question_screen.dart';
import 'package:cryptic_hunt/widgets/emptyList.dart';
import 'package:cryptic_hunt/widgets/progressIndicator.dart';
import 'package:cryptic_hunt/widgets/questionGroupListItem.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class QuestionGroupList extends StatefulWidget {
  QuestionGroupList({super.key, required this.state, this.canTap = true});
  QuestionGroupListNotifier state;
  bool canTap;

  @override
  State<QuestionGroupList> createState() => _QuestionGroupListState();
}

class _QuestionGroupListState extends State<QuestionGroupList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getQuestionGroup());

    super.initState();
  }

  Future<void> getQuestionGroup() async {
    widget.state.getQuestionGroups();
  }

  GestureDetector _detector(
      {required Widget child, required QuestionGroup questionGroup}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => QuestionScreenNotifier(),
                builder: (context, child) => Consumer<QuestionScreenNotifier>(
                  builder: (context, value, child) => QuestionScreen(
                      notifier: value, questionGroupDetailId: questionGroup.id),
                ),
              ),
            )).then((value) => widget.state.getQuestionGroups());
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.state.busy)
        ? Center(
            child: OwlProgressIndicator(),
          )
        : (widget.state is ArchivePageNotifier &&
                widget.state.questionGroups.isEmpty)
            ? const EmptyList(
                title: "No Questions Solved",
                description:
                    "After succesfully solving the questions, they appear here for future reference.",
              )
            : (widget.state.questionGroups.isEmpty)
                ? Center(
                    child: const EmptyList(
                      title: "All Cleared",
                      description: "No question available",
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: getQuestionGroup,
                    child: Scrollbar(
                      controller: ScrollController(),
                      child: ListView.builder(
                        itemCount: widget.state.questionGroups.length,
                        itemBuilder: (context, index) => _detector(
                          questionGroup: widget.state.questionGroups[index],
                          child: QuestionGroupListItem(
                              questionGroup:
                                  widget.state.questionGroups[index]),
                        ),
                      ),
                    ),
                  );
  }
}
