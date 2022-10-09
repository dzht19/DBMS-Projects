#!/usr/bin/env python
# coding: utf-8

# In[ ]:


from sqlalchemy import create_engine
engine = create_engine('postgres+psycopg2://postgres:Malgrado01@localhost:5432/zhansaya')
connection = engine.connect()


# In[ ]:


from sqlalchemy.sql import text


# In[ ]:


query1 = text("""select disease.disease_code, disease.description 
                from disease
                inner join discover
                on discover.disease_code = disease.disease_code
                where disease.pathogen = 'bacteria' and discover.first_enc_date < date'01-01-1990'""")
connection.execute(query1).fetchall()


# In[ ]:


query2 = text("""select distinct users.name, users.surname, doctor.degree
                from users
                inner join doctor 
                on users.email = doctor.email
                inner join specialize
                on doctor.email = specialize.email
                inner join diseasetype
                on specialize.id = diseasetype.id
                where specialize.email not in (select specialize.email
                                                from specialize
                                                where specialize.id in (select diseasetype.id 
                                                                        from diseasetype
                                                                        where diseasetype.description = 'infectious diseases'))""")
connection.execute(query2).fetchall()


# In[ ]:


query3 =text("""select  users.name, users.surname, doctor.degree
                from users
                inner join doctor 
                on users.email = doctor.email
                inner join specialize
                on doctor.email = specialize.email
                inner join diseasetype
                on specialize.id = diseasetype.id
group by users.name, users.surname, doctor.degree
having count(specialize.email) > 2""")
connection.execute(query3).fetchall()


# In[ ]:


query4 =text("""select  country.cname, avg(users.salary)
                from country
                inner join users  
                on country.cname = users.cname
                inner join specialize
                on users.email = specialize.email
                inner join diseasetype
                on specialize.id = diseasetype.id
                where specialize.id in (select diseasetype.id
                                        from diseasetype
                                        where diseasetype.description = 'virology')
                                        group by country.cname""")
connection.execute(query4).fetchall()


# In[ ]:


query5 =text("""select  publicservant.department, count(publicservant.email)
                from publicservant
                inner join record 
                on publicservant.email = record.email
                where publicservant.email in (select record.email
                                        from record
                                        where record.disease_code = 'covid_19')
group by publicservant.department""")
connection.execute(query5).fetchall()


# In[ ]:


query6 =text("""update users U
                set salary = 2*users.salary
                from users
                inner join record
                on users.email = record.email 
                where users.email in (select record.email 
                                        from record
                                        group by record.email
                                        having count(record.email ) > 3)""")
connection.execute(query6)


# In[ ]:


query7 =text("""delete from Users where surname LIKE '%bek%'""")
connection.execute(query7)


# In[ ]:


query8 =text("""create index "idx pathogen"
                on disease(pathogen)""")
connection.execute(query8)


# In[ ]:


query9 =text("""select users.email, users.name, publicservant.department
                from users
                inner join publicservant
                on users.email = publicservant.email
                inner join record
                on publicservant.email = record.email
                where record.total_patients > 100000 and record.total_patients <999999""")
connection.execute(query9).fetchall()


# In[ ]:


query10 =text("""SELECT cname, sum(total_patients)
                FROM record
                group by cname
                ORDER BY sum(total_patients) DESC
                LIMIT 5""")
connection.execute(query10).fetchall()


# In[ ]:


query11 =text("""SELECT diseasetype.description, sum(record.total_patients)
                FROM diseasetype
                left join disease
                on diseasetype.id = disease.id
                left join record
                on disease.disease_code = record.disease_code
                group by (diseasetype.description)
                
                """)
connection.execute(query11).fetchall()


# In[ ]:





# In[ ]:




