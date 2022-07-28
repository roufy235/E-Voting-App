import 'package:e_voting_app/resource/firestore_methods.dart';
import 'package:e_voting_app/router/app_screens.dart';
import 'package:e_voting_app/router/app_screens_ext.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:e_voting_app/widgets/input_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class InitRegScreen extends StatefulWidget {
  const InitRegScreen({Key? key}) : super(key: key);

  @override
  State<InitRegScreen> createState() => _InitRegScreenState();
}

class _InitRegScreenState extends State<InitRegScreen> {

  final _isLoadingProvider = StateProvider<int>((ref) => 0);
  final _errorTextProvider = StateProvider<String>((ref) => '');

  final TextEditingController _matricNoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _matricNoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matric No Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              SvgPicture.asset('assets/svg/message_sent.svg',
                width: 100.w,
                height: 100.w,
              ),
              SizedBox(height: 30.h),
              const Text('A 4-digit verification code will be sent to the email attached to this matric number.'),
              SizedBox(height: 20.h),
              Consumer(
                builder: (context, ref, child) {
                  String errorStr = ref.watch(_errorTextProvider);
                  return InputStyle(
                    child: TextField(
                      onChanged: (value) {
                        if (value.isNotEmpty && errorStr.isNotEmpty) {
                          ref.read(_errorTextProvider.notifier).state = '';
                        }
                      },
                      controller: _matricNoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Enter your Matric No',
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.verified),
                          errorText: errorStr.isEmpty ? null : errorStr
                      ),
                    ),
                  );
                }
              ),
              SizedBox(height: 20.h),
              Consumer(
                builder: (context, ref, child) {
                  int isLoading = ref.watch(_isLoadingProvider);
                  return BtnElevated(
                      isLoading: isLoading == 1 ? true : false,
                      child: const Text('Continue'),
                      onPressed: () async {
                        if (_matricNoController.text.isNotEmpty) {
                          String matricNo = _matricNoController.text;
                          ref.read(_isLoadingProvider.notifier).state = 1;
                          bool responseBool = await FirestoreMethods().matricNoVerification(matricNo);
                          ref.read(_isLoadingProvider.notifier).state = 0;
                          if (responseBool) {
                            if(!mounted) return;
                            context.go('/${AppScreens.welcome.toPath}/${AppScreens.initReg.toPath}/${AppScreens.reg.toPath}');
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: const Text("Verification"),
                                    content: const Text('Matric no verification failed!'),
                                    actions: [
                                      TextButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                      )
                                    ],
                                  );
                                }
                            );
                          }
                        } else {
                          ref.read(_errorTextProvider.notifier).state = 'Please enter your matric no';
                        }
                      }
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
