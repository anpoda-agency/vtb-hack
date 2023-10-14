import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtb_hack/features/core_widgets/auth_custom_button_widget.dart';
import 'package:vtb_hack/features/core_widgets/auth_custom_text_button_widget.dart';
import 'package:vtb_hack/features/core_widgets/custom_textfield_auth_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool onCardNumber = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF3F7FA),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('images/icons/logo.svg'),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x4CCACED0),
                    blurRadius: 13,
                    offset: Offset(6, 6),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x4CCACED0),
                    blurRadius: 13,
                    offset: Offset(-6, -6),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 30, 32, 30),
                child: Column(
                  children: [
                    //Text('HELLO'),
                    /* 
                    CustomButtonAuthWidget(
                      onPressed: () {},
                      buttonLabel: 'Вход по QR',
                      buttonLabelColor: const Color(0xFF5786CE),
                      backgroundColor: const Color(0xFFF3F7FA),
                      widthPadding: 0,
                    ),
                     */
                    AuthCustomButtonWidget(
                      text: 'Вход по QR',
                      textColor: const Color(0xFF5786CE),
                      backgroundColor: const Color(0xFFF3F7FA),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: SvgPicture.asset('images/icons/qrcode.svg'),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            splashColor: const Color(0xFFF3F7FA),
                            highlightColor: const Color(0xFFF3F7FA),
                            onTap: () {
                              //onCardNumber = true;
                              setState(() {
                                onCardNumber = true;
                              });
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Column(
                              //mainAxisSize: MainAxisSize.max,
                              //mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  textAlign: TextAlign.center,
                                  'По номеру карты',
                                  style: TextStyle(
                                    color: Color(0xFF1A1D22),
                                    fontSize: 13,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    height: 0.08,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                onCardNumber
                                    ? SvgPicture.asset('images/icons/cardleft.svg')
                                    : SvgPicture.asset('images/icons/loginleft.svg'),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: const Color(0xFFF3F7FA),
                            highlightColor: const Color(0xFFF3F7FA),
                            onTap: () {
                              //onCardNumber = false;
                              setState(() {
                                onCardNumber = false;
                              });
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: Column(
                              //mainAxisSize: MainAxisSize.max,
                              //mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  textAlign: TextAlign.center,
                                  'По логину',
                                  style: TextStyle(
                                    color: Color(0xFF1A1D22),
                                    fontSize: 13,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    height: 0.08,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                onCardNumber
                                    ? SvgPicture.asset('images/icons/cardright.svg')
                                    : SvgPicture.asset('images/icons/loginright.svg'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomTextFieldAuthWidget(
                      hintText: onCardNumber ? 'Номер карты' : 'Логин',
                      inputType: TextInputType.number,
                    ),
                    /* 
                    CustomButtonAuthWidget(
                      onPressed: () {},
                      buttonLabel: 'Продолжить',
                      buttonLabelColor: Colors.white,
                      backgroundColor: const Color(0xFFF3F7FA),
                      widthPadding: 0,
                    ),
                     */
                    AuthCustomButtonWidget(
                      text: 'Продолжить',
                      textColor: Colors.white,
                      //backgroundColor: const Color(0xFFF3F7FA),
                      linearGradient: const LinearGradient(
                        begin: Alignment(1.00, -0.02),
                        end: Alignment(-1, 0.02),
                        colors: [
                          Color(0xFF0184FE),
                          Color(0xFF0037FF),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    AuthCustomButtonWidget(
                      text: 'Не могу войти',
                      textColor: const Color(0xFF5786CE),
                      backgroundColor: const Color(0xFFF3F7FA),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Если возникли вопросы, воспользуйтесь ',
                        style: TextStyle(
                          color: Color(0xFF1A1D22),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                AuthCustomTextButton(
                  onTap: () {},
                  text: 'подсказкой',
                  endIcon: Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: SizedBox(width: 12, height: 12, child: SvgPicture.asset('images/icons/questionmark.svg')),
                  ),
                ),
                /* 
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'подсказкой',
                        style: TextStyle(
                          color: Color(0xFF5786CE),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
