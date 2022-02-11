from operator import index
import pandas as pd
import json
import csv
from pandas import json_normalize


def convert_json_to_csv(source_path, table_name):
    chunksize = 10 ** 5

    with pd.read_json(
        path_or_buf=source_path + f'yelp_academic_dataset_{table_name}.json',
        chunksize=chunksize,
        lines=True
    ) as reader:
        for itterate_no, chunk in enumerate(reader):
            base_path=f'/Users/admin/my_projects/dana_test/dataset/csv/{table_name}/'
            filename=f"yelp_academic_dataset_{table_name}_{itterate_no}.csv"
            print(chunk.dtypes)
            chunk.to_csv(
                base_path+filename,
                sep='~',
                index=False,
                escapechar="\\",
                line_terminator='\r\n'
                )
            print(f"[Job Info]: write csv '{filename}'")

table_list = [
    'business',
    'checkin',
    'review'
    'tip',
    'user'
]


json_path = '/Users/admin/my_projects/dana_test/dataset/yelp_dataset/'


for table_name in table_list:

    print(f"[Job Info]: Will convert json file '{table_name}' to csv format")
    convert_json_to_csv(json_path, table_name)
    print(f"[Job Info]: covert file '{table_name}' to csv sucess!")
