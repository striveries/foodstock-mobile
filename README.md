# FoodStock
FoodStock merupakan suatu aplikasi berbasis _website_ yang berfungsi sebagai platform untuk membantu pengelolaan inventori stok bahan makanan suatu bisnis FnB. Melalui aplikasi ini, pengguna dapat mengetahui stok bahan makanan dasar terkini, bahan makanan yang sudah perlu untuk dilakukan _restock_, hingga melakukan pendataan harga bahan makanan tersebut.

Theme Color
#2f4f4f darkslategrey
#c3a379 creamy light brown
#4f372f dark brown
#8379c3 ungu

### Link Web Aplikasi
🔗 [Access our FoodStock](http://calista-sekar-tugas.pbp.cs.ui.ac.id)

### Penyusun Proyek
Nama : Calista Sekar    
NPM : 2206082064    
Kelas : C  

# Tugas 7

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Perbedaan utama antara stateless dan stateful widget terletak pada bagaimana state/keadaan dipertahankan.
- **Stateless Widget:**
    - **Tidak Memiliki State**: Stateless widget tidak dapat mempertahankan keadaan. Mereka mewakili bagian dari UI yang tidak diharapkan untuk berubah berdasarkan interaksi pengguna atau data internal.
    - **Rebuild**: Setiap kali informasi yang mereka terima dari parent widget mereka berubah, mereka direbuild. Ini berarti bahwa mereka tidak menyimpan nilai atau konfigurasi yang mungkin berubah selama waktu hidup widget.
    Contoh dari Stateless Widget diantaranya :  Ikon, teks, dan tombol yang tidak berubah ketika diinteraksi

- **Stateful Widget:**
    - **Memiliki State**: Stateful widget dapat mempertahankan keadaan dan dirancang untuk menyimpan nilai yang mungkin berubah selama waktu hidup widget. Keadaan ini dapat berubah sebagai respons terhadap interaksi pengguna atau data yang diterima dari sumber eksternal.
    - **Lifecycle**: Stateful widget memiliki lifecycle yang lebih kompleks. Mereka memiliki objek `State` yang terpisah yang menyimpan keadaan dan dapat memiliki logika untuk memutuskan apakah perlu membangun ulang bagian UI atau tidak.
    Contoh dari Stateful Widget diantaranya : Formulir, timer, atau halaman yang menampilkan data pengguna yang berubah dinamis 

Stateless widget cocok untuk UI yang tidak bergantung pada keadaan yang berubah seiring waktu. Sedangkan, Stateful widget cocok untuk UI  yang perlu merespons terhadap perubahan data atau interaksi pengguna.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Dalam tugas ini, saya menggunakan beberapa widget, diantaranya : 
1. `MaterialApp`: Widget yang membungkus sejumlah widget yang biasanya diperlukan untuk aplikasi material design.
2. `Scaffold`: Menyediakan struktur dasar tata letak visual untuk aplikasi material design.
3. `AppBar`: Sebuah app bar yang ditampilkan di bagian atas Scaffold.
4. `SingleChildScrollView`: Widget yang menambahkan kemampuan scroll pada widget child-nya.
5. `Padding`: Widget yang menambahkan padding di sekeliling child-nya.
6. `Column`: Widget yang menampilkan child-nya dalam kolom vertikal.
7. `Text`: Widget yang menampilkan string teks dengan berbagai style.
8. `GridView.count`: Widget yang membuat grid dengan jumlah kolom yang tetap.
9. `Material`: Widget yang mengikuti prinsip desain material dan memberikan efek visual pada child-nya.
10. `InkWell`: Widget yang memberikan efek visual ketika disentuh dan dapat memiliki callback seperti onTap.
11. `Container`: Widget yang menggabungkan widget lain bersama-sama dan dapat diberi padding, margin, border, atau dekorasi lainnya.
12. `Center`: Widget yang memusatkan child-nya di dalam dirinya.
13. `Icon`: Widget yang menampilkan ikon dari set ikon material.
14. `SnackBar`: Sebuah pesan ringkas yang muncul di bagian bawah layar untuk memberikan feedback kepada pengguna.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- Menginisiasi project Flutter untuk aplikasi mobile FoodStock di terminal 
- Membuat repositori untuk project mobile app FoodStock
- Merapikan struktur proyek Flutter agar mengikuti best practice pengembangan aplikasi--berupa _clean architecture_.
- Menambahkan widget-widget sesuai dengan ketentuan soal
    - Membuat tiga tombol sederhana dengan ikon dan teks untuk:
        1. Melihat daftar item (Lihat Item)
        2. Menambah item (Tambah Item)
        3. Logout (Logout)
    ```
        final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist),
        ShopItem("Tambah Item", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
    ```
    - Memunculkan Snackbar dengan tulisan:
        1. "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
        2. "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
        3. "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan
        ```
        class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: Colors.indigo,
            child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
        }
        ```
## Tugas 8
### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
`Navigator.push()` menambahkan halaman baru ke stack sehingga memungkinkan navigasi "kembali", sedangkan `Navigator.pushReplacement()` menggantikan halaman saat ini dengan yang baru, sehingga menghilangkan kemungkinan kembali ke halaman sebelumnya.
1. **Navigator.push()** digunakan untuk menavigasi ke halaman baru di atas stack navigasi saat ini. Halaman baru ditambahkan ke atas stack, dan pengguna dapat kembali ke halaman sebelumnya dengan menggunakan tombol kembali atau gestur. **Navigator.push()** cocok digunakan ketika Anda ingin memungkinkan pengguna untuk kembali ke halaman sebelumnya. Misalnya, dari halaman beranda ke halaman detail produk di aplikasi e-commerce.

   **Contoh**:
   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => DetailPage()),
   );
   ```
2. **Navigator.pushReplacement()** digunakan untuk menggantikan halaman saat ini dalam stack navigasi dengan halaman baru. Halaman sebelumnya dihapus dari stack, sehingga pengguna tidak dapat kembali ke halaman tersebut. COntoh penggunaannya addalah ketika proses autentikasi. Misalnya, setelah proses login berhasil, dilakukan navigasi ke halaman beranda yang tidak memungkinkan pengguna kembali ke halaman login.

   **Contoh**:
   ```dart
   Navigator.pushReplacement(
     context,
     MaterialPageRoute(builder: (context) => HomePage()),
   );
   ```

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. **Container**: Widget yang menggabungkan fitur tata letak, lukisan, dan styling. Container bisa memiliki padding, margin, border, dan background color. Container cocok untuk membuat sebuah box dengan ukuran, warna, atau dekorasi tertentu. Sering digunakan untuk membuat background dan memberikan jarak antar elemen.

2. **Row dan Column**: Row mengatur anak-anaknya secara horizontal, sedangkan Column mengaturnya secara vertikal. Row ideal untuk layout linear, seperti daftar horizontal (Row) atau vertikal (Column). Sering digunakan untuk mengatur tombol, teks, atau ikon dalam satu baris atau kolom.

3. **Stack**:  Stack memungkinkan widget untuk ditumpuk di atas satu sama lain. Stack juga berguna untuk overlay widget, seperti menempatkan teks di atas gambar atau membuat efek tumpang tindih.

4. **GridView** menampilkan item dalam grid dua dimensi. GridView cocok untuk menampilkan data dalam bentuk grid, seperti galeri foto atau grid menu.

5. **ListView** menampilkan daftar item yang dapat di-scroll secara vertikal. ListView ideal untuk daftar yang panjang dan bisa di-scroll, seperti daftar email atau feed berita.

6. **Flex dan Expanded**: Flex adalah versi lebih fleksibel dari Row dan Column. Expanded digunakan dalam Flex untuk memberikan anak-anaknya ruang yang fleksibel. Biasanya digunakan untuk membuat layout yang responsif dengan membagi ruang secara proporsional.

7. **Wrap** mirip dengan Row atau Column, tetapi akan secara otomatis pindah ke baris atau kolom baru saat tidak ada cukup ruang. Wrap cocok untuk widget yang jumlahnya dinamis dan bisa lebih dari yang dapat ditampung oleh layar secara horizontal atau vertikal.

8. **Padding** digunakan untuk memberikan jarak dalam layout, seperti jarak antara teks dan batas widgetnya.

9. **Align dan Center**: Align mengizinkan penyesuaian posisi anak di dalam dirinya, sedangkan Center adalah versi khusus dari Align yang menengahkan anaknya. Keduanya berguna untuk menentukan posisi atau menengahkan widget di dalam container atau layout lainnya.

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. **`TextFormField` untuk Nama**:  untuk memungkinkan pengguna memasukkan nama item karena berupa input teks dalam Flutter. `TextFormField` dapat melakukan validasi dan manipulasi teks, membuatnya ideal untuk mengumpulkan input seperti nama item.

2. **`TextFormField` untuk Jumlah Item**: untuk memungkinkan pengguna memasukkan jumlah item dalam bentuk angka. Meskipun masih menggunakan `TextFormField`, field ini khusus ditujukan untuk angka. Dengan menggunakan validator, input yang diterima adalah dapat dipastikan adalah numerik.

3. **`TextFormField` untuk Deskripsi Item**: Untuk memasukkan deskripsi lebih lanjut tentang item. Deskripsi memungkinkan teks yang lebih panjang dan mungkin multi-line, dan `TextFormField` dapat dikonfigurasi untuk menangani input multi-line. 

4. **`ElevatedButton` untuk Submit**: untuk mengirimkan formulir. Selain itu,  `ElevatedButton` memberikan efek visual dan feedback yang jelas saat ditekan, memberitahu pengguna bahwa aksi untuk menyimpan data telah dilakukan. 

### Bagaimana penerapan clean architecture pada aplikasi Flutter?
1. **Struktur Folder**:
Clean architecture pada Flutter dapat diterapkan dengan pertama memisahkan kode menjadi `/domain`, `/data`, dan `/presentation`.
   - `/domain` berisi `entities`, `usecases`, dan `repository interfaces`.
   - `/data` berisi `models`, `data sources`, dan `repository implementations`.
   - `/presentation` berisi `pages/screens`, `widgets`, dan `state management` (misalnya BLoC atau ViewModel).

2. **Domain Layer**: pengembangan aplikasi dengan logika bisnis dan entitas.
   - `Entities`: Objek bisnis murni.
   - `Use Cases`: Logika bisnis aplikasi.
   - `Repository Interfaces`: Abstraksi untuk akses data.

3. **Data Layer**: implementasi detail teknis untuk penyimpanan data.
   - `Models`: Representasi data.
   - `Data Sources`: Interaksi dengan sumber data eksternal (API, database).
   - `Repositories`: Implementasi konkrit dari `repository interfaces`.

4. **Presentation Layer**: UI dan logika presentasi.
   - `Pages/Screens`: Halaman UI.
   - `Widgets`: Komponen UI.
   - `State Management`: Mengelola state UI (BLoC, Provider, dll).

5. **Dependency Injection**:
   - Menggunakan alat seperti `get_it` untuk injeksi dependensi.
   - Memudahkan pengujian dan pemeliharaan.

6. **Pengujian**:
   - Melakukan unit test, widget test, dan integration test.

7. **Prinsip SOLID**:
   - Terapkan prinsip SOLID untuk kode yang bersih dan mudah dipelihara.

### STEP BY STEP TUGAS 8
### 1. Membuat Halaman Formulir Tambah Item Baru (`stocklist_form.dart`)

Saya memulai dengan membuat file baru bernama `stocklist_form.dart`. Di dalam file ini, saya mendefinisikan sebuah `StatefulWidget` yang saya namakan `StockFormPage`. Tujuan utama saya adalah membuat formulir untuk menambahkan item baru ke dalam aplikasi.

- **Menambahkan Elemen Input**: Saya menambahkan tiga elemen input menggunakan `TextFormField` di dalam `StockFormPage`. Ketiga elemen tersebut adalah `name`, `amount`, dan `description`. Saya memastikan setiap elemen input ini dapat menerima input dari pengguna.

- **Validasi Input**: Untuk setiap `TextFormField`, saya menambahkan validasi. Saya ingin memastikan bahwa pengguna tidak meninggalkan input kosong dan memasukkan data sesuai dengan tipe yang diharapkan. Misalnya, untuk `amount`, saya memastikan bahwa inputnya adalah angka.

- **Membuat Tombol Save**: Saya menambahkan sebuah tombol `ElevatedButton` di bagian bawah formulir. Saya menulis logika di dalam `onPressed` dari tombol ini untuk memvalidasi form saat pengguna menekan tombol. Jika validasi berhasil, saya menampilkan pop-up yang menunjukkan data yang dimasukkan pengguna, menggunakan `AlertDialog`.

### 2. Menambahkan Navigasi ke Halaman Formulir dari Halaman Utama

Di halaman utama aplikasi saya (`MyHomePage`), saya melakukan beberapa perubahan:

- **Tombol Tambah Item**: Di dalam `GridView`, saya menambahkan sebuah `InventoryCard` yang berfungsi sebagai tombol untuk navigasi. Saat pengguna menekan tombol "Tambah Item", saya mengatur agar aplikasi melakukan navigasi ke `StockFormPage` menggunakan `Navigator.push`.

### 3. Membuat Drawer dengan Opsi Navigasi

Saya juga memutuskan untuk menambahkan sebuah drawer di aplikasi untuk navigasi yang lebih mudah.

- **Menambahkan Drawer**: Saya menggunakan widget `Drawer` di Flutter. Di dalam drawer ini, saya menambahkan setidaknya dua opsi: "Halaman Utama" dan "Tambah Item".

- **Navigasi dari Drawer**: Saya menambahkan fungsi navigasi sehingga ketika pengguna memilih opsi "Halaman Utama" dari drawer, mereka akan dibawa kembali ke `MyHomePage`. Demikian pula, ketika memilih "Tambah Item", aplikasi akan membawa mereka ke `StockFormPage`.