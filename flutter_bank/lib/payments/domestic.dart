import 'package:flutter/material.dart';
import 'package:flutter_bank/common/dropdown.dart';

import 'models/user.dart';

class DomesticPage extends StatefulWidget {
  const DomesticPage({Key? key}) : super(key: key);

  @override
  State<DomesticPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<DomesticPage> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Domestic Payments"),
        ),
        body: (width <= 600) ? formMobileContainer() : formWebContainer());
  }

  formMobileContainer() {
    return const DropdownItem(label: 'A banme', values: ['1mobile', '2mobile']);
  }

  formWebContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(
            builder: (context) => Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Account number'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your account number';
                                      }
                                    },
                                    onSaved: (val) => {
                                          if (val != null)
                                            {
                                              setState(() =>
                                                  _user.accountNumber = val),
                                            }
                                        })),
                          ),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Beneficiary Name'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your beneficiary name .';
                                        }
                                      },
                                      onSaved: (val) => {
                                            if (val != null)
                                              {
                                                setState(() =>
                                                    _user.beneficiaryName = val)
                                              }
                                          })))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                        child: const DropdownItem(
                            label: 'A banme', values: ['1web', '2web', '3web']),
                      ),
                      SwitchListTile(
                          title: const Text('Monthly Newsletter'),
                          value: _user.newsletter,
                          onChanged: (bool val) =>
                              setState(() => _user.newsletter = val)),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                        child: Text('Interests'),
                      ),
                      CheckboxListTile(
                          title: const Text('Cooking'),
                          value: _user.passions[User.PassionCooking],
                          onChanged: (val) {
                            setState(() =>
                                _user.passions[User.PassionCooking] = val);
                          }),
                      CheckboxListTile(
                          title: const Text('Traveling'),
                          value: _user.passions[User.PassionTraveling],
                          onChanged: (val) {
                            setState(() =>
                                _user.passions[User.PassionTraveling] = val);
                          }),
                      CheckboxListTile(
                          title: const Text('Hiking'),
                          value: _user.passions[User.PassionHiking],
                          onChanged: (val) {
                            setState(
                                () => _user.passions[User.PassionHiking] = val);
                          }),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: RaisedButton(
                              onPressed: () {
                                final form = _formKey.currentState;
                                if (form!.validate()) {
                                  form.save();
                                  _user.save();
                                  _showDialog(context);
                                }
                              },
                              child: Text('Save'))),
                    ]))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
