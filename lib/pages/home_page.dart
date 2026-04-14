import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';

import '../shared/welcome_video_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  Variable to control which screen is the user, basically index
  int _currentIndex = 0;

  //  Controls if WelcomeVideoCard show's itself
  bool _showWelcomeCard = true;

  //  Navigation bar pages list
  final List<Widget> _pages = [
    const Center(child: Text("Tela de inicio (home)")),
    const Center(child: Text("Tela de exames")),
    const Center(child: Text("Tela de prescricoes")),
    const Center(child: Text("Tela de evolucao")),
    const Center(child: Text("Tela de perfil")),
  ];

  // Function to show "em breve" message
  void _showNotImplementedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Essa função ainda não foi implementada, aguarde e confira!"),
        duration: Duration(seconds: 2), // Message time on screen
        behavior: SnackBarBehavior.floating, // creates a pop-up
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // body
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.m,
                        vertical: AppSpacing.s,
                      ),

                      //  Column to keep salutation and logo inside
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //  White qyra logo
                          SvgPicture.asset(
                            'assets/images/logo_qyra_branca.svg',
                          ),

                          //  space
                          const SizedBox(height: AppSpacing.xs),

                          //  salutation
                          const Text(
                            'Olá, Priscila!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryPurple,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Screen scrollable content
                    if (_showWelcomeCard) ...[
                      WelcomeVideoCard(
                        onWatchVideo: _showNotImplementedMessage,
                        onClose: () {
                          setState(() {
                            _showWelcomeCard = false;
                          });
                        },
                      ),

                      //  space
                      const SizedBox(height: AppSpacing.m),
                    ],
                  ],
                ),
              ),

              // Fixed buttons
              Positioned(
                top: 30,
                right: AppSpacing.m,
                child: Row(
                  children: [
                    //  Chat icon
                    IconButton(
                      onPressed: _showNotImplementedMessage,
                      icon: const Icon(Icons.chat_bubble_outline_rounded),
                      color: AppColors.primaryPurple,
                    ),

                    //  Notification icon
                    IconButton(
                      onPressed: _showNotImplementedMessage,
                      color: AppColors.primaryPurple,

                      //  red circle
                      icon: Badge(
                        backgroundColor: Colors.redAccent,
                        smallSize: 10,
                        child: const Icon(Icons.notifications_none_rounded),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      //  Bottom navBar setup
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