part of 'widgets.dart';

class InputSimple extends StatelessWidget {
  final ValueSetter saveValue;
  final int minLines;
  final int maxLines;
  final String? Function(String?)? validator;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;

  const InputSimple({
    required this.saveValue,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
    this.onTap,
    this.controller,
  });

  void defaultTap() => {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autocorrect: false,
        onSaved: saveValue,
        onChanged: saveValue,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          hintStyle: const TextStyle(color: C_APP_COLOR, fontSize: 15),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: C_APP_COLOR),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: C_APP_COLOR),
              borderRadius: BorderRadius.circular(5)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: C_APP_COLOR),
              borderRadius: BorderRadius.circular(5)),
          errorMaxLines: 1,
        ),
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        onTap: onTap,
      ),
    );
  }
}
