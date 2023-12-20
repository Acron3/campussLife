import 'dart:convert';
import 'package:campuss_life/app/data/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class FirestoreDb {
  static login(String username, String password) async {
    try {
      var cred_email = username.toString() + '@campuife.com';
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: cred_email.trim(),
        password: password,
      );
      String? userId = userCredential.user?.uid;

      DocumentReference docRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      DocumentSnapshot snapshot = await docRef.get();
      var data = snapshot.data();
      return {'data': data, 'cred': userCredential.user};
      // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      //     .collection('users')
      //     .where('username', isEqualTo: username)
      //     .get();

      // if (querySnapshot.docs.isNotEmpty) {
      //   UserModel userDoc =
      //       UserModel.fromSnapshot(documentSnapshot: querySnapshot.docs[0]);
      //   String? storedHashedPassword = userDoc.password;
      //   String hashedPassword =
      //       sha256.convert(utf8.encode(password)).toString();

      //   var cred_email = userDoc.nipd.toString() + '@campuife.com';
      //   print(cred_email);
      //   if (storedHashedPassword == hashedPassword) {
      //     UserCredential userCredential =
      //         await FirebaseAuth.instance.signInWithEmailAndPassword(
      //       email: cred_email.trim(),
      //       password: hashedPassword,
      //     );
      //     return {'data': userDoc, 'cred': userCredential.user};
      //   } else {
      //     print('Invalid password');
      //   }
      // } else {
      //   print('User not found');
      // }
      // return null;
    } catch (e) {
      return "Nomor Induk atau Password salah";
    }
  }

  static registerUser(UserModel user, String password) async {
    try {
      var cred_email = user.nipd.toString() + '@campuife.com';
      // Register the user in Firebase Authentication
      print("cred_email : " + cred_email);
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: cred_email.trim(),
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'Nama': user.nama,
        'NIPD': user.nipd,
        'PT': user.pt,
        'Prodi': user.prodi,
      });

      return {
        'id': userCredential.user?.uid,
        'email': userCredential.user?.email,
        'nama': user.nama
      };
    } catch (e) {
      var res = e.toString().split('] ')[1];
      return res;
    }
  }

  static logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    print('User logged out successfully');
  }

  // static Stream<List<UserModel>> userStream() {
  //   return firebaseFirestore
  //       .collection('users')
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<UserModel> users = [];
  //     for (var user in query.docs) {
  //       final userModel = UserModel.fromSnapshot(documentSnapshot: user);
  //       users.add(userModel);
  //     }
  //     return users;
  //   });
  // }

  // static Stream<List<UserModel>> getUser(String npm, String password) {
  //   return firebaseFirestore
  //       .collection('users')
  //       .where('NIPD', isEqualTo: npm)
  //       .where('Password', isEqualTo: password)
  //       .limit(1)
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<UserModel> users = [];
  //     for (var user in query.docs) {
  //       final userModel = UserModel.fromSnapshot(documentSnapshot: user);
  //       users.add(userModel);
  //     }
  //     return users;
  //   });
  // }

  // static deleteUser(String userId) {
  //   firebaseFirestore.collection('users').doc(userId).delete();
  // }
}
