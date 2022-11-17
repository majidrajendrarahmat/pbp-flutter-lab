# counter_7

Majid Rajendra Rahmat - 2106752382 - PBP C

# Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless widget adalah widget yang wujudnya/keadaannya dalam suatu app tidak akan pernah berubah sesudah widgetnya dibuat. Stateful Widget adalah widget yang keadaannya dapat diubah oleh variabel, input, button, dan lain-lain.

# Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- AppBar: 
  Berisi toolbar dan widget-widget lainnya seperti TabBar dan FlexibleSpaceBar
  
- Icons: 
  Sebuah grafik icon
  
- Scaffold:
  Merupakan struktur visual layout yang dapat menunjukkan drawers, snack bars, dan bottom sheets
  
- Column, Row, Container:
  Membantu dalam positioning dan sizing widgets
  
- Text, TextStyle:
  Text dalam app bersama dengan stylingnya
  
- Floating Action Button:
  Widget button yang "float" di atas widget lainnya dna muncul sebagai icon bulat.
  
# Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState() adalah fungsi yang digunakan untuk meng-notify framework bahwa state sebuah objek berubah dan komunikasikan perubahan ini ke flutter untuk di-rebuild page-nya. Variabel-variabel yang notify setState() ini merupakan statefulWidgets.

# Jelaskan perbedaan antara const dengan final
source: https://belajarflutter.com/perbedaan-final-dan-const-pada-dart-dan-flutter/#Immutable_pada_Dart
Final = Final (variabel yang menggunakan keyword final) diinialisasi pada saat pertama kali digunakan dan hanya disetel sekali. Dengan kata lain nilai final akan diketahui pada saat run-time.

Const = Const dapat digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi (Compile time) berjalan, artinya adalah nilai dari variabel tersebut harus sudah di berikan value secara langsung.

Variabel const harus sudah diketahui value-nya saat compiling, sedangkan variabel final hanya perlu diinisialiasi selama value-nya tetap.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

Pertama, start new app "counter_7" dengan command "flutter create counter_7" lalu buka lib/main.dart. Pertama buat sebuah fungsi ganjil/genap dimana akan return String "GANJIL" saat counter ganjil, dan "GENAP" saat counter genap. Lalu pada widget text dalam body, set return fungsi ganjil/genap tadi sebagai variabel textnnya, dan set textstyle dengan warna merah jika return genap, dan cyan jika return ganjil.
Lalu, buatlah fungsi incrementDown() dimana setiap setState() akan membuat jumlah counter berkurang satu, Namun, jika counter sudah 0, dia akan return dan tidak mengubah state counter.
Terakhir, set floatingActionButtonLocation dengan centerFloat, lalu set padding container floatingActionButton dengan EdgeInsets.symmetric(). Untuk poin bonus, buat child widget Visibility yang didalamnya adalah child FloatingActionButton incrementDown() dan variabel visibility dimana visibility akan false (menghilangkan button) apabila counter sama dengan nol. Lalu, di luar widget Visibility, buat widget FloatingActionButton satu lagi untuk button incrementUp().
