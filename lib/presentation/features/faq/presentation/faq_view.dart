import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/faq/presentation/notifier/check_faq_notifier.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_response.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class FaqView extends StatefulWidget {
  const FaqView({super.key});
  static const String routeName = '/faqView';

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  LoginResponse? response;

  @override
  void initState() {
    getFaqList();
    super.initState();
  }

  getFaqList() async {
    final loginResponse = await SecureStorage().getLoginResponse();

    setState(() {
      response = loginResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    final faqList = response?.data?.faq ?? [];
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'FAQS',
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Check out some of our most asked questions',
              style: context.textTheme.s16w500.copyWith(
                color: AppColors.primary1C1C1C,
              ),
            ),
            const VerticalSpacing(22),
            Expanded(
              child: ListView.builder(
                  itemCount: faqList.length,
                  itemBuilder: (_, index) {
                    final data = faqList[index];
                    return FaqWidget(
                      title: '${data.title}',
                      onTap: () {},
                      subTitle: '${data.description}',
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class FaqWidget extends StatelessWidget {
  const FaqWidget(
      {super.key, required this.title, this.onTap, required this.subTitle});
  final String title;
  final String subTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, c) {
      final faqCheck =
          ref.watch(checkFaqNotifier.select((v) => v.faqQuestionLevel));
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.s14w600.copyWith(
                    color: AppColors.primary494949,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  ref.read(checkFaqNotifier.notifier).changeFaq(title);
                },
                child: const Icon(
                  Icons.add,
                  color: AppColors.primary292D32,
                ),
              )
            ],
          ),
          const VerticalSpacing(15),
          if (faqCheck == title)
            Text(
              subTitle,
              style: context.textTheme.s14w400.copyWith(
                color: AppColors.primary494949,
              ),
            ),
          const VerticalSpacing(20),
        ],
      );
    });
  }
}
