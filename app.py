from flask import Flask, request, jsonify
import subprocess
import os

app = Flask(__name__)

@app.route('/download', methods=['POST'])
def download_video():
    youtube_url = request.json.get('url')
    output_dir = "/tmp/videos"
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, "%(title)s.%(ext)s")

    try:
        # Run yt-dlp to download the video
        subprocess.run(
            ["yt-dlp", youtube_url, "-o", output_path],
            check=True
        )
        return jsonify({"message": "Download successful", "path": output_path}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
