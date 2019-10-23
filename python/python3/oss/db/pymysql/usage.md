## Usage

```python
connection = pymysql.connect(host=self.mysql_host,
                             port=self.port,
                             user=self.mysql_user,
                             password=self.mysql_password,
                             db=self.mysql_db,
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

try:
        with connection.cursor() as cursor:

        """DO YOUR OPERATIONS"""

        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
except Exception as e:
        print('Failed to insert: %s', e)
finally:
        connection.close()
```

[PyMySQL/PyMySQL](https://github.com/PyMySQL/PyMySQL/)
