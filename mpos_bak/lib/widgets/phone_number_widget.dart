import 'package:flutter/material.dart';

class PhoneInputManual extends StatefulWidget {
  final void Function(String countryCode, String phoneNumber)? onChanged;

  const PhoneInputManual({super.key, this.onChanged});

  @override
  _PhoneInputManualState createState() => _PhoneInputManualState();
}

class _PhoneInputManualState extends State<PhoneInputManual> {
  String _selectedCode = '+1';
  final List<String> _countryCodes = ['+1', '+44', '+91', '+66'];

  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_notifyParent);
  }

  void _notifyParent() {
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedCode, _phoneController.text);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
          value: _selectedCode,
          onChanged: (val) {
            if (val != null) {
              setState(() {
                _selectedCode = val;
              });
              _notifyParent();
            }
          },
          items:
              _countryCodes
                  .map(
                    (code) => DropdownMenuItem(
                      value: code,
                      child: Text(code, style: TextStyle(fontSize: 16)),
                    ),
                  )
                  .toList(),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
