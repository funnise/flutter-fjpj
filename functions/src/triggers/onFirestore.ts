import * as functions from 'firebase-functions';
import { getFirestoreUsers, setFirestoreFriend } from '../firebase/users';

export const onFirestore = {
  onCreateUser: functions.firestore.document('users/user').onCreate(async (snapshot, context) => {
    const userId = context.params.userId;
    //　生成されたuserIdを全てのuserコレクションは以下のfriendsに追加する
    const users = await getFirestoreUsers();
    // 自分のfriendsに全てのuserのIdを追加する
    if(users.length > 0 ){
      users.forEach(user => {
        if(user.userId !== userId){
          setFirestoreFriend(user.userId, userId);
          setFirestoreFriend(userId, user.userId);
        }
      })
    }
  }),
}