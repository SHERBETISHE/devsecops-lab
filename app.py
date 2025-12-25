from flask import Flask

app = Flask(__name__)

@app.route("/health")
def health():
    return {"status": "ok"}, 200

if __name__ == "__main__":
    # Мы используем nosemgrep, так как 0.0.0.0 необходим для работы внутри Docker контейнера
    app.run(host="0.0.0.0", port=8080) # nosemgrep: python.flask.security.audit.app-run-param-config.avoid_app_run_with_bad_host
