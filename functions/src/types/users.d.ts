import { firestore } from "firebase-admin";

export type User = {
  userId: string
  email: string;
  name: string;
  createAt: firestore.Timestamp;
  updateAt: firestore.Timestamp;
  isDeleted: boolean;
  gender: 'male' | 'female';
}