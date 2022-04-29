UZAY TESLİMATI  CHALLENGE
GİRİŞ 
Uzay teslimatı için özel olarak görevlendirilen Birleşik Uzay Gezginleri takımının bir  üyesisin. Amacımız farklı gezegenlerdeki istasyonlar arasında seyahat ederek,  istasyonların ihtiyacı olan malzemeleri depolara ulaştırmak.  
Yapman gereken görevleri görev sayfalarında bulacaksın.  
Başarılar dileriz.
GÖREV 1 - UZAY ARACI 
Öncelikle sana ait olacak bir uzay aracına ihtiyacımız var.  
Uzay aracının hasar kapasitesi 100 birim güçtür.  
Uzay aracın 3 ana özellikten oluşacak bu 3 özellik : Hız, Malzeme Kapasitesi ve Dayanıklılık  
Bu üç özelliği uzay aracını oluştururken üçünün toplamı 15 puan olacak şekilde dağıtman gerekmekte  özelliklerden herhangi birisi sıfır olamaz. Özellikler ileriki aşamalarda sana seyahatindeki görevler  için yardımcı olacak. Bu nedenle uzay aracının bilgilerini bir yerlerde tutmayı unutma.  
 
GÖREV 2 - UZAY İSTASYONLARI 
Artık bir uzay aracına sahip olduğuna göre görevleri yapmaya hazırsın.  
Görevleri yapmadan önce istasyonları listelememiz gerekiyor. Her istasyonun bir  kapasitesi ve koordinatı olduğunu unutma. Bu bilgiler senin istasyonlar arasındaki  mesafeyi ölçebilmen ve elindeki kalan malzemeyi dağıtman için yardımcı olacak.  
İstasyon isimlerini bu listede aratabildiğimizde bulmalıyız bu yüzden buna dikkat  etmelisin.  
*İstasyon bilgileri koordinatlarıyla beraber sana verilecek. 
GÖREV 3 - MEVCUT İSTASYON 
Bir istasyona seyahat gerçekleştirip malzemeyi bıraktığında konumun mevcut istasyon  olmuş oluyor. Diğer istasyonların bulunduğumuz mevcut istasyona göre bilgilerini(uzaklık  vb. gibi) görmeli ve ona göre hareketimizi gerçekleştirmeliyiz. 
GÖREV 4 - FAVORİİSTASYONLAR 
Bulunduğumuz istasyonları favoriye eklediğimizde bazı bilgileri görmemiz gerekiyor  İstasyon’un Dünya’ya uzaklığı, depo kapasitesi gibi bilgileri favorilerim listemizde anlık  olarak görebilmeli, ekleme - çıkarma yapabilmeliyiz.
ANA GÖREV - DAĞITIM 
Bu büyük teslimata Dünya’dan başlıyorsun.  
UGS(Uzay giysisi sayısı) = (Malzeme Kapasitesi İçin Verdiğin Puan * 10000)  
EUS(Evrensel uzay süresi) = (Hız İçin Verdiğin Puan * 20)  
DS(Dayanıklılık Süresi) = (Dayanıklılık İçin Verdiğin Puan * 10000)  
Elinde dağıtılması gereken Uzay Giysileri var(UGS). Bu uzay giysilerinin dağıtımının depoların kapasitelerine göre belirli bir  süre içerisinde yapılması gerekiyor(EUS). Elindeki malzemelerle depoların kapasitesi arasındaki farklara dikkat et. Dağıttığın  uzay giysilerini bitirdiğinde, zamanın bittiğinde ya da dayanıklılığın tükendiğinde Dünya’ya geri döneceksin. Unutma tüm  depoların ne kadar giysi ihtiyacı kaldığını güncel tutman gerekiyor.  
2 istasyon arasındaki mesafeyi verilen koordinatlara göre hesaplaman gerekiyor. Seyahatlerinden sonra kat ettiğin mesafeler  Evrensel Uzay Süresi(EUS)‘nden düşecek. Yani 10birimlik seyahatin için EUS 10 azalmalı.  
Dayanıklılık süresi uzay aracının kaç saniyede bir hasar alacağını gösteriyor. Yani 50000DS = 50 saniyede bir uzay aracının  hasar alması demek.  
Bıraktığın ürünleri, elindeki toplam uzay giysisinden düşmen ve depoların stoğuna eklemen gerekmekte aynı zamanda kalan  zamanını da tutmalısın. Bu dataların anlık olarak güncellenmesi ve listede görülebilmesi gerekiyor.
TEKNİK BİLGİLER VE EKRANLAR  
1- UZAY ARACI OLUŞTURMA 
İlk açılışta gelen ekrandır  
-Bu ekranda bir köşede verilecek toplam puanın yazması (15) ve UI tarafında puanlara bir  güncelleme yapıldığında toplam puan kısmının yaptığımız değişikliğe göre güncel  kalması gerekmekte.  
-Uzay aracına bir isim verilebilmeli  
-Kalan puana, max - min değerlere göre kontrol mekanizmaları kurulmalı  -Bir buton ile ana ekrana gidilmeli
2-ANA EKRAN 
-Ana ekran içerisinde İstasyon Listesi ve Favori İstasyonlar arasında geçiş yapılabilmeli  
-Ana ekran içerisinde size verilen formüllerle(6.sayfa içerisinde bulunabilir) hesapladığınız UGS, EUS, DS ve Uzay  aracının hasar bilgisi olmalı ve seyahatler gerçekleştikçe bu bilgilerin güncellenmesi gerekmektedir.  
-Dayanıklık Süresi(DS)’ne göre belirli sürelerde hasarın 10birim olarak azalmalıdır. Yani her DS tamamlandığında  hasarın 10 azalmalıdır  
-Ana ekranda o an bulunduğumuz istasyon bilgisi bulunmalı ve favoriye ekleme işlemi yapılabilmelidir  -Ana ekranda İstasyon listesi size verilen api yardımıyla çekilmeli.  
-Ana ekranda search yapılabilmeli. Search için api değil kendi search mekanizmanızı kurmanız gerekmektedir.  
-Listeden seçilen istasyonlara seyahat edildiğinde ve malzeme bırakıldığında görev tamamlanmış olur. Tamamlanmı görevler deaktif olmalıdır.  
-Kalan zaman kalan görevlerdeki mesafeden kısa olursa, malzemeler belirtilen süre içerisinde dağıtılmış olursa ya daracın hasarı 0’a inerse dağıtım görevi tamamlanmış olur ve Dünya’ya dönülüp teslimat sonlandırılır. 
3 - FAVORİ İSTASYONLAR 
-Bu alanda favori istasyonlar listelenmeli. Favori ekleme ve çıkartmak için api  verilmeyecek olup kendi mekanizmanızı kurmanız gerekmektedir.  
-Favori listesinde istasyonların Dünya’ya olan uzaklığı, depo kapasitesi gibi bilgiler  olmalıdır 



API 
UZAY İSTASYONLARI 
https://run.mocky.io/v3/e7211664-cbb6-4357-9c9d-f12bf8bab2e2
GENEL KRİTERLER 
-Proje Adı, Adınız Soyadınız’ın MD5 encryption’ı olacak şekilde Github’a atılmalıdır. Online  MD5 generatorlar ile bu işlemi kolayca yapabilirsiniz.  
Örnek : “Ali Yılmaz”  
Proje Adı : 411389b2f02c115e60bd5e621011e992 
-Git kullanımı  
-Uygulamanın “3” gün içerisinde çalışır şekilde teslim edilmesi

IOS KRİTERLERİ 
Uygulama Swift dili kullanılarak yazılmalıdır.  
Minimum iOS versiyonu 10.0 olmalıdır.  
Geliştirme süresini kısaltmak için açık kaynaklı kütüphaneler kullanılabilir (Cocoapods vb)  Lokal veritabanı için kullanılacak yapı tercihinize bağlıdır.  
Dark Mode desteği olmalıdır.  
Apple native kütüphanelerini kullanmak artı olarak değerlendirilecektir.  OOP prensipleri takip edilmelidir. 

