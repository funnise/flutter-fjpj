import { firestore } from ".";
import { User } from "../types/users";
import * as functions from "firebase-functions";

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
