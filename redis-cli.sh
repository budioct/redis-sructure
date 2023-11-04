# Redis Data Structure
# Tiap jenis Struktur Data memiliki kegunaan masing-masing, sehingga kita bisa gunakan pada kasus-kasus yang berbeda untuk tiap struktur data

# Struktur Data     Keterangan
# Lists             Struktur data Linked List yang berisi data string
# Sets              Koleksi data string yang tidak berurut
# Hashes            Struktur data key-value
# Sorted            Sets Struktur data seperti Sets, namun berurut
# Stream            Struktur data seperti log yang selalu bertambah dibelakang
# Geospatial        Struktur data koordinat
# HyperLogLog       Struktur data untuk melakukan estimasi kardinalitas dari Set



# Lists
# Lists adalah struktur data berupa Linked List yang berisi data string
# Lists mirip seperti Array, dimana tiap data yang terdapat di Lists memiliki nomor index
# Lists biasa digunakan untuk membuat Queue (antrian) atau Stack (tumpukan)

# list sebagai queue
localhost:6379> lpush queue "budhi"
(integer) 1
localhost:6379> lpush queue "oct"
(integer) 2
localhost:6379> lpush queue "malik"
(integer) 3
localhost:6379> lrange queue 0 2
1) "malik"
2) "oct"
3) "budhi"
localhost:6379>

# hapus queue list (urutan) fifo
localhost:6379> rpop queue 1
1) "budhi"
localhost:6379> rpop queue 1
1) "oct"
localhost:6379> rpop queue 1
1) "malik"
localhost:6379> rpop queue 1
(nil)
localhost:6379>

# list sebagai stack (tumpukan) lifo
localhost:6379> lpush stack "budhi"
(integer) 1
localhost:6379> lpush stack "oct"
(integer) 2
localhost:6379> lpush stack "malik"
(integer) 3
localhost:6379> lrange stack 0 2
1) "malik"
2) "oct"
3) "budhi"
localhost:6379>

# hapus queue list
localhost:6379> lpop stack 1
1) "malik"
localhost:6379> lpop stack 1
1) "oct"
localhost:6379> lpop stack 1
1) "budhi"
localhost:6379> lpop stack 1
(nil)
localhost:6379>



# Sets
# Sets adalah struktur data mirip seperti Lists, namun yang membedakan adalah, pada Sets, isi data harus unik
# data yang sebelumnya sudah ada, maka otomatis data tersebut tidak akan diterima
# Data di Sets itu tidak berurutan sesuai waktu kita memasukkan data ke Sets

# menambah data ke sets
localhost:6379> sadd race "budhi" "oct" "malik"
(integer) 3
localhost:6379> sadd race "budhi" "oct" "malik"
(integer) 0
localhost:6379> scard race
(integer) 3
localhost:6379> smembers race
1) "budhi"
2) "oct"
3) "malik"
localhost:6379>

# menghapus data dari set
localhost:6379> srem race "budhi" "oct" "malik"
(integer) 3
localhost:6379> smembers race
(empty array)
localhost:6379>

# Syntax (unutk membadingkan data pada SETS)
# SDIFF digunakan untuk melihat perbedaan (different) dari Sets pertama dengan Sets lainnya
# SINTER digunakan untuk melihat kesamaan (intersect) dari beberapa Sets
# SUNION digunakan untuk melihat gabungan unik (union) dari beberapa Sets

# SDIFF
localhost:6379> sadd race2 "budhi" "oct" "malik"
(integer) 3
localhost:6379> sadd race3 "budhi" "adam" "husei"
(integer) 3
localhost:6379> sdiff race2 race3
1) "oct"
2) "malik"
localhost:6379>

# SINTER
localhost:6379> sadd race2 "budhi" "oct" "malik"
(integer) 3
localhost:6379> sadd race3 "budhi" "adam" "husei"
(integer) 3
localhost:6379> sinter race2 race3
1) "budhi"
localhost:6379>

# SUNION
localhost:6379> sunion race2 race3
1) "budhi"
2) "oct"
3) "malik"
4) "adam"
5) "husei"
localhost:6379>



# Hashes
# Hashes adalah struktur data berbentuk pair (key-value)
# struktur data Hashes ini, kita bisa menentukan key untuk value yang kita ingin gunakan

# membuat hash
localhost:6379> hset "student:1" name "budhi oct" value 100 address "Tangerang"
(integer) 3
localhost:6379> hset "student:2" name "ibnu abas" value 90 address "Depok"
(integer) 3
localhost:6379> hset "student:3" name "jaka sembung" value 80 address "Bekasi"
(integer) 3
localhost:6379> hget "student:1" name
"budhi oct"
localhost:6379> hget "student:2" name
"ibnu abas"
localhost:6379> hgetall "student:3"
1) "name"
2) "jaka sembung"
3) "value"
4) "80"
5) "address"
6) "Bekasi"
localhost:6379>

# Increment & Decrement
# perintah HINCRBY bisa digunakan untuk melakukan increment dan decrement pada value yang terdapat pada Hashes

# increment & decrement
localhost:6379> hincrby "student:1" value -10
(integer) 90
localhost:6379> hincrby "student:2" value -5
(integer) 85
localhost:6379> hincrby "student:3" value 5
(integer) 85
localhost:6379> hgetall "student:1"
1) "name"
2) "budhi oct"
3) "value"
4) "90"
5) "address"
6) "Tangerang"
localhost:6379>



# Sorted Sets
# Sorted Sets adalah struktur data mirip Sets, namun datanya diurutkan sesuai nilai score yang kita tentukan
# Jika terdapat score dengan nilai yang sama, secara otomatis akan diurutkan secara lexicographically
# Dalam Sorted Sets, data dikatakan unik jika Value dan Score nya sama, artinya kita masih bisa menambahkan Value sama, jika Score nya berbeda
# Score bernilai number, dan diurutkan secara ascending (dari terkecil ke terbesar)

# menambah datta ke sorted set
localhost:6379> zadd ranking 100 "budhi"
(integer) 1
localhost:6379> zadd ranking 90 "oct"
(integer) 1
localhost:6379> zadd ranking 95 "malik"
(integer) 1
localhost:6379> zcard ranking
(integer) 3
localhost:6379> zrange ranking 0 3
1) "oct"
2) "malik"
3) "budhi"
localhost:6379> zrange ranking 95 100 byscore
1) "malik"
2) "budhi"
localhost:6379>

# mengambild data dari sorted set
localhost:6379> zrem ranking "budhi"
(integer) 1
localhost:6379> zremrangebyscore rankig 0 75
(integer) 0
localhost:6379> zrange ranking 0 -1 withscores
1) "oct"
2) "90"
3) "malik"
4) "95"
localhost:6379>