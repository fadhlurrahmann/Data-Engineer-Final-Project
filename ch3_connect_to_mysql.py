# import mysql connector
import mysql.connector

# melakukan percobaan koneksi
conn = mysql.connector.connect(
    user='root', password='********', host='localhost', database='db_kalbe')

# Membuat object cursor sebagai penanda
cursor = conn.cursor()

# Deklarasi SQL Query untuk memasukkan record ke DB (karyawan)
insert_sql = (
    "INSERT INTO karyawan (first_name, last_name, age, sex, income)"
    "VALUES (%s, %s, %s, %s, %s)"
)
values = ("Joni", "Saputra", 24, "Male", 1000000)

try:
    # Eksekusi SQL command
    cursor.execute(insert_sql, values)

    # Melakukan perubahan (commit) pada DB
    conn.commit()

    print("Data berhasil ditambahkan!")

except mysql.connector.Error as e:
    print(f'error: {e}')

    if conn.is_connected():
        # Roll back apabila ada issue
        conn.rollback()
        print("Rollback berhasil!")

# Menutup koneksi
conn.close()



