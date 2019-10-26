import hashlib
import random
import time
from flask import Flask

app = Flask(__name__)


def encrypt_string(hash_string):
    sha_signature = \
        hashlib.sha256(hash_string.encode()).hexdigest()
    return sha_signature


def get_random_cycle_count():
    return random.randint(7 * 10 ** 3, 10 ** 4)


class timer:
    def __enter__(self):
        print("Started counting time...")
        self.start = time.time()

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"TOTAL TIME: {time.time() - self.start}")


@app.route('/')
def handle():
    res = "i am dumpty string"
    for i in range(get_random_cycle_count()):
        res = encrypt_string(res)

    return res


if __name__ == '__main__':
    app.run()
