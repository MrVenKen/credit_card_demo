import 'package:auto_size_text/auto_size_text.dart';
import 'package:detect_bank_from_card/views/screens/credit_card_screen/widgets/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/creditcard_controller.dart';
import '../../../core/constant/responsive_builder.dart';
import '../../../core/themes/app_theme.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  CreditCardService creditCardService = Get.put(CreditCardService());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: ResponsiveBuilder.isMobile(context)
              ? const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                  bottom: 0,
                )
              : EdgeInsets.only(
                  left: Get.width * 0.02,
                  right: Get.width * 0.02,
                  top: Get.height * 0.01,
                  bottom: 0,
                ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreditCard(),
              Container(
                padding: ResponsiveBuilder.isMobile(context)
                    ? EdgeInsets.only(
                        left: 10,
                        top: Get.height * 0.01,
                        right: 10,
                      )
                    : EdgeInsets.only(
                        left: Get.width * 0.25,
                        right: Get.width * 0.25,
                        top: Get.height * 0.05,
                        bottom: 0,
                      ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Name-Surname
                    Container(
                      margin: EdgeInsets.only(
                        bottom: Get.height * 0.01,
                      ),
                      height: Get.height * 0.06,
                      width: ResponsiveBuilder.isDesktop(context)
                          ? Get.width * 0.24
                          : Get.width,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(120),
                        ],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 0,
                            top: 0,
                            bottom: 5,
                          ),
                          labelText: "Name-Surname",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          creditCardService.customerName = value;
                          setState(() {});
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isNull) {
                            return "Empty field";
                          }
                          final regex = RegExp(
                              r'^[a-zA-ZığüşöçİĞÜŞÖÇ]+ [a-zA-ZığüşöçİĞÜŞÖÇ]+$');
                          if (!regex.hasMatch(value!)) {
                            return "Invalid name";
                          }
                          return null;
                        },
                      ),
                    ),
                    //Card Number
                    Container(
                      margin: EdgeInsets.only(
                        bottom: Get.height * 0.01,
                      ),
                      height: Get.height * 0.06,
                      width: ResponsiveBuilder.isDesktop(context)
                          ? Get.width * 0.24
                          : Get.width,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(22),
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            var text = newValue.text;
                            //Getting Card number value before input formatter
                            creditCardService.cardNumber = newValue.text;

                            if (newValue.selection.baseOffset == 0) {
                              return newValue;
                            }
                            var buffer = StringBuffer();
                            for (int i = 0; i < text.length; i++) {
                              buffer.write(text[i]);
                              var nonZeroIndex = i + 1;
                              if (nonZeroIndex % 4 == 0 &&
                                  nonZeroIndex != text.length) {
                                buffer.write('  ');
                              }
                            }
                            var string = buffer.toString();
                            return newValue.copyWith(
                                text: string,
                                selection: TextSelection.collapsed(
                                    offset: string.length));
                          }),
                        ],
                        maxLines: 1,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 0,
                            top: 0,
                            bottom: 5,
                          ),
                          labelText: "Card Number",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            creditCardService.bufferCardNumber = value;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isNull || value!.isEmpty) {
                            return "Empty field";
                          }
                          return null;
                        },
                      ),
                    ),
                    //Expiration Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Month
                        Flexible(
                          child: Container(
                            height: Get.height * 0.06,
                            constraints: BoxConstraints(
                              maxWidth: ResponsiveBuilder.isDesktop(context)
                                  ? Get.width * 0.1
                                  : Get.width * 0.24,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, right: 0, top: 0, bottom: 5),
                                labelText: "Month",
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  creditCardService.cardMonth = value;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isNull) {
                                  return "Empty field";
                                }
                                final regex = RegExp(r'^(0[1-9]|1[012])$');
                                if (!regex.hasMatch(value!)) {
                                  return "Invalid Month";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //Year
                        Flexible(
                          child: Container(
                            height: Get.height * 0.06,
                            constraints: BoxConstraints(
                              maxWidth: ResponsiveBuilder.isDesktop(context)
                                  ? Get.width * 0.1
                                  : Get.width * 0.24,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, right: 0, top: 0, bottom: 5),
                                labelText: "Year",
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(
                                  () {
                                    creditCardService.cardYear = value;
                                  },
                                );
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isNull || value!.isEmpty) {
                                  return "Empty field";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //CVV
                        Flexible(
                          child: Container(
                            height: Get.height * 0.06,
                            constraints: BoxConstraints(
                              maxWidth: ResponsiveBuilder.isDesktop(context)
                                  ? Get.width * 0.1
                                  : Get.width * 0.24,
                            ),
                            child: TextFormField(
                              obscureText: true,
                              obscuringCharacter: "*",
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, right: 0, top: 0, bottom: 5),
                                labelText: 'CVV',
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isNull || value!.isEmpty) {
                                  return "Empty field";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Amount
                    Container(
                      margin: EdgeInsets.only(
                        top: Get.height * 0.01,
                      ),
                      height: Get.height * 0.06,
                      width: ResponsiveBuilder.isDesktop(context)
                          ? Get.width * 0.24
                          : Get.width,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 5),
                          labelText: "Amount",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            creditCardService.amount = double.parse(value);
                            creditCardService.cent =
                                (creditCardService.amount! * 100).toInt();
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isNull) {
                            return "Empty field";
                          }
                          final regex =
                              RegExp(r'^\d{1,9}(\.\d{1,9})*(\.\d{2})?$');
                          if (!regex.hasMatch(value!)) {
                            return "Invalid amount";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width * 0.3,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  AppTheme().blue,
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    Get.dialog(creditCardService.posWidget());
                                  });
                                }
                              },
                              child: const AutoSizeText(
                                "Pay",
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
