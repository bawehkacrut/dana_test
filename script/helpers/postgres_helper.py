
import psycopg2
import logging
import pandas as pd
import csv
from io import StringIO

class PostgresHelper:


    @staticmethod
    def extract_source_table(db_connection, query):
        """Extract data from source table"""

        df = pd.read_sql(sql=query, 
                                con=db_connection)
        return df

    @staticmethod
    def get_db_connection(hostname, port, database, user, password):
        try :
            connection = psycopg2.connect(host=hostname,
                                        port=port,
                                        database=database,
                                        user=user,
                                        password=password
                                        )
            return connection
        except Exception as e:
            logging.info("Catch Exception: {}".format(str(e)))
            raise Exception

    @staticmethod
    def load_table(
        table_name,
        hostname,
        port,
        database_name,
        user,
        password,
        ddl_source_path=None
    ):

        # get db_connection
        db_connection = PostgresHelper.get_db_connection(hostname,
                                            port,
                                            database_name,
                                            user,
                                            password)

        cur = db_connection.cursor()

        print("[Job info]: Table '{}' not found in database".format(table_name))
        
        with(
            open(f"{ddl_source_path}/{table_name}.sql", "r")
        ) as f:
            create_table_statement = f.read()
            f.close()

        try:
            print("[Job info]: Will creating table with table name: {}\n with statement {}" \
                .format(table_name,create_table_statement))
            cur.execute(create_table_statement)
            db_connection.commit()
            cur.close()
            print("[Job info]: Creating table {} Success!!".format(table_name))
        except (Exception, psycopg2.DatabaseError) as e:
            raise Exception('Catch exception while creating table: {}'.format(str(e))) 
        finally:
            if db_connection is not None:
                db_connection.close()
    

    @staticmethod
    def load_to_postgres(
        df,
        table,
        hostname,
        port,
        database_name,
        user,
        password
        ):
        """
        Save the dataframe in memory
        and use copy_from() to copy it to the table
        """

        db_connection = PostgresHelper.get_db_connection(hostname,
                                            port,
                                            database_name,
                                            user,
                                            password)


        f = open(df, 'r')
        
        cursor = db_connection.cursor()
        try:
            cursor.copy_from(f, table, sep="~")
            f.close()
            db_connection.commit()
            print("[Job info]: load data to table '{}' done".format(table))
        except (Exception, psycopg2.DatabaseError) as error:
            print("[Job info]: Error: {}".format(error))
            db_connection.rollback()
            cursor.close()
            raise Exception
        cursor.close()