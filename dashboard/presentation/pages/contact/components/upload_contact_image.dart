import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class UploadContactImage extends ConsumerStatefulWidget {
  const UploadContactImage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadContactImageState();
}

class _UploadContactImageState extends ConsumerState<UploadContactImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          radius: const Radius.circular(20),
          padding: const EdgeInsets.all(30),
          color: AppColors.primaryE8E8E8,
          strokeCap: StrokeCap.round,
          // width: double.infinity,
          // decoration: BoxDecoration(
          //   color: AppColors.primaryE8E8E8.withOpacity(0.31),
          //   borderRadius: BorderRadius.circular(9),
          //   border: Border.all(
          //     color: AppColors.primaryE8E8E8,
          //     width: 1.5,
          //   ),
          // ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/upload_image.svg'),
                  const VerticalSpacing(5),
                  RichText(
                      text: TextSpan(
                          text: 'Upload your file here ',
                          style: context.textTheme.s14w600.copyWith(
                            color: AppColors.primary676767,
                          ),
                          children: [
                        TextSpan(
                          text: 'browse',
                          style: context.textTheme.s14w600.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        )
                      ])),
                  const VerticalSpacing(5),
                  Text(
                    'Max. File size: 20 MB',
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primary909090,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const VerticalSpacing(20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          decoration: BoxDecoration(
              color: AppColors.primaryE1F5FF,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 18,
                      width: 18,
                      child: Image.asset('assets/images/info.png')),
                  const HorizontalSpacing(8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                          text:
                              'Please note that the uploaded file should be in the necessary format. I.e Full name, Phone number and email(optional)',
                          style: context.textTheme.s12w400
                              .copyWith(color: AppColors.primary494949),
                          children: [
                            TextSpan(
                              text: ' Download template',
                              style: context.textTheme.s12w400.copyWith(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
