import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool _anText = false;
    var _formKey = GlobalKey<FormState>();
    String _errorText = '';
    //tạo controler
    TextEditingController myControler = TextEditingController();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              //kiểu bàn phím
              keyboardType: TextInputType.number,

              // ản\hiện kí tự nhập vào
              obscureText: _anText,
              // giới hạn số lượng kí tự nhập vào
              maxLength: 6,

              //maxLines: null, : số dòng tối đa trên textField

              //onChanged: (value) => print(value),: lắng nghe sự thay đổi của textField

              //gán myControler vào thuộc tính controler
              controller: myControler,
              //trang trí
              decoration: InputDecoration(
                //hiện dòng màu đỏ cảnh báo lỗi
                errorText: null,
                //icon bên trong textField góc bên trái
                prefixIcon: const Icon(Icons.security),

                //icon bên trong textField góc bên phải
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _anText = !_anText;
                      print(_anText);
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
                //màu nền textField
                fillColor: Colors.amber,
                filled: true,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //tên textField
                labelText: 'labelText:',
                labelStyle: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),

                //icon bên ngoài textFiled : góc bên trái
                icon: const Icon(Icons.ac_unit),

                //gợi ý ghi textField
                hintText: 'hintText:',
              ),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            Form(
                key: _formKey,
                child: TextFormField(
                  validator: (String? errorText) {
                    if (errorText!.length < 6) {
                      return _errorText = 'kí tự phải lớn hơn 6';
                    }
                  },
                  decoration: InputDecoration(
                    //hiện dòng màu đỏ cảnh báo lỗi
                    errorText: _errorText,
                    //icon bên trong textField góc bên trái
                    prefixIcon: const Icon(Icons.security),

                    //icon bên trong textField góc bên phải
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (myControler.text.length < 6) {
                            _errorText = "kí tự phải lớn hơn 6";
                          }
                          print(_anText);
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                    //màu nền textField
                    fillColor: Colors.amber,
                    filled: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //tên textField
                    labelText: 'labelText:',
                    labelStyle: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),

                    //icon bên ngoài textFiled : góc bên trái
                    icon: const Icon(Icons.ac_unit),

                    //gợi ý ghi textField
                    hintText: 'hintText:',
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
