import json
import random
import string
from flask import Flask
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from prometheus_client import make_wsgi_app, Histogram

request_latency_histogram = Histogram('request_latency_hist', "Request latency histogram")

app = Flask(__name__)
app_dispatched = DispatcherMiddleware(app, {
    '/metrics': make_wsgi_app()
})


def random_string(string_length=10):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(string_length))


@app.route('/')
@request_latency_histogram.time()
def handle():
    res = json.dumps({
        "random_string": random_string(random.randint(32, 256))
    })

    return res
