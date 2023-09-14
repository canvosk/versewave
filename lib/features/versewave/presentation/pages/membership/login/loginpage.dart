part of loginpage_view;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ParagraphContainer(),
        ],
      ),
    );
  }
}


