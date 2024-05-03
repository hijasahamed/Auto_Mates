import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key,required this.emailController,required this.passwordController,required this.formkey,required this.screenSize}); 
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey formkey;
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter email';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(color: Color(0xFF424141),fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 86, 86, 86),fontWeight: FontWeight.normal),
                    fillColor: const Color(0xFFDBEDF5),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder( 
                      borderSide: BorderSide(color: Colors.white),                                
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),                    
                    ),
                  ),
            ),
            SizedBox(height: screenSize.height/50,),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if(value!.isEmpty){
                  return 'Please enter Password';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(color: Color(0xFF424141),fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 86, 86, 86),fontWeight: FontWeight.normal),                    
                    fillColor: const Color(0xFFDBEDF5),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder( 
                      borderSide: BorderSide(color: Colors.white),                                
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),                    
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}