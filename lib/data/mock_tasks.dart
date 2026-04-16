import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/models/task_item.dart';


/// Mock data repository for UI development.
/// Simulates the response from a REST API or a local database.
class MockTasks {
  static List<TaskItem> getHomeTasks(VoidCallback defaultAction) {

    /// Returns the list of daily tasks displayed on the Home Page.
    /// The [defaultAction] callback is injected by the View to handle tap events.
    return [

      //  Task 1, exams
      TaskItem(
        title: "Você tem uma nova solicitação de exame",
        subtitle: "Lembre-se: quanto antes fizer, mais cedo você evolui. ",
        imagePath: 'assets/images/task_exams.png',
        actionText: "Ver pedidos de exames",
        backgroundColor: const Color(0xFFF2F5F6),
        actionTextColor: const Color(0xFFA88274),
        onActionTap: defaultAction,
      ),

      // task 2 nutrition
      TaskItem(
        title: "Agende a sua teleorientação nutricional",
        subtitle: "Hora de criar uma estratégia que se encaixe na sua realidade e sem metas impossíveis.",
        imagePath: 'assets/images/task_nutrition.png',
        actionText: "Agendar teleorientação",
        backgroundColor: AppColors.lightGrey,
        actionTextColor: const Color(0xFFDAD5DD),
        onActionTap: defaultAction,
      ),
    ];
  }
}