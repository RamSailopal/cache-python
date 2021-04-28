#!/usr/bin/python3
import codecs, sys
import intersys.pythonbind3

host="{{ host }}"
port="{{ prt }}"
url = host + "["+port+"]:SAMPLES"
print("Connection string: " + url)

print("Connecting to Cache server")
conn = intersys.pythonbind3.connection( )
conn.connect_now(url, "_SYSTEM", "SYS", None)
print("Connected successfully")
    
print("Creating database")
database = intersys.pythonbind3.database( conn)

print("Opening Sample.Person instance with ID 1 with default concurrency and timeout")
person = database.openid( "Sample.Person", "1", -1, -1)

print("Getting the value of the Name property")
name = person.get("Name")
print("Value: " + name)

print("Test completed successfully")
