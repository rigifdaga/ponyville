<details>

<summary>Tugas 7</summary>

<h1>Perbedaan Utama antara Stateless dan Stateful Widget dalam Konteks Pengembangan Aplikasi Flutter</h1>

Dalam konteks pengembangan aplikasi Flutter, `StatelessWidget` dan `StatefulWidget` memiliki perbedaan utama dalam hal bagaimana mereka memanajemen state atau kondisi dari widget tersebut:

<h2>StatelessWidget</h2>

1. Merupakan widget yang statis.
2. Seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal.
3. Widget ini tidak dapat diubah dan tidak akan pernah berubah.
4. Cocok digunakan ketika hanya perlu menampilkan data yang sifatnya statis atau tidak perlu adanya perubahan nilai.

<h2>StatefulWidget</h2>

1. Merupakan widget yang dinamis.
2. Widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan aksi dari pengguna atau ketika terjadi perubahan data.
3. Dapat mengubah atau mengupdate tampilan, menambah widget lainnya, mengubah nilai variabel, icon, warna dan masih banyak lagi.

<h1>Widget yang Digunakan pada Tugas 7</h1>

Berikut adalah widget-widget yang digunakan pada tugas 7:

- `MyApp`: Widget yang merupakan root dari aplikasi Flutter. Widget ini mengembalikan sebuah `MaterialApp` yang menyediakan fitur-fitur dasar dari Material Design, seperti tema, navigasi, dan gesture.
- `MyHomePage`: Widget yang merupakan halaman utama dari aplikasi. Widget ini mengembalikan sebuah `Scaffold` yang menyediakan struktur layout dasar untuk aplikasi, seperti app bar, body, dan floating action button.
- `SingleChildScrollView`: Widget yang menyediakan kemampuan untuk melakukan scroll pada konten yang melebihi ukuran layar. Widget ini membungkus `Padding` yang berisi `Column`.
- `Padding`: Widget yang memberikan jarak antara widget dengan widget lainnya. Widget ini digunakan untuk memberikan jarak antara tepi layar dengan konten, serta antara judul dengan grid layout.
- `Column`: Widget yang menampilkan widget-widget lainnya secara vertikal. Widget ini digunakan untuk menampilkan judul dan grid layout.
- `Text`: Widget yang menampilkan teks dengan berbagai atribut, seperti alignment, style, dan font. Widget ini digunakan untuk menampilkan judul "Pony Pocket".
- `GridView.count`: Widget yang menampilkan widget-widget lainnya dalam bentuk grid dengan jumlah kolom yang ditentukan. Widget ini digunakan untuk menampilkan tiga tombol sederhana dengan ikon dan teks.
- `ShopCard`: Widget yang menampilkan sebuah `Material` dengan `InkWell` dan `Container`. Widget ini digunakan untuk menampilkan setiap item pada grid layout dengan warna, ikon, dan teks yang sesuai.
- `Material`: Widget yang memberikan efek visual Material Design pada widget lainnya, seperti elevasi, warna, dan bentuk. Widget ini digunakan untuk memberikan warna pada setiap item pada grid layout.
- `InkWell`: Widget yang memberikan efek visual dan gesture pada widget lainnya, seperti splash dan highlight. Widget ini digunakan untuk memberikan respons ketika setiap item pada grid layout ditekan.
- `Container`: Widget yang menyediakan berbagai kemampuan untuk mengatur widget lainnya, seperti padding, alignment, dan decoration. Widget ini digunakan untuk menampilkan ikon dan teks pada setiap item pada grid layout.
- `Center`: Widget yang menempatkan widget lainnya di tengah-tengah. Widget ini digunakan untuk menempatkan `Column` yang berisi ikon dan teks pada setiap item pada grid layout.
- `Icon`: Widget yang menampilkan ikon dengan berbagai atribut, seperti warna, ukuran, dan jenis. Widget ini digunakan untuk menampilkan ikon pada setiap item pada grid layout.

<h1>Implementasi Checklist</h1>

Pertama-tama saya membuat direktori `ponyville` untuk menyimpan proyek flutter yang akan saya buat. Setelah itu saya mengenerate proyek flutter baru dengan nama `ponyville` dengan command `flutter create ponyville`

Saya membuat file baru bernama `menu.dart` pada `ponyvilee/lib` dan melakukan import package
`import 'package:flutter/material.dart';`

Dari file `main.dart` saa memindahkan class `MyHomePage` dan class `_MyHomePageState` ke file `menu.dart`. Selanjutnya pada file `menu.dart` saya melakukan import `import 'package:ponyville/menu.dart';`

Setelah itu pada `menu.dart` saya mengubah sifat widget halaman dari stateful menjadi stateless dan menambahkan widget-widget seperti teks dan card sebagai berikut:

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.pink),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blue),
        ShopItem("Logout", Icons.logout, Colors.indigo),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Ponyville',
            ),
          ),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'Pony Pocket', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                      // Iterasi untuk setiap item
                      return ShopCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
    }
}

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;
  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
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

<h1>BONUS</h1>

[![image.png](https://i.postimg.cc/Y01by7sD/image.png)](https://postimg.cc/Zv58CGZ6)

</details>

<details>

<summary>Tugas 8</summary>

<h1>Navigator.push() dan Navigator.pushReplacement()</h1>

Navigator.push() dan Navigator.pushReplacement() adalah dua metode yang digunakan dalam Flutter untuk navigasi antar halaman. Berikut adalah perbedaannya:

1. Navigator.push(): Metode ini digunakan untuk menavigasi ke halaman baru sambil mempertahankan halaman saat ini di tumpukan navigasi. Jadi, ketika pengguna menekan tombol kembali, aplikasi akan kembali ke halaman sebelumnya.
2. Navigator.pushReplacement(): Metode ini juga digunakan untuk menavigasi ke halaman baru, tetapi halaman saat ini akan dihapus dari tumpukan navigasi. Jadi, ketika pengguna menekan tombol kembali, aplikasi tidak akan kembali ke halaman sebelumnya, tetapi ke halaman sebelum halaman tersebut1.

Misalnya, jika kita memiliki tiga halaman: Halaman A, B, dan C. kita berada di Halaman A dan menggunakan Navigator.push() untuk pergi ke Halaman B, kemudian menggunakan Navigator.pushReplacement() untuk pergi ke Halaman C. Jika kita menekan tombol kembali, kita akan kembali ke Halaman A, bukan Halaman B, karena Halaman B telah digantikan oleh Halaman C.

<h1>Flutter Wigdet Layout</h1>

Flutter menyediakan berbagai macam widget layout untuk mengatur tata letak antarmuka pengguna. Berikut adalah beberapa di antaranya:

1. Container: Widget yang menggabungkan pengecatan umum, penempatan, dan widget ukuran.
2. Row dan Column: Widget ini memungkinkan kita untuk menyusun widget atau komponen-komponen UI, baik secara horizontal (Row) maupun vertikal (Column).
3. Stack: Widget ini berguna jika kita ingin menumpuk beberapa anak dalam cara yang sederhana.
4. Padding: Widget yang memberikan padding pada anaknya.
5. Expanded: Widget yang memperluas anak dari Row, Column, atau Flex.
6. GridView: Widget yang mengimplementasikan komponen daftar grid.
7. ListView: Widget scrolling yang paling umum digunakan. Menampilkan anak-anaknya satu demi satu dalam arah scroll.

<h1>Elemen Input Form</h1>

Pada kode terdapat dua elemen input pada form, yaitu:

1. **TextFormField**: Digunakan untuk memasukkan teks. Pada kode saya, elemen ini digunakan dua kali, yaitu untuk memasukkan "Nama Produk" dan "Amount". TextFormField ini dilengkapi dengan validator untuk memastikan bahwa field tidak boleh kosong dan untuk field "Amount", nilai yang dimasukkan harus berupa angka.

2. **ElevatedButton**: Digunakan sebagai tombol submit. Ketika tombol ini ditekan, maka akan memeriksa apakah semua field telah diisi dengan benar melalui `_formKey.currentState!.validate()`. Jika validasi berhasil, maka akan menampilkan dialog bahwa produk berhasil tersimpan.

Pemilihan elemen input ini didasarkan pada kebutuhan aplikasi. TextFormField digunakan karena aplikasi membutuhkan input berupa teks dari pengguna, dan ElevatedButton digunakan untuk melakukan aksi (dalam hal ini, validasi dan penyimpanan data) ketika ditekan.

<h1>Clean Architecture</h1>

Clean Architecture adalah pola arsitektur yang membantu dalam menyusun kode yang bersih dan terstruktur. Dalam konteks Flutter, berikut adalah beberapa langkah untuk menerapkannya:

1. Membuat lapisan domain yang berfungsi sebagai inti dari aplikasi yang berisi logika bisnis dan model data.
2. Menerapkan lapisan aplikasi yang mengimplementasikan kasus penggunaan aplikasi dan menjembatani lapisan infrastruktur dan presentasi.
3. Mengatur lapisan infrastruktur yang berurusan dengan interaksi dengan dunia luar termasuk database, server web, antarmuka pengguna.
4. Membuat lapisan presentasi yang berisi kode yang merender antarmuka pengguna di mana permintaan dibuat dan respons dikembalikan.
   
Keuntungan dari Clean Architecture antara lain fleksibilitas, pemeliharaan yang mudah, dan skalabilitas. Namun, perlu diingat bahwa implementasi awal mungkin memerlukan waktu dan kompleksitas lebih karena memerlukan perencanaan dan desain yang hati-hati.

<h1>Implementasi Checklist</h1>

1. Menambahkan Drawer Menu:
   
- Buatlah berkas baru bernama left_drawer.dart dalam direktori widgets.
- Tambahkan kode untuk membuat drawer menu dengan navigasi ke halaman-halaman tertentu, seperti MyHomePage dan ShopFormPage.

```dart
//OK TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:ponyville/screens/menu.dart';

// OK TODO: Impor halaman ShopFormPage jika sudah dibuat
import 'package:ponyville/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // OK TODO: Bagian drawer header
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Ponyville',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("It’s a shopping experience that’s as diverse and colorful as the ponies who live there",
                    // OK TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                ),
              ],
            ),
          ),
          // OK TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              OK TODO: Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
```

2. Menambahkan Form dan Elemen Input:

- Buat berkas baru bernama shoplist_form.dart.
- Tambahkan variabel _formKey sebagai GlobalKey<FormState> untuk mengelola state form.
- Implementasikan TextFormField untuk menerima input nama produk, jumlah, dan deskripsi.
- Gunakan Padding dan Column untuk mengatur tata letak elemen input dan validasi input dan tampilkan pesan kesalahan jika tidak valid.

```dart
import 'package:flutter/material.dart';
// OK TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:ponyville/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // OK TODO: Tambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // OK TODO: Tambahkan variabel yang sesuai
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Amount harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      // OK TODO: Tambahkan variabel yang sesuai
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    // OK TODO: Munculkan value-value lainnya
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }

                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          ),  
        ),
      ),
    );
  }
}
```

3. Memunculkan Data:

- Gunakan showDialog() untuk menampilkan AlertDialog ketika tombol "Save" ditekan.
- Tampilkan data yang dimasukkan pada form dalam AlertDialog.
- Reset form setelah data berhasil tersimpan.

```dart
...
if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Produk berhasil tersimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text('Name: $_name'),
                // OK TODO: Munculkan value-value lainnya
                Text('Amount: $_amount'),
                Text('Description: $_description'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    _formKey.currentState!.reset();
    }
...
```


4. Menambahkan Fitur Navigasi pada Tombol:

- Pada widget ShopItem di berkas menu.dart, tambahkan Navigator.push() pada atribut onTap.
- Sesuaikan navigasi berdasarkan jenis tombol yang ditekan, misalnya, navigasi ke halaman ShopFormPage.

```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Produk") {
            // OK TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          }
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
    
</details>

<details>

<summary>Tugas 9</summary>

<h1>Pengambilan Data JSON tanpa Membuat Model</h1>
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Salah satu caranya adalah dengan menggunakan fungsi jsonDecode dari pustaka dart:convert yang dapat mengubah string JSON menjadi Map<String, dynamic> . Kemudian, kita bisa mengakses nilai-nilai yang kita butuhkan dari map tersebut dengan menggunakan kunci-kunci yang sesuai.

<h1>CookieRequest</h1>

CookieRequest adalah kelas yang digunakan untuk mengelola cookies dalam aplikasi Flutter. Fungsi utamanya adalah untuk menyimpan dan mengambil cookies yang digunakan saat berinteraksi dengan server web. Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter karena cookies sering digunakan untuk otentikasi pengguna, pelacakan sesi, dan menyimpan preferensi pengguna. Dengan membagikan instance yang sama, kita memastikan bahwa semua komponen aplikasi memiliki akses ke informasi yang sama dan konsisten.

<h1>Mekanisme Pengambilan Data dari JSON sampai di Flutter</h1>

Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter melibatkan beberapa langkah:

1. Pertama, kita perlu mengambil data JSON, biasanya dari API web menggunakan HTTP GET atau POST.
2. Kedua, data JSON yang diterima kemudian diuraikan atau ‘diparsing’ menjadi objek atau struktur data yang dapat digunakan oleh Flutter. Ini biasanya dilakukan dengan menggunakan fungsi `jsonDecode()` dari paket `dart:convert`.
3. Ketiga, objek atau struktur data ini kemudian digunakan untuk membangun widget Flutter, seperti `ListView` atau `Card`, yang kemudian ditampilkan ke pengguna.

<h1>Mekanisme Autentikasi pada Flutter ke Django dan Tampilan Menu</h1>

Mekanisme autentikasi dari input data akun pada Flutter ke Django melibatkan beberapa langkah:

1. Pertama, pengguna memasukkan data akun mereka (biasanya email dan kata sandi) melalui form di aplikasi Flutter.
2. Kedua, data ini kemudian dikirim ke server Django, biasanya melalui HTTP POST.
3. Ketiga, Django kemudian memverifikasi data ini dengan data yang ada di database. Jika data cocok, Django akan mengirimkan balasan yang mengkonfirmasi bahwa autentikasi berhasil.
4. Keempat, aplikasi Flutter kemudian menerima balasan ini dan, jika autentikasi berhasil, menu ditampilkan kepada pengguna. Jika autentikasi gagal, pesan kesalahan ditampilkan.

<h1>Widget</h1>

Berikut adalah daftar widget yang digunakan dalam kode Flutter:

1. Scaffold: Ini adalah widget utama yang biasanya digunakan sebagai kerangka dasar tata letak material design.
2. AppBar: Sebuah widget yang biasanya digunakan sebagai bagian atas Scaffold yang berisi judul dan beberapa tindakan.
3. Padding: Widget ini digunakan untuk memberikan padding ke widget anaknya.
4. Column: Widget ini digunakan untuk menampilkan anak-anaknya dalam tata letak vertikal.
5. Text: Widget ini digunakan untuk menampilkan teks.
6. SizedBox: Widget ini digunakan untuk memberikan ruang kosong dengan ukuran tertentu.
7. FloatingActionButton: Sebuah tombol aksi yang mengambang yang biasanya ditempatkan di atas konten.
8. Icon: Widget ini digunakan untuk menampilkan ikon.
9. LeftDrawer: Widget ini digunakan untuk menampilkan drawer di sebelah kiri.
10. FutureBuilder: Widget ini digunakan untuk membuat widget berdasarkan hasil Future.
11. Center: Widget ini digunakan untuk memusatkan widget anaknya.
12. CircularProgressIndicator: Widget ini digunakan untuk menampilkan indikator progres yang berputar.
13. ListView.builder: Widget ini digunakan untuk membuat daftar yang dapat digulir.
14. GestureDetector: Widget ini digunakan untuk mendeteksi gestur seperti ketukan, gesekan, dan lainnya.
15. MaterialApp: Widget yang menyediakan fitur-fitur dasar dari Material Design, seperti tema, navigasi, dan gesture.
16. Container: Widget yang menyediakan kotak untuk menampung widget lainnya dengan berbagai atribut, seperti padding, margin, alignment, dan decoration.
17. MaterialPageRoute: Widget yang menyediakan transisi material design antara halaman.
18. Navigator: Widget yang menyediakan mekanisme untuk mengelola tumpukan widget yang dapat dinavigasi, seperti halaman atau layar.
19. ListTile: Widget yang menyediakan sebuah item yang dapat diklik pada daftar, biasanya digunakan untuk menampilkan ikon, teks, dan tindakan.
20. DrawerHeader: Widget yang menyediakan sebuah header untuk drawer, biasanya digunakan untuk menampilkan informasi atau gambar.
21. Drawer: Widget yang menyediakan sebuah panel yang dapat ditarik dari tepi layar, biasanya digunakan untuk menampilkan menu navigasi.
22. MyApp: Widget yang merupakan subclass dari StatelessWidget. Widget ini merupakan widget utama yang digunakan untuk menjalankan aplikasi Flutter.
23. StatelessWidget: Widget yang merupakan superclass dari MyApp. Widget ini merupakan widget yang tidak memiliki state atau kondisi yang berubah-ubah.
24. Provider: Widget yang digunakan untuk menyediakan sebuah objek yang dapat diakses oleh widget-widget lainnya melalui context. Widget ini digunakan untuk menyediakan objek CookieRequest yang digunakan untuk melakukan request ke server menggunakan cookie.
25. MaterialApp: Widget yang menyediakan fitur-fitur dasar dari Material Design, seperti tema, navigasi, dan gesture. Widget ini digunakan untuk menentukan judul, tema, dan halaman utama aplikasi.
26. ThemeData: Widget yang digunakan untuk menentukan tema aplikasi, seperti warna, font, dan ikon. Widget ini digunakan untuk menentukan skema warna dan versi Material Design yang digunakan.
27. LoginPage: Widget yang digunakan untuk menampilkan halaman login aplikasi. Widget ini merupakan subclass dari StatefulWidget yang memiliki state atau kondisi yang berubah-ubah.

<h1>Implementasi Checklist</h1>

<h2>Integrasi Autentikasi Django-Flutter</h2>

Django Setup:

1. Membuat django-app bernama "authentication" pada proyek Django.
2. Menambahkan "authentication" ke INSTALLED_APPS di settings.py.
3. Menginstall library django-cors-headers dengan perintah pip install django-cors-headers.
4. Menambahkan corsheaders ke INSTALLED_APPS dan middleware pada settings.py.
5. Mengatur variabel CORS dan keamanan pada settings.py.
6. Membuat metode view untuk login di authentication/views.py.
7. Membuat file urls.py di folder authentication dan tambahkan URL routing.
8. Membuat path 'auth/' pada urls.py di proyek utama.

Flutter Setup:

1. Menginstall package Flutter yang disediakan oleh tim asisten dosen.
2. Memodifikasi root widget untuk menyediakan CookieRequest ke semua child widgets dengan menggunakan Provider.
3. Membuat file login.dart di folder screens dan isi dengan kode untuk halaman login.

<h2>Pembuatan Model Kustom</h2>

1. Menggunakan website Quicktype untuk membuat model Dart dari data JSON.
2. Membuat file product.dart di folder lib/models dan tempel kode dari Quicktype.
3. Menerapkan Fetch Data dari Django ke Flutter
4. Menambahkan dependency HTTP dengan perintah flutter pub add http.
5. Menambahkan izin internet pada file AndroidManifest.xml.
6. Membuat file list_product.dart di folder lib/screens untuk menampilkan produk dari Django.
7. Menghubungkan halaman list_product.dart dengan CookieRequest.
8. Menjalankan aplikasi dan lihat hasilnya.

<h2>Integrasi Form Flutter dengan Layanan Django</h2>

1. Menambahkan fungsi view di Django untuk membuat produk baru.
2. Menambahkan path baru di urls.py untuk fungsi view tersebut.
3. Menghubungkan halaman shoplist_form.dart dengan CookieRequest.
4. Mengubah perintah onPressed untuk menambahkan produk baru.
5. Menjalankan aplikasi dan coba tambahkan produk baru dari Flutter.

<h2>Implementasi Fitur Logout</h2>

1. Membuat metode view untuk logout di authentication/views.py.
2. Menambahkan path baru di authentication/urls.py untuk fungsi logout.
3. Pada Flutter, tambahkan fungsi logout pada file shop_card.dart.
4. Menjalankan aplikasi dan coba lakukan logout.

</details>
