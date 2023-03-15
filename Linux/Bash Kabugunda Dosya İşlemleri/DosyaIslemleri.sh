#!/bin/bash
#AD-SOYAD: ZÜLAL İSKENDER
#NUMARA: 180707088
#BÖLÜM: BİLGİSAYAR MÜHENDİSLİĞİ
#DERSİN ADI: KABUK PROGRAMLAMA
#DERSİN KODU: MBM1-351
#DERSİN VERİLDİĞİ AKADEMİL DÖNEM: 2022-2023 GÜZ DÖNEMİ
#PROJENİN NUMARASI: 1
#DERSİ VEREN ÖĞRETİM GÖREVLİSİNİN ADI: DENİZ DAL
#-------------------------------------------------------------

indeks="$(expr index "$1" ".") " #uzantıyı belli ede nokta işaretinin kaçıncı indekste bulunduğunu bulmak için indeks değişkenine indeksi bulan işlemin çıkardığı değeri atadım.
uzunluk="$(expr length "$1")" #Dosyanın uzunluğunu bulmak i.in uzunluk adında bir değişken oluşturdum ve bu değişkene uzunluğu bulan işlemin çıkardığı değeri atadım.

((indeks=indeks-1)); #İndeksin değerini nokta ve uzantısı olmadan dosyanın adını almak için azalltım.
dosyaAdi="$(expr substr "$1" 1 $indeks)" #Dosyanı uzantısı olmadan dosyaAdi adlı değişkene atadım.

((indeks=indeks+1)); #İndeks değişkenini dosyanın uzantısını noktayla beraber almak için artırdım.
dosyaUzantisi="$(expr substr "$1" $indeks $uzunluk)" #Dosyanın adı olmadan dosyanın uzantısını dosyaUzantisi adlı değişkene atadım.



#-------------------------------------------------------------

if test -f $1 #Burada Kabuk Programına arguman olarak girilen dosyanın varlıgını sorguluyor.
then
        echo -n "";  #Eğer dosya var ise bu blokta ,
elif test $? -ne 0 #Eğer sıfır değerini vermiyor ise bu dosyanın var olmadığını belirtir , bunun için bu kod blogunu kullandım.
then
        echo "HATA: Geçerli dosya adı girilmelidir."; #Eğer dosya yok ise blokta çalışıyor.
fi

#------------------------------------------------------------------------


#-------------------------------------------------------------
if (($#!=2)) #Argüman sayısınının 2 ye eşit olup olmadığını kontrol etmek için kullandım.
then #eşit değilse hata mesajını vermesini sağladım.
        echo "HATA: Argüman sayısı 2 tane olmalıdır.";
else #Eğer argüman sayısı 2 taneyse aşağıdaki işlemlerin gerçekleşmesini sağladım.
#-------------------------------------------------------------

#if test $2 -lt 0   #Kabuk Programına giren 2. argümanın pozitif bir sayı olup olmadıgını kontrol ettim.
#then
#        echo "HATA: Girilen 2. argüman pozitif bir sayı olmalıdır.";	#Bu bloğu kullandığımda negatif bir ondalıklı sayıda hata verek çalışıyordu bu yüzden bundan sonraki kullandığım if-else bloğunda,
									#Herhangi bir karakter oluşturması halinde negatif veya ondaklıklı sayı oldugu anlaşılan değerin hata mesajını else bloğunda verdim.
#fi

#------------------------------------------------------------------------

#DOSYANIN KAÇ SATIRDAN OLUŞTUGUNU ÖĞRENMEK İÇİN YAZDIĞIM KOD BLOGU.
	a=1;  #Dosyadak satır sayısını öğrenmek için kullandığım değişken.Bu değişkeni dosyayı gezen while döngüsünde kullandım.
	while read line #Dosyayı satır satır okumak için kullandım.
	do
        	((a=a+1));
	done < $1

#------------------------------------------------------------------------
	AltTire="_"; #Oluşturuduğum dosyaların adından sonra kaçıncı dosya olduğunu gösteren sayıyı dosya adından ayırarak göstermek için kullandığım değişken.

	echo $2 >sayi.txt #Girilen 2.Argümanın sayısal değerini bir dosyaya aktardım.
	grep "^[0-9]*$" sayi.txt > tamSayi.txt #Aktardığım sayının tam sayı olup olmadığını kontrol ettim .
#Kullandığım grep komutu içinde sadece sayısal karakteri kabul ediyor ve eğer değer sadece tam sayı ise l.txt adlı dosyaya değeri aktarıyor.

	z=0; #Bu değişkeni l.txt dosyasının içinde bir değer olup olmadığını kontrol etmek için kullandığı değişken.
	while read line #l.txt adlı dosyanın içerisindeki satır sayısını bulmak için kullandığım kod bloğu.
	do
        	((z=z+1));
	done < tamSayi.txt



	if test $z -eq 1 #Eğerki l.txt adlı dosyanın içerisine bir satır atanmış ise bu 2.Argümanımız pozitif bir tam sayıdr demektir. Ve ardından ana işlemimizi gerçekleştirdim.
	then


		if test $2 -gt $a #Kabuk Programına giren 2. argümanın dosyadaki satır sayısınan büyük olup olmadığını kontrol etmek için kullandım.
		then
        		echo "HATA: Girilen 2. argüman sayısı dosyanın satır sayısından büyük olmamalıdır.";
	

		else #Girilen 2. argüman sayısı 1.argümanın satır sayısından büyük değil ise dosyları oluşturup işlemlerimi yaptım. 

	        	b=0; #Bu değişkeni 1.Argüman olarak girilen dosyanın satır sayısının 2.Argüman olarak girilen pozitif tam sayıyla bölümünü bulak için oluşturudum.
	        	k=0; #Bu değişkeni ise 1.Argüman olarak girilen dosyanın satır sayısının 2.Argüman olarak girilen pozitif tam sayıya bölümünden kalan sayıyı bulmak için kullandım.
	        	((b=$a/$2)); #Dosyanın satır sayısıyla 2. argümanın bölüm işlemi.
	        	((k=$a%$2)); #Dosyanın satır sayısıyla 2. argümanın kalan işlemi.
			
	
        		for ((i=1;i<=$2;i++)) #Bu kod bloğunda girilen 2.Argüman kadar dosya oluşturdum.(touch komutuyla)
        		do
	                	touch $dosyaAdi$AltTire$i$dosyaUzantisi #En üst tarafta oluşturduğum değişkenleri burada kullandım.
	        	done

	
        #----------------------------------------------------------------
        		sayac=1; #Bu sayac değişkenini olmuşturmamın sebebi aşağıdaki while döngüsünü b değişkeni kadar döndükten sonra 1. argümandan gelen verileri diğer dosyaya aktarımını sağlamak için kullandım.
        		x=1; #bu değişkeni oluşturmamın sebebi b değişkeni kadar döngü döndükten sonra aktarılan dosyalarındeğerini artırmak için kullandım.
				while read line #Burada 1.Argüman olarak girilen dosyayı satır satır okuma işlemi yaptım.
        			do
					if (($x<=$2)) #Dosyalara aktarma işlemi girilen 2.Argüman sayısına erişene kadar devam etmesi gerektiğinden bu if blogunu yazdım.
					then	      #Bu if bloğunu yazmasaydım eğer kendiliğinden yeni dosyalar oluşturmaya devam etme ihtimali doğardı.
                				
						echo $line >> $dosyaAdi$AltTire$x$dosyaUzantisi; #Oluşturdugum dosyalara sırasıyla b değişkeni kadar veri göndermek için bu kod satırını kullandım.
				
                				if test $sayac -eq $b #eğer sayac değişkenim b değişkenine eşit ise bir sonraki değişkene geçmek için x deişkenini artırdım ve sayaca tekrardan 1 değerini versim.
                				then
                        				sayac=1;
              						x=$((x+1));
                				else					
                	        			sayac=$((sayac+1)); #sayacı b değişkenine eşit olana kadar bu blokta artırdım.
                				fi
					fi
        			done < $1 


	#----------------------------------------------------------------
			son=$2; #Bu değişkene 2.argümandaki girilen pozitif tam sayıyı aktardım.
                	if test $k -ne 0 #eğer 1.argümandaki dosyanın satır sayısının 2.Argümandaki pozitif tam sayıya bölümünden kalan değer 0 a eşit değilse ,
                	then
                        	tail -n $k $1 >> $dosyaAdi$AltTire$son$dosyaUzantisi; #tail fonksiyonuna aktardığım sondan b değişkeni kadar olan verileri daha önce oluşturduğum son dosyaya ekledim.
	        	fi
	#----------------------------------------------------------------
		fi

	else
        	echo "HATA: Girilen değer pozitif bir tam sayı olmalıdır."; #Eğer 2.argüman olarak girilen değer negatif ise veya herhangi bir karakter içeriyorsa bu hata mesajını vermesini istedim.
	fi
#------------------------------------------------------------------------
fi

