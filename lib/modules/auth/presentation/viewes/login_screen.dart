import 'package:cochat/core/shared/components/app_colors.dart';
import 'package:cochat/core/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:rive/rive.dart';

import '../helper/animation_states.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtBoard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;
  late RiveAnimationController controllerLookDownRight;
  late RiveAnimationController controllerLookDownLeft;
  late RiveAnimationController controllerLookIdle;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testPhone = 'ahmed.ayman.abdelmoneim5050@smartlytechs.dev';
  String testPass = '123456';
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final passFocusNode = FocusNode();
  bool isLookingLeft = false;
  bool isLookingRight = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerIdle = SimpleAnimation(AnimationStates.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationStates.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationStates.hands_down.name);
    controllerSuccess = SimpleAnimation(AnimationStates.success.name);
    controllerFail = SimpleAnimation(AnimationStates.fail.name);
    controllerLookDownRight = SimpleAnimation(AnimationStates.Look_down_right.name);
    controllerLookDownLeft = SimpleAnimation(AnimationStates.Look_down_left.name);
    controllerLookIdle = SimpleAnimation(AnimationStates.look_idle.name);
    rootBundle.load('assets/rive_images/login_bear.riv').then((data) {
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;
      artBoard.addController(controllerIdle);
      setState(() {
        riveArtBoard = artBoard;
      });
    });
    checkPassFocuNode();
  }

  void removeAllController() {
    riveArtBoard?.artboard.removeController(controllerIdle);
    riveArtBoard?.artboard.removeController(controllerHandsUp);
    riveArtBoard?.artboard.removeController(controllerHandsDown);
    riveArtBoard?.artboard.removeController(controllerSuccess);
    riveArtBoard?.artboard.removeController(controllerFail);
    riveArtBoard?.artboard.removeController(controllerLookDownRight);
    riveArtBoard?.artboard.removeController(controllerLookDownLeft);
    riveArtBoard?.artboard.removeController(controllerLookIdle);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addController(controller) {
    removeAllController();

    if (controller == controllerLookDownLeft) {
      isLookingLeft = true;
    }
    if (controller == controllerLookDownRight) {
      isLookingRight = true;
    }
    riveArtBoard?.artboard.addController(controller);
    debugPrint('current controller is : ${controller.toString()}');
  }

  void checkPassFocuNode() {
    passFocusNode.addListener(() {
      if (passFocusNode.hasFocus) {
        addController(controllerHandsUp);
      } else if (!passFocusNode.hasFocus) {
        addController(controllerHandsDown);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColor2,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: riveArtBoard == null ? const SizedBox.shrink() : Rive(artboard: riveArtBoard!)),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: AppColors.mainColor3,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          textStyle: TextStyle(color: AppColors.mainColor1),
                          controller: phoneController,
                          labelText: 'Email Address',
                          validator: (value) => value == testPhone ? null : 'Wrong Email Address',
                          keyboardType: TextInputType.emailAddress,
                          onChange: (value) {
                            if (value.isNotEmpty) {
                              if (value.length < 16 && !isLookingLeft) {
                                addController(controllerLookDownLeft);
                              } else if (value.length >= 16 && !isLookingRight) {
                                addController(controllerLookDownRight);
                              }
                            } else {
                              addController(controllerLookIdle);
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        CustomTextFormField(
                          textStyle: TextStyle(color: AppColors.mainColor1),
                          controller: passController,
                          labelText: 'Password',
                          validator: (value) => value == testPass ? null : 'Wrong Pass',
                          keyboardType: TextInputType.text,
                          isPassword: true,
                          focusNode: passFocusNode,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 8),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: AppColors.mainColor1,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {
                              passFocusNode.unfocus();
                              Future.delayed(const Duration(milliseconds: 500), () {
                                if (formKey.currentState!.validate()) {
                                  addController(controllerSuccess);
                                } else {
                                  addController(controllerFail);
                                }
                              });
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 20, color: AppColors.mainColor3),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.mainColor1,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Register Now!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.mainColor2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'OR',
                style: TextStyle(color: AppColors.mainColor3, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SignInButton(
                Buttons.FacebookNew,
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
