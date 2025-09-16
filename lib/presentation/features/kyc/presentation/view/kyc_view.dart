import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmcsms/core/extensions/text_theme_extension.dart';
import 'package:pmcsms/core/theme/app_colors.dart';
import 'package:pmcsms/data/data/local_data_source/local_storage_impl.dart';
import 'package:pmcsms/presentation/features/login/data/model/login_response.dart';
import 'package:pmcsms/presentation/general_widgets/custom_app_bar.dart';
import 'package:pmcsms/presentation/general_widgets/spacing.dart';

class KycView extends ConsumerStatefulWidget {
  const KycView({super.key});
  static const String routeName = '/kyc';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KycViewState();
}

class _KycViewState extends ConsumerState<KycView> {
  LoginResponse? _loginResponse;
  double kycLevel = 0;

  @override
  void initState() {
    getResponse();
    getUserKycStatus();
    super.initState();
  }

  getResponse() async {
    _loginResponse = await SecureStorage().getLoginResponse();
  }

  getUserKycStatus() {
    if (_loginResponse?.data?.kyc?.isNinVerified == 'yes' &&
        _loginResponse?.data?.kyc?.isBvnVerified == 'yes') {
      setState(() {
        kycLevel = 1;
      });
    } else if (_loginResponse?.data?.kyc?.isNinVerified == 'yes' ||
        _loginResponse?.data?.kyc?.isBvnVerified == 'no') {
      setState(() {
        kycLevel = 0.5;
      });
    } else if (_loginResponse?.data?.kyc?.isNinVerified == 'no' ||
        _loginResponse?.data?.kyc?.isBvnVerified == 'yes') {
      setState(() {
        kycLevel = 0.5;
      });
    } else {
      setState(() {
        kycLevel = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'KYC',
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 15.h,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryE6E6E6,
                  ),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(8),
                    value: kycLevel,
                    color: AppColors.primaryF9BC1F,
                  ),
                ),
                const HorizontalSpacing(20),
                Text(
                  '${(kycLevel * 100).toInt()}%',
                  style: context.textTheme.s14w500.copyWith(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            const VerticalSpacing(25),
            Expanded(
              child: ListView.builder(itemBuilder: (_, index) {
                return Container();
              }),
            )
          ],
        ),
      )),
    );
  }
}

class KycTypeWidget extends StatelessWidget {
  const KycTypeWidget({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
        decoration: const BoxDecoration(color: AppColors.primaryF5F7F9),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: AppColors.black,
                  )),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                        color: AppColors.black, shape: BoxShape.circle),
                  ),
                ),
                const HorizontalSpacing(16),
                SvgPicture.asset(icon)
              ],
            ),
          ],
        ));
  }
}
