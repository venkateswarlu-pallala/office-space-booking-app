
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:homler/config/appbars/main_appbar.dart';
import 'package:homler/config/themes/app_colors.dart';
import 'package:homler/config/themes/font_styles.dart';
import '../../../../config/elements/button.dart';
import '../../../../config/elements/edit_text.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: Consumer<LoginController>(
        builder: (context, controller, _) {
          return Scaffold(
              // body:ScreenView(
              //   mobile: LoginDesktop(),
              //   tablet: LoginDesktop(),
              //   desktop: LoginDesktop(),
              body: Column(
              children: [
                MainAppbar(),
                 Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "assets/images/home_background.png",
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Card
                      Positioned(
                        left: 80,
                        top: 120,
                        child: Container(
                          width: 633, // EXACT from design
                          padding: const EdgeInsets.fromLTRB(48, 40, 48, 40),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Logo
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  'assets/logos/logo_homler.png',
                                  height: 36,
                                ),
                              ),

                              const SizedBox(height: 32),


                              Text(
                                "Homler Bookings",
                                style: FontStyles.s48Text6,
                              ),

                              const SizedBox(height: 16),

                              // Subtitle
                              Text(
                                "Find and book the perfect commercial seat, cabin,"
                                    "or workspace. Lease or buy with a smooth,"
                                    "transparent, and reliable experience.",
                                style: FontStyles.s14HintW5,
                              ),

                              const SizedBox(height: 32),

                              Row(
                                children: [
                                  // Email Field
                                  Expanded(
                                    child: SizedBox(
                                      height: 48,
                                      child: EditText(
                                        controller:
                                        controller.emailController,
                                        hintText: "Enter your email address",
                                        keyboardType:
                                        TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  // Button
                                  SizedBox(
                                    height: 48,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        AppColors.primaryButtonBg,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: controller.isLoading
                                          ? null
                                          : controller.showOtpField
                                          ? () => controller
                                          .verifyOtp(context)
                                          : () =>
                                          controller.sendOtp(context),
                                      child: controller.isLoading
                                          ? const SizedBox(
                                        width: 20,
                                        height: 5,
                                        child:
                                        CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                          : Text(
                                        controller.showOtpField
                                            ? "Verify OTP"
                                            : "Send OTP",
                                        style:
                                        FontStyles.s22WhiteW5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              if (controller.showOtpField) ...[
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 48,
                                  child: EditText(
                                    controller: controller.otpController,
                                    hintText: "Enter OTP",
                                    keyboardType: TextInputType.number,
                                  ),
                                ),

                              ],
                              Padding(
                                padding:  EdgeInsets.only(top: 8.0),
                                child: Button(
                                   background: Colors.white,
                                  onTap: (){},
                                  text: "Google Login",
                                 style: FontStyles.s16Text5,
                                  prefixIcon:Image.asset("assets/icons/ic_cc.png"),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

