import 'package:e_voting_app/resource/auth_methods.dart';
import 'package:e_voting_app/router/app_screens.dart';
import 'package:e_voting_app/router/app_screens_ext.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:e_voting_app/widgets/input_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);


  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {

  final _isLoadingProvider = StateProvider<int>((ref) => 0);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('eVoting Registration'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              const Text('Enter the 4-digit code you received.'),
              SizedBox(height: 20.h),
              const InputStyle(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Verification Code',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.verified)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              InputStyle(
                child: TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Enter your name',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              InputStyle(
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Enter your email',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              InputStyle(
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              InputStyle(
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Consumer(
                builder: (context, ref, child) {
                  int isLoading = ref.watch(_isLoadingProvider);
                  return BtnElevated(
                      isLoading: isLoading == 1 ? true : false,
                      child: const Text('Continue'),
                      onPressed: () {
                        String email = _emailController.text;
                        String name = _nameController.text;
                        String password = _passwordController.text;
                        String cPassword = _confirmPasswordController.text;
                        if (name.isNotEmpty) {
                          if (email.isNotEmpty) {
                            if (password.isNotEmpty) {
                              if (cPassword.isNotEmpty) {
                                if (password == cPassword) {
                                  _createAccountFunc(ref, email, password, name);
                                } else {
                                  toast('password and confirm password does not match.', Icons.block_sharp);
                                }
                              } else {
                                toast('confirm password is required', Icons.cancel);
                              }
                            } else {
                              toast('password is required', Icons.cancel);
                            }
                          } else {
                            toast('email is required', Icons.cancel);
                          }
                        } else {
                          toast('name is required', Icons.cancel);
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

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void toast(String msg, IconData icon) {
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: Theme.of(context).colorScheme.inverseSurface,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(msg,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary
              ),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  void _createAccountFunc(WidgetRef ref, String email, String password, String name) async {
    ref.read(_isLoadingProvider.notifier).state = 1;
    String res = await AuthMethods().createAccount(
        email: email,
        password: password,
        name: name
    );
    ref.read(_isLoadingProvider.notifier).state = 0;
    if (res == 'success') {
      if(!mounted) return;
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text("Registration"),
              content: const Text('Your registration was successful!'),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Future.delayed(const Duration(seconds: 1), () => context.go('/${AppScreens.home.toPath}'));
                  },
                )
              ],
            );
          }
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text("Registration"),
              content: Text(res),
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
  }
}
