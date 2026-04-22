import pytest
from app import app

@pytest.fixture
def client_app():
    with app.test_client() as client:
        with app.app_context():
            yield client

def test_hello(client_app):
    res = client_app.get("/")
    assert res.status_code == 200

def test_items(client_app):
    res = client_app.get("/items")
    assert res.status_code == 200

