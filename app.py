from flask import Flask, jsonify, requests

app = Flask(__name__)

items = [
    {"id": 1, "name": "Clavier"},
    {"id": 2, "name": "Souris"},
    {"id": 3, "name": "Écran"}
]

@app.route("/", methods=["GET"])
def hello_world():
    return jsonify({"message" : "Hello World !!"})

@app.route("/items", methods=["GET"])
def get_items():
    return jsonify(items)

@app.route("/items", methods=["POST"])
def add_item():
    data = request.get_json()

    if not data :
        return jsonify({"error" : "Aucune donnée JSON reçue"}), 400

    items.append(data)

    return jsonify({
        "message" : "Nouvel item ajouté avec succès",
        "item" : data
    }) , 201

if __name__ == "__main__" :
    app.run(host=0.0.0.0, port=5000)

