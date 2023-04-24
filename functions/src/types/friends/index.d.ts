import { firestore } from "firebase-admin";

export type Friend = {
  userId: string;
  lastMessage: string;
  createAt: firestore.Timestamp,
  updateAt: firestore.Timestamp,
  isBlocked: boolean,
  chatId: string,
}