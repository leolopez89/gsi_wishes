part of 'widgets.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: MA_APP_COLOR,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
