import * as functions from 'firebase-functions';

export const onCall = {
  test: functions.https.onCall(async(data, context) => {
    return { data, context };
  })
}