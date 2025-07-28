from fastapi import FastAPI
import numpy as np
from pydantic import BaseModel

app = FastAPI()


class InputData(BaseModel):
    data: list[float]


class DummyModel:
	def predict(self, data):
		return np.dot(np.array(data), np.array([2, 3])) # simple linear function

model = DummyModel()

@app.get("/")
def read_root():
	return {"message": "this is root page"}

@app.post("/predict")
def predict(data: InputData):
	prediction = model.predict(data.data)
	return {"prediction": prediction.tolist()}

