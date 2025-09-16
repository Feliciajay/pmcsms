import 'package:flutter/material.dart';
import 'package:pmcsms/presentation/features/fund_wallet/presentation/components/fund_account_validation_screen.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen(
      {super.key, required this.paymentUrl, required this.transactionId});
  final String paymentUrl;
  final String transactionId;

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  late WebViewController controller;
  bool isLoading = true;
  double loadingProgress = 0.0;

  @override
  void initState() {
    super.initState();
    loadWebView();
  }

  loadWebView() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.paymentUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingProgress = progress / 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
            if (url.contains('dlr/monnify.php?paymentReference')) {
              // Use Future.delayed to ensure proper navigation
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FundAccountValidationScreen(
                    transactionId: widget.transactionId,
                  ),
                ),
              );
            }
          },

          //dlr/monnify.php?paymentReference

          onNavigationRequest: (request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {
            Navigator.pop(context);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: loadingProgress,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Loading... ${loadingProgress.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
