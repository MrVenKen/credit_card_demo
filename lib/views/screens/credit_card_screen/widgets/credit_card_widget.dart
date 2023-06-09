import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../controllers/creditcard_controller.dart';
import '../../../../core/constant/responsive_builder.dart';
import '../../../../core/themes/app_theme.dart';


class CreditCard extends StatefulWidget {
  CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  CreditCardService creditCardService = Get.put(CreditCardService());

  @override
  Widget build(BuildContext context) {
    double cardWidth = 8.56;
    double cardHeight = 5.398;

    double chipWidth = 1.00;
    double chipHeight = 1.00;

    double nameWidth = 3.50;
    double nameHeight = 0.69;

    double ratio = cardWidth / cardHeight;

    double chipRatio = chipWidth / chipHeight;

    double nameRatio = nameWidth / nameHeight;

    height() {
      if (ResponsiveBuilder.isDesktop(context)) {
        return (MediaQuery.of(context).size.width / 2.5) / ratio;
      } else if (ResponsiveBuilder.isMobile(context)) {
        return MediaQuery.of(context).size.width / ratio;
      } else if (ResponsiveBuilder.isTablet(context)) {
        return (MediaQuery.of(context).size.width / 1.5) / ratio;
      }
    }

    width() {
      if (ResponsiveBuilder.isDesktop(context)) {
        return MediaQuery.of(context).size.width / 2.5;
      } else if (ResponsiveBuilder.isMobile(context)) {
        return MediaQuery.of(context).size.width;
      } else if (ResponsiveBuilder.isTablet(context)) {
        return MediaQuery.of(context).size.width / 1.5;
      }
    }

    return SizedBox(
      height: height(),
      width: width(),
      child: AspectRatio(
        aspectRatio: ratio,
        child: Container(
          padding: ResponsiveBuilder.isMobile(context)
              ? const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                )
              : EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,
                  vertical: Get.height * 0.01,
                ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppTheme().grey,
                  AppTheme().grey,
                  AppTheme().white,
                  AppTheme().grey,
                  AppTheme().grey,
                ]),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: SizedBox(
                  height: Get.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Credit Card",
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              ResponsiveBuilder.isMobile(context) ? 15.0 : 33.0,
                          color: AppTheme().beyaz,
                        ),
                      ),
                      Flexible(
                        child: Image(
                          width: ResponsiveBuilder.isMobile(context)
                              ? 120
                              : Get.width * 0.15,
                          fit: BoxFit.cover,
                          image: AssetImage(
                            creditCardService.detectBankFromNumber(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: AspectRatio(
                  aspectRatio: chipRatio,
                  child: Container(
                    margin: EdgeInsets.only(right: Get.width * 0.01),
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/payment/card_chip.png'),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: Get.width,
                        ),
                        child: AutoSizeText(
                          creditCardService.bufferCardNumber.toString(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 4,
                            fontSize: ResponsiveBuilder.isMobile(context)
                                ? 40.0
                                : 60.0,
                            color: AppTheme().beyaz,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                      child: Column(
                        children: [
                          AutoSizeText(
                            "VALID",
                            style: TextStyle(
                              color: AppTheme().beyaz,
                              fontWeight: FontWeight.w400,
                              fontSize: ResponsiveBuilder.isMobile(context)
                                  ? 10.0
                                  : 20.0,
                            ),
                          ),
                          AutoSizeText(
                            "THRU",
                            style: TextStyle(
                              color: AppTheme().beyaz,
                              fontWeight: FontWeight.w400,
                              fontSize: ResponsiveBuilder.isMobile(context)
                                  ? 10.0
                                  : 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText(
                      "${creditCardService.cardMonth}/${creditCardService.cardYear}",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppTheme().beyaz,
                        fontWeight: FontWeight.w400,
                        fontSize:
                            ResponsiveBuilder.isMobile(context) ? 16.0 : 35.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: nameRatio,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: Get.width * 0.05,
                        ),
                        child: AutoSizeText(
                          creditCardService.customerName,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                          softWrap: false,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: ResponsiveBuilder.isMobile(context)
                                ? 20.0
                                : 30.0,
                            color: AppTheme().beyaz,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: ResponsiveBuilder.isMobile(context)
                          ? EdgeInsets.only(
                              right: Get.width * 0.015,
                            )
                          : const EdgeInsets.all(0),
                      child: Image(
                        image: AssetImage(
                          creditCardService.detectCardType(),
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
    );
  }
}
