class ValidationMixin{
  String emailValidator(String str){
    if(str.lastIndexOf('@')==-1)return 'Please provide valid email';
    return null; 
  }

  String passwordValidator(String str){
    if(str.length<5)return 'Please provide a strong password';
    return null;
  }
}