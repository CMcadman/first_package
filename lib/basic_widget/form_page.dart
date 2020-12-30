import 'package:first_harry/utils/as_sizebox.dart';
import 'package:flutter/material.dart';

class ASFromPage extends StatefulWidget {
  @override
  _ASFromPageState createState() => _ASFromPageState();
}

class _ASFromPageState extends State<ASFromPage> {
  var _account = '';
  var _password = '';
  final _formKey = GlobalKey<FormState>();

  var _value = '足球';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单'),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ASSizeBox(),
          TextFormField(
            decoration: InputDecoration(
              labelText: '账号:',
              labelStyle: TextStyle(color: Colors.blue),
              hintText: '输入账号',
              helperText: '账号最少6个字符',
              icon: Icon(
                Icons.account_box,
                color: Colors.blue,
              ),
              prefixIcon: Icon(
                Icons.ac_unit,
                color: Colors.blue,
              ),
              fillColor: Theme.of(context).accentColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
            ),
            onSaved: (newValue) {
              _account = newValue;
            },
            validator: (value) {
              return value.length >= 6 ? null : '账号最少6个字符';
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: '密码:',
              labelStyle: TextStyle(color: Colors.red),
              hintText: '输入密码',
              helperText: '密码最少8个字符',
              icon: Icon(
                Icons.book,
                color: Colors.red,
              ),
              suffixIcon: Icon(
                Icons.panorama_fish_eye,
                color: Colors.red,
              ),
            ),
            obscureText: true,
            onSaved: (newValue) {
              _password = newValue;
            },
            validator: (value) {
              return value.length >= 8 ? null : '密码最少8个字符';
            },
          ),
          ASSizeBox(),
          RaisedButton(
            child: Text('登录'),
            onPressed: () {
              validate();
            },
          ),
          SizedBox(
            height: 60,
          ),
          DropdownButtonFormField(
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text('足球'),
                value: '足球',
              ),
              DropdownMenuItem(
                child: Text('篮球'),
                value: '篮球',
              ),
              DropdownMenuItem(
                child: Text('羽毛球'),
                value: '羽毛球',
              ),
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),
      onWillPop: () async {
        return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('提示'),
              content: Text('确认退出吗?'),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('取消'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('确定'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void validate() {
    final _state = _formKey.currentState;
    if (_state.validate()) {
      _state.save();
      print('账号：$_account，密码：$_password 去登录');
    }
  }
}
