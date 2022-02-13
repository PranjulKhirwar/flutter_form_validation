mixin ValidationMixin {
  String? validateEmail(value){
      if(!value!.contains('@')){
        return "Invalid Email Address";
      }
      return null;
   }
   String? validatePassword(value){
     if(value!.length < 4){
       return 'Invalid password';
     }
     return null;
   }
}