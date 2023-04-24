import { firestore } from ".";
import { Friend } from "../types/friends";
import { User } from "../types/users";
import * as functions from "firebase-functions";
import { firestore as firestoreAdmin} from 'firebase-admin';

export const setFiretoreUser = async (
  userData: User,
  userId: string | null
) => {
  const userRef = userId
    ? firestore.collection("users").doc(userId)
    : firestore.collection("users").doc();
  userRef.set(userData, { merge: true }).catch((err: Error) => {
    functions.logger.error(`error setFirestoreUser: ${err}`);
    throw err;
  });
};

export const getFirestoreUsers = async () => {
  const usersRef = firestore.collection("users");
  const usersSnapshot = await usersRef.get();
  const users: Array<User &{userId: string}> = [];
  usersSnapshot.forEach((doc) => {
    users.push({userId: doc.id, ...doc.data() as User});
  });
  return users;
}

export const setFirestoreFriend = async (userId: string, friendId: string) => {
  const friendRef = firestore.collection("users").doc(userId).collection("friends").doc(friendId);
  const friendData: Friend = {
    userId: friendId,
    lastMessage: "",
    createAt: firestoreAdmin.Timestamp.now(),
    updateAt: firestoreAdmin.Timestamp.now(),
    isBlocked: false,
    chatId: "",
  }
  friendRef.set(friendData).catch((err: Error) => {
    functions.logger.error(`error setFirestoreFriend: ${err}`);
    throw err;
  });

}
