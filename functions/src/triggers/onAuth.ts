import { firestore } from 'firebase-admin';
import * as functions from 'firebase-functions';
import { setFiretoreUser } from '../firebase/users';
import { User } from '../types/users';
// import {firestore} from 'firebase-admin';


export const onAuth = {
  createdAuthUser: functions.auth.user().onCreate(async(record) => {
    const uid = record.uid;
    const email = record.email;
    const userData: User = {
      name: '',
      email: email ? email : '',
      createAt: firestore.Timestamp.now(),
      updateAt: firestore.Timestamp.now(),
      gender: 'male',
      isDeleted: false
    }
    setFiretoreUser(userData, uid);
  })
}