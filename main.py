# API Documentation
# https://binance-docs.github.io/apidocs/futures/en/#change-log

"""
This file does the following:
1) Initialize the two connectors (Binance & Bitmex)
2) Interface main component
3) Logger object
"""
import tkinter as tk
import logging
# from binance_futures import write_log

logger = logging.getLogger()
logger.setLevel(logging.INFO)
stream_handler = logging.StreamHandler()

# provide format for the message:
formatter = logging.Formatter('%(asctime)s %(levelname)s :: %(message)s')
stream_handler.setFormatter(formatter)
stream_handler.setLevel(logging.INFO)

file_handler = logging.FileHandler('info.log')
file_handler.setFormatter(formatter)
file_handler.setLevel(logging.DEBUG)

logger.addHandler(stream_handler)
logger.addHandler(file_handler)

# configure the logger
logger.debug("This message is important only when debugging the program.")
logger.info("This message just shows basic information.")
logger.warning("This message is about something you should pay attention to.")
logger.error("This message helps to debug an error that occurred in your program.")

# write_log()
# logger.info("This is logged in all cases.")

if __name__ == '__main__':
    # logger.info("This is logged only if we execute the main.py file.")
    root = tk.Tk()
    root.mainloop()

