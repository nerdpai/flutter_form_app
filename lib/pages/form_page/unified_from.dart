import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnifiedFormField extends StatefulWidget {
  const UnifiedFormField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<UnifiedFormField> createState() => _UnifiedFormFieldState();
}

class _UnifiedFormFieldState extends State<UnifiedFormField> {
  late String _currentLabel;

  final _key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _currentLabel = widget.label;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      key: _key,
      cursorWidth: 2.0,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        labelText: _currentLabel,
      ),
      onSaved: widget.onSaved,
      onChanged: (value) {
        if (_currentLabel != widget.label && value.isEmpty) {
          setState(() {
            _currentLabel = widget.label;
            _key.currentState!.reset();
            widget.controller.text = '';
          });
        }
        widget.onChanged?.call(value);
      },
      validator: widget.validator == null
          ? null
          : (value) {
              String? errorText = widget.validator!(value);
              setState(() {
                if (errorText != null) {
                  _currentLabel = errorText;
                } else {
                  _currentLabel = widget.label;
                }
              });
              return errorText;
            },
    );
  }
}
