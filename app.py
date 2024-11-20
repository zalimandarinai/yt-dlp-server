from flask import Flask, request, jsonify
import subprocess
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return "App is running!", 200

@app.route('/download', methods=['POST'])
def download_video():
    youtube_url = request.json.get('url')
    output_dir = "/tmp/videos"
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, "%(title)s.%(ext)s")
    cookies_path = "/app/cookies.txt"  # Path to cookies file on Render

    try:
        # Run yt-dlp with cookies for authentication
        subprocess.run(
            [
                "yt-dlp",
                "--cookies", cookies_path,
                "--ffmpeg-location", "/usr/bin/ffmpeg",
                youtube_url,
                "-o", output_path
            ],
            check=True
        )
        return jsonify({"message": "Download successful", "path": output_path}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    # Trigger Docker deployment (added comment to force redeployment)
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
