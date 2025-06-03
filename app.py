from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '''
    <html>
        <head>
            <title>Fancy Flask App</title>
            <style>
                @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap');

                body {
                    margin: 0;
                    padding: 0;
                    height: 100vh;
                    background: linear-gradient(135deg, #6e8efb, #a777e3);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    font-family: 'Poppins', sans-serif;
                    color: white;
                }

                .fancy-box {
                    text-align: center;
                    padding: 40px;
                    border-radius: 15px;
                    background: rgba(255, 255, 255, 0.1);
                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    backdrop-filter: blur(10px);
                    -webkit-backdrop-filter: blur(10px);
                    border: 1px solid rgba(255, 255, 255, 0.18);
                    animation: fadeIn 2s ease-in-out;
                }

                .glow-text {
                    font-size: 3em;
                    color: #fff;
                    text-shadow: 0 0 5px #fff,
                                 0 0 10px #fff,
                                 0 0 20px #ff00de,
                                 0 0 30px #ff00de,
                                 0 0 40px #ff00de,
                                 0 0 55px #ff00de,
                                 0 0 75px #ff00de;
                }

                @keyframes fadeIn {
                    from { opacity: 0; transform: translateY(-20px); }
                    to { opacity: 1; transform: translateY(0); }
                }
            </style>
        </head>
        <body>
            <div class="fancy-box">
                <div class="glow-text">🚀 Hello there! 🌍</div>
                <p>Welcome to your super fancy Flask app.</p>
            </div>
        </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

