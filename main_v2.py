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
from binance_futures_v2 import BinanceFuturesClient
import keys
import pandas as pd
from datetime import datetime

from bitmex import get_contracts
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

if __name__ == '__main_v2__':
    # logger.info("This is logged only if we execute the main.py file.")

    binance = BinanceFuturesClient(keys.testnet_public_key, keys.testnet_secret_key, True)

    symbols = ["SOLUSDT", "DOTUSDT", "KSMUSDT", "BNBUSDT", "BTCUSDT", "XMRUSDT", "LUNAUSDT"
        , "MANAUSDT", "KLAYUSDT", "FTMUSDT", "AAVEUSDT", "RUNEUSDT", "ETHUSDT", "THETAUSDT"
        , "ONTUSDT", "IOTAUSDT", "ONGUSDT", "XRPUSDT", "CVCUSDT", "BUSDUSDT"
        , "CHZUSDT", "SANDUSDT", "DAIUSDT", "USDTUSDT"]

    df_list = []

    for s in symbols:
        data = binance.get_historical_candles(s, "1d")
        df = pd.DataFrame(data, columns=["symbol", "price", "close_date"])
        df_list.append(df)

    merged = pd.concat(df_list)

    merged['close_date'] = merged['close_date'].astype(int)
    #    merged['close_date'] = datetime.fromtimestamp((merged['close_date']/1000))

#    merged.to_csv('df_merged.csv')




    #    print(binance.get_historical_candles("BTCUSDT", "1d"))
    #    print(binance.get_contracts())

    root = tk.Tk()

    # root.configure(bg="gray12")
    # bitmex_contracts = get_contracts()
    #
    # i = 0
    # j = 0
    #
    # calibri_font = ("Calibri", 25, "normal")
    #
    # for contract in bitmex_contracts:
    #     label_widget = tk.Label(root, text=contract, bg='gray12', fg='SteelBlue1', borderwidth=1, relief=tk.GROOVE, width=13, font=calibri_font)
    #     label_widget.grid(row=i, column=j, sticky='ew')
    #
    #     if i == 4:
    #         j += 1
    #         i = 0
    #     else:
    #         i += 1

    root.mainloop()
