class ErrorInputData {
  String? errorInputEmail(String email) {
    final bool _isFormatEmail = email.contains('@') && email.contains('.');
    if (email == '') {
      return 'Bạn Chưa Nhập Email';
    } else if (!_isFormatEmail) {
      return 'Định Dạng Không Đúng';
    }
    return null;
  }

  String? errorInputPass(String pass) {
    final bool _isFormatpass = pass.length < 8 ||
        pass.contains(RegExp(r'[A-Z]')) ||
        pass.contains(RegExp(r'[a-z]'));

    if (pass == '') {
      return 'Bạn Chưa Nhập pass';
    } else if (_isFormatpass) {
      return 'Mật khẩu phải có ít nhất 8 ký tự, có chữ hoa và chữ thường';
    }
    return null;
  }
}
