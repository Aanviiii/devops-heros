from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import parse_qs, urlparse

from app.calculator import add, divide, multiply, subtract

OPS = {"add": add, "subtract": subtract, "multiply": multiply, "divide": divide}


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        url = urlparse(self.path)
        if url.path == "/health":
            return self.reply(200, "OK")
        op = url.path.strip("/")
        if op not in OPS:
            return self.reply(200, "Session 16 Calculator - try /add?a=10&b=5")
        q = parse_qs(url.query)
        try:
            result = OPS[op](float(q["a"][0]), float(q["b"][0]))
            self.reply(200, f"{op}({q['a'][0]}, {q['b'][0]}) = {result}")
        except (KeyError, ValueError) as e:
            self.reply(400, f"Error: {e}")

    def reply(self, code, body):
        self.send_response(code)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write((body + "\n").encode())


if __name__ == "__main__":
    print("Calculator server on :8000", flush=True)
    HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
