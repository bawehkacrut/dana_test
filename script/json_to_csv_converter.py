import pandas as pd
import os
from pathlib import Path


def convert_json_to_csv(source_path, table_name):
    chunksize = 10 ** 5

    with pd.read_json(
        path_or_buf=source_path + f'yelp_academic_dataset_{table_name}.json',
        chunksize=chunksize,
        lines=True
    ) as reader:
        for itterate_no, chunk in enumerate(reader):
            base_path=f'{source_path}csv/{table_name}/'
            filename=f"yelp_academic_dataset_{table_name}_{itterate_no}.csv"
            print(chunk.dtypes)
            print("[Job Info]: Will replace new line char")
            chunk = chunk.replace('\n',' ', regex=True)
            chunk = chunk.replace('\r',' ', regex=True)
            chunk = chunk.replace('~','', regex=True)
            chunk = chunk.replace(r'\\', '', regex=True)
            print("[Job Info]: Eeplace new line char success")
            chunk.to_csv(
                base_path+filename,
                sep='~',
                index=False,
                escapechar="\\",
                header=False
                )
            print(f"[Job Info]: write csv '{filename}'")


if __name__ == '__main__':

    hostname='localhost'
    port=5432
    database_name='dana'
    user='dana'
    password='dana123'
    parent_path = Path().resolve().parent
    json_path=os.path.join(parent_path, "dataset/yelp_dataset/")
    table_list = [
        'business',
        'checkin',
        'review',
        'tip',
        'user'
    ]

    for table_name in table_list:

        print(f"[Job Info]: Will convert json file '{table_name}' to csv format")
        convert_json_to_csv(json_path, table_name)
        print(f"[Job Info]: covert file '{table_name}' to csv sucess!")
