import 'package:flutter/material.dart';
import 'package:qyra_app/models/task_item.dart';
import 'package:qyra_app/views/shared/task_card.dart';

/// A horizontal carousel that displays tasks in grouped pairs.
/// It takes a list of [TaskItem] and organizes them into a [PageView]
/// where each page contains up to two tasks stacked vertically.
class TaskCarousel extends StatelessWidget {
  final List<TaskItem> tasks;

  const TaskCarousel({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {

    //  Logic for grouping tasks in pairs.
    List<List<TaskItem>> groupedTasks = [];
    for(int i = 0; i < tasks.length; i += 2){
      groupedTasks.add(
        tasks.sublist(i, i+2 > tasks.length ? tasks.length : i + 2)
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 260,
      child: PageView.builder(
        controller: PageController(viewportFraction: 1.0),
        itemCount: groupedTasks.length,
        itemBuilder: (context, index) {
          final pair = groupedTasks[index];

          return Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 1),
            child: Column(
              children: [

                //  First task
                TaskCard(
                  imagePath: pair[0].imagePath,
                  title: pair[0].title,
                  subtitle: pair[0].subtitle,
                  actionText: pair[0].actionText,
                  backgroundColor: pair[0].backgroundColor,
                  actionTextColor: pair[0].actionTextColor,
                  onActionTap:pair[0].onActionTap,
                ),

                const SizedBox(height: 12,),

                //  Second task (if it exists)
                if (pair.length > 1)
                  TaskCard(
                    imagePath: pair[1].imagePath,
                    title: pair[1].title,
                    subtitle: pair[1].subtitle,
                    actionText: pair[1].actionText,
                    backgroundColor: pair[1].backgroundColor,
                    actionTextColor: pair[1].actionTextColor,
                    onActionTap: pair[1].onActionTap,
                  ),
              ],
            ),
          );
        }
      ),
    );
}
}
