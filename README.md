<details>

<summary>Tugas 1</summary>

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

<summary>Tugas 2</summary>

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
