## Get SELECT item

```python
cursor.fetchone().get('id')
```

#### Usage example

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
            sql = "SELECT `id` FROM `table` WHERE `text` = %s GROUP BY `id`"
            cursor.execute(sql, ('text'))

            # Get next result (Start as 0)
            result = cursor.fetchone()
            if result != None:
                id = result.get('id')
                return id
            else:
                return None

        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
except Exception as e:
        print('Failed to insert: %s', e)
finally:
        connection.close()
```

[【Python3】MySQL 操作をひと通りマスター！導入方法とCRUDサンプルコード集](https://it-engineer-lab.com/archives/1181)
