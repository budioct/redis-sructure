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



