import 'package:flutter/material.dart';
import '../../DartFilesForPages/HelperScreen/components/welcome03.dart';
import '../../DartFilesForPages/HelperScreen/components/center_next_button.dart';
import '../../DartFilesForPages/HelperScreen/components/welcome04.dart';
import '../../DartFilesForPages/HelperScreen/components/Welcome02.dart';
import '../../DartFilesForPages/HelperScreen/components/welcome01.dart';
import '../../DartFilesForPages/HelperScreen/components/top_back_skip_view.dart';
import '../../DartFilesForPages/HelperScreen/components/welcome05.dart';


class HelperScreen extends StatefulWidget {
  const HelperScreen({Key? key}) : super(key: key);

  @override
  _HelperScreenState createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> with TickerProviderStateMixin {

  bool isAuth = false;
  bool isLoading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
  }


  AnimationController? _animationController;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ClipRect(
                  child: Stack(
                    children: [
                      Welcome01(
                        animationController: _animationController!,
                      ),
                      Welcome02(
                        animationController: _animationController!,
                      ),
                      Welcome03(
                        animationController: _animationController!,
                      ),
                      Welcome_04(
                        animationController: _animationController!,
                      ),

                      WelcomeView.Welcome_05(
                        animationController: _animationController!,
                      ),
                      TopBackSkipView(
                        onBackClick: _onBackClick,
                        onSkipClick: _onSkipClick,
                        animationController: _animationController!,
                      ),
                      CenterNextButton(
                        animationController: _animationController!,
                        onNextClick: _onNextClick,
                      ),
                    ],
                  ),
                ),
              ),

        ],
      ),

    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() async{
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
    }
  }


}
