import 'tabIconData.dart';
import 'package:flutter/material.dart';
import 'fitness_app_theme.dart';
import '/Pages/PredictionScreen/PredictionScreen.dart';

class PredictorPage extends StatefulWidget {
  const PredictorPage({Key? key}) : super(key: key);


  @override
  _PredictorPageState createState() => _PredictorPageState();
}

class _PredictorPageState extends State<PredictorPage>
    with TickerProviderStateMixin {

  _PredictorPageState({Key? key});

  ThemeData get theme => Theme.of(context);
  bool isDarkTheme = false;

  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController, isDarkTheme: isDarkTheme,);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = theme.brightness == Brightness.dark;
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Stack(
          children: [
            MyDiaryScreen(animationController: animationController, isDarkTheme: isDarkTheme),
          ],
        ),
      ),
    );
  }
}
