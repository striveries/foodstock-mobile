# FoodStock
FoodStock merupakan suatu aplikasi berbasis _website_ yang berfungsi sebagai platform untuk membantu pengelolaan inventori stok bahan makanan suatu bisnis FnB. Melalui aplikasi ini, pengguna dapat mengetahui stok bahan makanan dasar terkini, bahan makanan yang sudah perlu untuk dilakukan _restock_, hingga melakukan pendataan harga bahan makanan tersebut.

Theme Color
#2f4f4f darkslategrey
#c3a379 creamy light brown
#4f372f dark brown
#8379c3 ungu

### Link Web Aplikasi
🔗 [Access our FoodStock](http://calista-sekar-tugas.pbp.cs.ui.ac.id) ?????

### Penyusun Proyek
Nama : Calista Sekar    
NPM : 2206082064    
Kelas : C  

## Tugas 7

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
    dengan kode berikut
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
        dengan kode berikut :
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

