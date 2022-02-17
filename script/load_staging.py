import glob, os
import logging
from pathlib import Path
from helpers.postgres_helper import PostgresHelper


if __name__ == '__main__':

    hostname='localhost'
    port=5432
    database_name='dana'
    user='dana'
    password='dana123'
    schema='staging'
    parent_path = Path().resolve().parent

    tbls = [
        'checkin',
        'business',
        'review'
        'tip',
        'user',
        'temperature',
        'precipitation'
        ]

    dataset_path=os.path.join(parent_path, "dana_test/dataset/csv/")

    logging.info("Process: will construct every tables from json")
    for tbl in tbls:
        csv_path = dataset_path+f'{tbl}/'
        csv_pattern = os.path.join(csv_path, '*.csv')
        file_list = glob.glob(csv_pattern)

        for file in file_list:
            print(f"[Job Info]: Will write file '{file}' to Postgre")
            table_name = '{}.{}'.format(schema, tbl)
            PostgresHelper.load_to_postgres(
                file,
                table_name,
                hostname,
                port,
                database_name,
                user,
                password
                )

