import { Firestore } from "@google-cloud/firestore";

interface PredictionData {
  result: string;
  suggestion: string;
  createdAt: string;
}

export async function storeData(
  id: string,
  data: PredictionData
): Promise<void> {
  const db = new Firestore();
  const predictCollection = db.collection("prediction");
  await predictCollection.doc(id).set(data);
}
