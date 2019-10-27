import hashlib
import json
import random
import string
import time
from flask import Flask
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from prometheus_client import Summary, make_wsgi_app

request_summary = Summary('request_time_summary', 'Request-by-time summary')

app = Flask(__name__)
app_dispatched = DispatcherMiddleware(app, {
    '/metrics': make_wsgi_app()
})


def random_string(string_length=10):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(string_length))


def encrypt_string(hash_string):
    sha_signature = hashlib.sha256(hash_string.encode()).hexdigest()
    return sha_signature


def get_random_cycle_count():
    return random.randint(7 * 10 ** 2, 10 ** 3)


@app.route('/')
@request_summary.time()
def handle():
    # res = random_string(random.randint(10 * 3, 10 * 4))
    # for i in range(get_random_cycle_count()):
    #     res = encrypt_string(res)
    time.sleep(random.uniform(0.05, 0.7))

    res = json.dumps({"list": [1, 2, 3, 4, 5, 6]})

    return res
