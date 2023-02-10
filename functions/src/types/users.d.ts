import { firestore } from "firebase-admin";

export type User = {
  email: string;
  name: string;
  createAt: firestore.Timestamp;
  updateAt: firestore.Timestamp;
  isDeleted: boolean;
  gender: 'male' | 'female';
}