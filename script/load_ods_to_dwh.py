import os
import logging
from pathlib import Path
from helpers.postgres_helper import PostgresHelper


if __name__ == '__main__':

    hostname='localhost'
    port=5432
    database_name='dana'
    user='dana'
    password='dana123'
    parent_path = Path().resolve().parent
    ddl_path=os.path.join(parent_path, "dana_test/sql/dwh")
    
    table_lists = [
        'dim_business',
        'dim_user',
        'dim_weather',
        'fact_review'
    ]
    # create table in DB and load data to table
    logging.info("[Job info]: will load data to DB")
    for table in table_lists:
        for table_name, df in table.items():
            logging.info(f"[Job info]: will create table {table_name} if not exist in DB")
            PostgresHelper.load_table(
                table_name,
                hostname,
                port,
                database_name,
                user,
                password,
                ddl_path
                )
            logging.info(f"[Job info]: create table {table_name} success!")
