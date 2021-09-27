final createTable = '''
  CREATE TABLE contact(
    id INT PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
  )
''';

final insert1 = '''
  INSERT INTO contact(nome, telefone, email, url_avatar)
  VALUES('Coruja','(01) 6001','coruja@gmail.com','https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_960_720.jpg')
''';

final insert2 = '''
  INSERT INTO contact(nome, telefone, email, url_avatar)
  VALUES('Fox','(01) 6023','fox@gmail.com','https://cdn.pixabay.com/photo/2016/12/05/11/39/fox-1883658_960_720.jpg')
''';

final insert3 = '''
  INSERT INTO contact(nome, telefone, email, url_avatar)
  VALUES('Lion','(04) 6010','lion@gmail.com','https://cdn.pixabay.com/photo/2017/10/25/16/54/african-lion-2888519_960_720.jpg')
''';
