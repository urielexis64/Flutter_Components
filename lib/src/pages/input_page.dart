import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';

  String _selectedOption = 'Fly';

  List<String> _powers = ['Fly', 'X Ray', 'Teleport'];

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /* timeDilation = 2.5; */
    return Scaffold(
      appBar: AppBar(title: Text('Inputs')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPasswordField(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letters: ${_name.length}'),
          labelText: "Name",
          helperText: "Only your name",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letters: 0'),
          labelText: "Email",
          helperText: "Your email address",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _createPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letters: 0'),
          labelText: "Email",
          helperText: "Your email address",
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _createDate(buildContext) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letters: 0'),
          labelText: "Birth date",
          helperText: "Your birth date",
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showRoundedDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'),
        imageHeader: NetworkImage(
            'https://i.pinimg.com/originals/77/90/cc/7790ccc06dc3a75bd99dba04bd96d49c.jpg'));

    if (picked != null) {
      setState(() {
        _date = picked.toString().split(' ')[0];
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = List();

    _powers.forEach((power) {
      list.add(DropdownMenuItem(child: Text(power), value: power));
    });

    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 20),
        Expanded(
          child: DropdownButton(
            items: getDropdownOptions(),
            onChanged: (value) => {
              setState(() {
                _selectedOption = value;
              })
            },
            value: _selectedOption,
          ),
        ),
      ],
    );
  }
}
