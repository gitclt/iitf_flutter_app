import 'package:flutter/material.dart';
import 'package:iitf_flutter_tab/app/common_widgets/svg_icons/svg_widget.dart';
import 'package:iitf_flutter_tab/app/constants/colors.dart';

class CommonButton extends StatelessWidget {
  final Function onClick;
  final String label;
  final bool isLoading;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? bgColor;
  const CommonButton({
    super.key,
    required this.onClick,
    required this.label,
    this.isLoading = false,
    this.fontSize,
    this.width,
    this.height,
    this.borderRadius = 5.0,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () {
                onClick();
              },
        // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            elevation: 2.0,
            textStyle: const TextStyle(color: Colors.white)),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    label,
                    style: const TextStyle(fontSize: 16),
                  )),
      ),
    );

    // return InkWell(
    //   onTap: isLoading
    //       ? null
    //       : () {
    //           onClick();
    //         },
    //   child: Container(
    //     width: width ?? MediaQuery.of(context).size.width,
    //     height: height ?? MediaQuery.of(context).size.height * 0.06,
    //     decoration: BoxDecoration(
    //         color: AppColor.primaryColor,
    //         borderRadius: BorderRadius.circular(5)),
    //     child: Center(
    //         child: isLoading
    //             ? const CircularProgressIndicator(
    //                 color: Colors.white,
    //               )
    //             : whiteText(label, fontSize: fontSize)),
    //   ),
    // );
  }
}

class SmallIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  final Color? color;
  final double size;
  final String toolmessage;
  const SmallIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.color,
    this.size = 20,
    required this.toolmessage,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: svgWidget(icon, size: size),
      ),
    );
  }
}
