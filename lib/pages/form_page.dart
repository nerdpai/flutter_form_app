import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_hw/pages/form_page/unified_from.dart';
import 'package:flutter_application_hw/substring_extension.dart';
import 'package:flutter_application_hw/user.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late UserData userData;

  @override
  void initState() {
    userData = UserData();

    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneController = TextEditingController();

  void _phoneOnChange(String value) {
    if (value.isNotEmpty) {
      String plus = value.contains('+') ? '+' : '';
      String? countryCode;
      String? phoneNumber;
      final String numbers = value.replaceAll('+', '');

      for (int i = numbers.length > 4 ? 4 : numbers.length; i > 0; i--) {
        String probablyCode = numbers.substring(0, i);
        bool wasFind = Countries.values
            .map((e) => e.phoneCode.toString())
            .any((element) => element == probablyCode);
        if (wasFind) {
          countryCode = probablyCode;
          phoneNumber = numbers.substring(i);
          plus = '+';
        }
      }

      if (phoneNumber != null) {
        String firstPart = phoneNumber.substringWithOverflow(0, 3);
        String secondPart = phoneNumber.substringWithOverflow(3, 6);
        if (secondPart.isNotEmpty) {
          firstPart = '$firstPart ';
        }
        String remaining = phoneNumber.substringWithOverflow(6);
        if (remaining.isNotEmpty) {
          secondPart = '$secondPart ';
        }
        phoneNumber = '$firstPart$secondPart$remaining';
      }
      String finalNumbers =
          countryCode == null ? numbers : '$countryCode $phoneNumber';

      _phoneController.text = '$plus$finalNumbers';
    }
  }

  String? validateNumber(String? value) {
    if (value != null && value.isNotEmpty) {
      final components = value.split(' ');
      if (components.length == 4 && components[3].length == 3) {
        return null;
      }
    }

    return 'Invalid phone number';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _countryController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(
      height: 16,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register Page',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.height / 2),
              child: ListView(
                shrinkWrap: true,
                children: [
                  UnifiedFormField(
                    label: 'Your name',
                    controller: _nameController,
                    onSaved: (value) => userData.name = value,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                  ),
                  divider,
                  UnifiedFormField(
                    label: 'Country',
                    controller: _countryController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ],
                  ),
                  divider,
                  UnifiedFormField(
                    label: 'Your phone number',
                    controller: _phoneController,
                    onSaved: (value) => userData.phoneNumber = value!,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                    ],
                    onChanged: _phoneOnChange,
                    validator: validateNumber,
                  ),
                  divider,
                  TextButton(
                    onPressed: () {
                      _formKey.currentState?.validate();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
