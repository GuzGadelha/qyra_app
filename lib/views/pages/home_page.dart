import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';
import 'package:qyra_app/views/shared/guide_carousel_section.dart';
import 'package:qyra_app/views/shared/q_points_section.dart';

import '../../data/mock_tasks.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../shared/latest_measurement_section.dart';
import '../shared/mission_button.dart';
import '../shared/task_carousel.dart';
import '../shared/welcome_video_card.dart';

/// Main dashboard screen of the application.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = HomeViewModel();

  // Variable to control current active screen index
  int _currentIndex = 0;

  // Controls WelcomeVideoCard visibility
  bool _showWelcomeCard = true;

  // Navigation bar pages list (Commented out for now)
  // final List<Widget> _pages = [ ... ];

  // Function to show "coming soon" snackbar message
  void _showNotImplementedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Essa função ainda não foi implementada, aguarde e confira!"),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //  Get´s user "nickname"
    final String username = _viewModel.getFormattedUsername();

    // Task list data
    final myTasks = MockTasks.getHomeTasks(_showNotImplementedMessage);

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [

              // Scrollable content layer
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Header section
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.s),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // White logo
                          SvgPicture.asset(
                            'assets/images/logo_qyra_branca.svg',
                            width: 70.76,
                            height: 20,
                          ),

                          const SizedBox(height: AppSpacing.xs,),

                          // Salutation text
                          Text(
                            'Olá, $username!',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryPurple,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Welcome video card
                    if (_showWelcomeCard) ...[
                      WelcomeVideoCard(
                        onWatchVideo: _showNotImplementedMessage,
                        onClose: () {
                          setState(() {
                            _showWelcomeCard = false;
                          });
                        },
                      ),
                      const SizedBox(height: AppSpacing.m),
                    ],


                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.s,
                        vertical: AppSpacing.xs,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Aligns titles to the left
                        children: [

                          // Task pane title
                          const Text(
                            "Painel de tarefas",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryPurple,
                            ),
                          ),

                          const SizedBox(height: AppSpacing.s,),

                          // Tasks carousel
                          TaskCarousel(tasks: myTasks),

                          // Q points section
                          QPointsSection(currentPoints: 64),

                          const SizedBox(height: AppSpacing.s,),

                          //  Day Missions
                          //  title
                          const Text(
                            "Missões do dia",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryPurple,
                            ),
                          ),

                          //
                          const SizedBox(height: AppSpacing.s,),

                          //  mission buttons
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Column(
                              children: [
                              MissionButton(
                              icon: Icons.directions_run_outlined,
                              title: "Praticar atividade física",
                              onTap: _showNotImplementedMessage,
                              ),

                              const SizedBox(height: 12),

                              MissionButton(
                                icon: Icons.egg_alt_outlined,
                                title: "Consumir refeições diárias",
                                onTap: _showNotImplementedMessage,
                              ),

                              const SizedBox(height: 12),

                              MissionButton(
                                icon: Icons.medication_outlined,
                                title: "Utilizar prescrições",
                                onTap: _showNotImplementedMessage,
                              ),
                              ],
                            ),
                          ),

                          const SizedBox(height: AppSpacing.s,),

                          // Latest Measurements Section
                          LatestMeasurementsSection(),

                          const SizedBox(height: 12),

                          //  Guide carousel section

                          // Section title
                          const Text(
                            "Guia para uma rotina mais leve",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryPurple,
                            ),
                          ),

                          const SizedBox(height: 16),

                          //  carousel
                          GuideCarouselSection(onCardTap: _showNotImplementedMessage),

                          //  body end
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Fixed top-right buttons layer
              Positioned(
                top: 30,
                right: AppSpacing.m,
                child: Row(
                  children: [
                    // Chat icon with white circular background
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: _showNotImplementedMessage,
                        icon: const Icon(Icons.chat_bubble_outline_rounded),
                        color: AppColors.primaryPurple,
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Notification icon with white circular background
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: _showNotImplementedMessage,
                        color: AppColors.primaryPurple,
                        icon: Badge(
                          backgroundColor: Colors.redAccent,
                          smallSize: 10,
                          child: const Icon(Icons.notifications_none_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      // Bottom navigation bar setup
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 4, bottom: 16),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryPurple,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Início",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_outlined),
              activeIcon: Icon(Icons.file_copy),
              label: "Exames",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication_outlined),
              activeIcon: Icon(Icons.medication_sharp),
              label: "Prescrições",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              activeIcon: Icon(Icons.bar_chart),
              label: "Evolução",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
              label: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}