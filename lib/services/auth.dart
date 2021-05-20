import 'package:firebase_auth/firebase_auth.dart';
import 'package:lms_app/models/user.dart';
import 'package:lms_app/services/database.dart';

class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user
  MyUser _userFromFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth stream
  
  Stream<MyUser> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }


  //sign in anon
  Future SignInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
        }
      }
      
        //sign in em pw
        Future signInWithEmailAndPassword(String email, String password) async{
          try{
            UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
            User user = result.user;
            
            return _userFromFirebaseUser(user);
          }catch(e){
            print(e.toString());
            return null;
          }
        }
        
        //sign up with email n password
        Future registerWithEmailAndPassword(String email, String password) async{
          try{
            UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            User user = result.user;

            //create a new document when user registers
            await DatabaseService(uid: user.uid).updateUserPersonalData('name', 'dept', 'phone', 12, 19, 6);

            return _userFromFirebaseUser(user);
          }catch(e){
            print(e.toString());
            return null;
          }
        }
        
      
        //sign out
        Future signOut() async{
          try{
            return await _auth.signOut();
          }catch(e){
            print(e.toString());
            return null;
          }
        }
      }
      