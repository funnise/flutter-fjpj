import * as admin from "firebase-admin";

admin.initializeApp();
export const firestore = admin.firestore();
export const auth = admin.auth();
export type CollectionReference = admin.firestore.CollectionReference;
export type DocumentReference = admin.firestore.DocumentReference;
export type QuerySnapshot = admin.firestore.QuerySnapshot;
export type DocumentData = admin.firestore.DocumentData;
export const Timestamp = admin.firestore.Timestamp;
export type Transaction = admin.firestore.Transaction;
export const client = new admin.firestore.v1.FirestoreAdminClient();
export const gcpProjectId = admin.installations().app.options.projectId;
export const documentId = admin.firestore.FieldPath.documentId();

export const timestamp = (t: { seconds: number, nanoseconds: number }) => {
  const timestamp = new Timestamp(t.seconds, t.nanoseconds);
  return timestamp;
};
