part of 'widgets.dart';

/// Dropdown widget
/// 
/// A widget with outline colored borders
class DropdownSimple extends StatelessWidget {
  final ValueSetter saveValue;
  final int minLines;
  final int maxLines;
  final Function? validator;
  final String value;
  final List<String> items;

  const DropdownSimple({
    required this.saveValue,
    required this.value,
    required this.items,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          hintStyle: const TextStyle(color: cAppColor, fontSize: 15),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cAppColor),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: cAppColor),
              borderRadius: BorderRadius.circular(5)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: cAppColor),
              borderRadius: BorderRadius.circular(5)),
          errorMaxLines: 1,
          counterText: '',
        ),
        value: value,
        items: List.generate(
          this.items.length,
          (index) => DropdownMenuItem(
            child: Text(this.items[index]),
            value: this.items[index],
            key: Key(this.items[index]),
          ),
        ),
        onChanged: saveValue,
        validator: (value) {
          if (validator != null) return validator!(value);
          return null;
        },
      ),
    );
  }
}
