from dotenv import load_dotenv
import os
load_dotenv()
API_KEY = os.getenv("API_KEY")

from telegram import Update 
from telegram.ext import CommandHandler, ApplicationBuilder, ContextTypes
import subprocess




async def saludo(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text("Hola! ¿Cómo estás?")

async def scan(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    domain = context.args[0]
    resultados = subprocess.run(["./recon.sh", domain], capture_output=True, text=True, check=True)
    await update.message.reply_text(resultados.stdout)

def main():
    app= ApplicationBuilder().token(API_KEY).build()
    app.add_handler(CommandHandler("saludo", saludo))
    app.add_handler(CommandHandler("scan", scan))
    print("ON")
    app.run_polling()

if __name__ == "__main__":
    main()
