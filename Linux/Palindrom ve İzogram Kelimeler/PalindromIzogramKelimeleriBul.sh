#!/bin/bash
#AD SOYAD: ZÜLAL İSKENDER
#-------------------------------------------------------------

palindromlariBul()
{
uzunluk=0; #Kelimenin uzunluğunu almak için kullandım.
enUzun=0; #en uzun kelimeyi bulup uzunlugunu bir değişkene atamak için kullandım. 
sayac=0; #Dosyanın içerisinde kaç adet palindrom kelimenin olduğunu bulmak için kullandım.
enUzunKelime=""; #en uzun kelimeyi yazdırmak için bu değişkeni oluşturdum.
for ((i=0;i<$a;i++)) #Bu dongüde kelimeleri dosyanın içerisinden teker teker almak için kullandım.
do
        #echo ${file[i]} #dosyanın içeriğini listeler.
        kelime=${file[i]} #bu değişkenimi kelimeyi almak için kullandım .
	#echo "------------------------------------------------------------------"
        #echo "kelime=" $kelime #test etmek amaçlı kelimeyi yazdırmak için kullandım.
        kelimeUzunlugu=$(expr length $kelime) #Döngü her dondüğünde yeni kelimeye gecer ve ben her yeni kelime üzerinde işlem yapmak için bu  değişkeni kullandım.
        x=$(($kelimeUzunlugu)) #bu değişkeni kelimenin harflerini tersten sırasıyla almak ve bir diziye atamak için kullandım.
	uzunluk=$(($kelimeUzunlugu)) #bu değişkenime kelimenin kaç karakterden oluştugunu atadım.
        y=0; #bu değişkenimi altta oluşturdugum harf1 ve harf2 dizilerinin teker teker artarak ilerlemesini sağlamak için kullandım.
        #echo "uzunluk= "$kelimeUzunlugu #değerleri görmek için ekrana yazdırma amaçlı kullandım.
        toplam=0; #bu değişkenimi harflerin palindrom olup olmadığını kontrol amaçlı kullandım.Eğer kelime ve kelimenin tersi sorgulanırken aynı sıradaki harfler eşitse toplam değişkenim artacak.
        harf1=(); #Döngü her dömesinde dizimin içini boşaltmak için kullandım.Bu yüzden boz dizi deklerasyonunu kullandım.
        harf2=(); #Döngü her dömesinde dizimin içini boşaltmak için kullandım.Bu yüzden boz dizi deklerasyonunu kullandım.
        for ((j=1;j<=$kelimeUzunlugu;j++)) #Bu döngümü kelimenin harflerini teker teker bir diziye atamak için kullandım.
        do

                #echo "x=" $x 

                harf1[$y]=$(expr substr $kelime $j 1) #harf1 dizisini kelimemin harflerini teker teker almak için kullandım.
                harf2[$y]=$(expr substr $kelime $x 1) #harf 2 değişkenimi kelimenin harflerini tersten almak için kullandım.

                ilk=${harf1[y]} #har1 dizisine atadığım harfi bu değişkene atadım.
                son=${harf2[y]} #harf2 dizisine atadığım harfi bu değişkene atadım.
                #echo "ilk=" $ilk "son=" $son

                if [ "$ilk" = "$son" ] #bu koşulumda değişkenlere atadığım harflerin aynı olup olmadığını kontrol ettim.
                then
                        ((toplam++)) #koşulum geçerliyse toplamı artırdım . Bunun sebebi toplam kelimenin uzunluğuna eşit olacak mı bunu anlamak için kullandım.
		fi



                ((x--)); #bu değişkenimi azaltmamın sebebi kelimeyi tersten alırken bir önceki harfe geçmek istemem.
                #echo "hafr1=" ${harf1[$y]}
                #echo "harf2=" ${harf2[$y]}
		((y++)); #harf1 ve harf2 dizilerinin indekslerini artırmak için kullandım.

        done

        if [ $toplam -eq $kelimeUzunlugu ] #Bu koşulum kelimenin uzunluğunun toplama eşit olup olmadığını test etmek için kullandım.
        then
                ((sayac++)); #sayacı artırmamın sebebi bu koşula giren kelimenin palindrom bir kelime olması.
                #echo $kelime "palindromdur.";


                                if ((enUzun<uzunluk)) #Bu koşulumu ise palindrom kelimelerimin arasında en uzununu bulmak için oluşturdum. 
                                then
                                        enUzun=$uzunluk #enUzun değerimi bu koşula giren kelimenin uzunluğuyla değiştirdim.
                                        enUzunKelime="$kelime" #bu koşula giren en uzun kelimemi bu değişkene atadım.
                                        #echo "uzun="$enUzunKelime
                                fi
        fi
	#echo "toplam=" $toplam;
	#echo "kelime=" ${harf1[@]}
	#echo "kelimenin tersi=" ${harf2[@]}
done
echo "Toplamda " $sayac "tane palindrom kelime vardır."; #Toplamda kaç tane palindrom kelime oldugunu çıktı ekranına yazdırdım.
echo "En uzun palindrom kelime" $enUzunKelime "dir." #Buldugum en uzun palindrom kelimeyi çıktı ekranına yazdırdım.
}

izogramlariBul()
{

sayac=0; #Kaç tane izogram kelime olup olmadıgını bulmak için kullandım.
uzunluk=0; #Kelimenin uzunluğunu almak için kullandım.
enUzun=0; #en uzun kelimeyi bulup uzunlugunu bir değişkene atamak için kullandım.
enUzunKelime=""; #en uzun kelimeyi yazdırmak için bu değişkeni oluşturdum.
for ((i=0;i<$a;i++)) #Dosyanın içerisindeki verileri kelime kelime alıp aldığım kelimelerin harflerini tek tek bir diziye atamak ve atadığım dizinin içerisinde harf kontrolü yapmak için kurdugum döngü.
do
        kelime=${file[i]} #Kelimeleri tek tek alıp harflerini bir diziye atacağım için bu değişkeni kullandım .,
        #echo "------------------------------------------------------------------"
        #echo "kelime=" $kelime
        kelimeUzunlugu=$(expr length $kelime) #Döngü her dondüğünde yeni kelimeye gecer ve ben her yeni kelime üzerinde işlem yapmak için bu  değişkeni kullandım.
        uzunluk=$(($kelimeUzunlugu)) #bu değişkenime kelimenin kaç karakterden oluştugunu atadım.
        toplam=0; #bu değişkenimi kelimenin harflerinin tekrarlı olup olmadığını kontrol etmek için kullandım .Eğer tekrar ederse artacak.
        y=0; #harfler dizisinin indekslerinin alttaki for döngüsü her döndüğünde artarak ilerlemesini sağladım .Üste bulunan döngü döndüğünde ise bu indeks değerini sıfırladım.
        harfler=(); #Üstteki döngüm her donduğunde yeni bir kelimeye geçtiği için kelimenin harflerini aldığım dizinin içini boşaltmak için boş dizi deklreasyonunu kullandım.
        for ((j=1;j<=$kelimeUzunlugu;j++)) #Kelimenin harflerini tek tek bir diziye atadığım döngü.
        do
                harfler[$y]=$(expr substr $kelime $j 1) #kelimenin harflerini teker teker bu diziye atadım.
                #harf=${harfler[y]} 
                #echo "harf=" $harf
                ((y++)); #dizimin indeks değerini artırdım.
        done
        #echo "dizi=" ${harfler[@]}

        for((k=0;k<$kelimeUzunlugu;k++)) #Bu döngüde harf1 değişkenini oluşturudum.Kelimenin harflerini gene aynı kelimenin harfleriyle kıyaslamak için kullandım.
        do
                harf1=${harfler[k]} #Kelimenin harflerini baştan sona sırayla bu değişkenime atadım .Döngü her döndüğünde değeri değişiyor.
                for((t=0;t<$kelimeUzunlugu;t++)) #bu döngümü üstteki döngümden aldığım her harf1 değişkenini bu döngüde oluşturdugum harf2 değişkeniyle kıyaslaması için oluşturdum.
                do
                        harf2=${harfler[t]} #harf1 değişkeniyle kıyas yapmak için kullandım.
                        if [ $k -ne $t ] && [ "$harf1" = "$harf2" ] #bu koşulumda aynı kelimenin harflerini kıyasladığım için aynı indis değerine sahip olmayan ,harf1 ve harf2 değişkeninin eşit olduğu bir koşul oluşturdum.
                        then
                                        ((toplam++)); #Eğer aynı indiste olan harfler birbirine eşitse bu kelime izogram kelime olmadığı için toplam değikenimi artırdım.Toplam değişkenim sıfır kaldığı sürece kelimem izogram olmaya devam eder.
                        fi


                done
        done

        #echo "toplam=" $toplam;
        if [ $toplam -eq 0 ] #eğer toplam değişkenimin değeri sıfır ise döngüdeki kelime izogram bir kelime demektir.
        then
                #echo $kelime "izogram bir kelimedir.";
                ((sayac++)); #sayacı dosyamın içerisinde kaç tane izogram kelime oldugunu bulmak için kullandım.


                                if ((enUzun<uzunluk)) #izogram kelimelerimin en uzununu bulmak için kelimenin uzunluğunu bir önceki kelimeyle kıyasladım.
                                then
                                        enUzun=$uzunluk #eğer şuanki kelimem daha uzun ise enUzun değişkenime şuanki kelimemin uzunluğunu atadım.
                                        enUzunKelime="$kelime" #bulduğum kelimenin değerini bu değişkenime atadım.
                                        #echo "uzun="$enUzunKelime
                                fi
        
        fi
done
echo "Toplamda" $sayac "tane izogram kelime vardır." #dosyanın içerisinde kaç tane izogram kelime olduğunu çıktı ekranıma yazdırdım.
echo "En uzun izogram kelime" $enUzunKelime "dir." #dosyamdaki en uzun izogram kelimeyi çıktı ekranıma yazdırdım.


}

#-------------------------------------------------------------

if (($#!=1)) #girilen argüman sayısının 1 olmadığı durumu kontrol ettim.
then
	echo "HATA: Argüman sayısı 1 tane olmalıdır."; #koşula uyuyorsa bu hata mesajını verdim.
elif [[ ! -f $1 ]] #bu koşulumda ise girilen argümanın geçerli dosya adı olup olmadığını kontrol ettim.
then
	echo "HATA: Geçerli dosya adı girilmelidir."; #koşula uyuyorsa bu hata mesajını verdim.
else #yukarıdaki hiçbir koşula uymuyorsa programın çalıştığı ana kısmı bu kısıma yazdım.
	
	file=(`cat $1`) #bu işlemle dosyamın içerisindeki kelimeleri file dizisine atadım.
	a=0; #bu değişeknimi for döngüsünün kaç defa döndüğünü tespit etmek için kullandım.
	for i in ${file[@]} #dizinin içerindeki kelimelri teker teker döndürüyor.
	do

	        ((a++)); 
	        #echo $i;
	done

	palindromlariBul $a $file #bu alt fonksiyonuma kaç kelimenin oldugu bilgisini ve dizinin içerindeki değişkenleri atadım.
	izogramlariBul $a $file #bu alt fonksiyonuma kaç kelimenin oldugu bilgisini ve dizinin içerindeki değişkenleri atadım.
	echo "Toplam kelime sayısı" $a "dır." #Buldugum toplam kelime sayısını çıktı ekranına yazdırdım.
fi


#-------------------------------------------------------------


