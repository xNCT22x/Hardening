Installation :
  apt install iptables-persistent -y
  
Basic Usage :
  iptables -A INPUT => Untuk Input Sebuah Rule
  iptables -I INPUT => Untuk Input Sebuah Rule dengan Memprioritaskan
  iptables -D INPUT => Menghapus Sebuah Rule
  
Chain :
  INPUT   => Memasukan Rule
  FORWARD => Meneruskan Sebuah Rule
  OUTPUT  => Memasukan Output dari Rule
 
Protcol :
  TCP
  UDP
  ICMP

Port :
  21  => Port FTP
  22  => Port SSH
  25  => Port SMTP
  53  => Port DNS
  80  => Port HTTP
  etc

Jump  :
  ACCEPT  => Membolehkan port tersebut mengakses
  DROP    => Tidak memperbolehkan port tersebut bisa diakses
  LOG     => Membuat port tersebut menjadi port log
  REJECT  => Menolak rule tersebut untuk akses
  etc

Default Policy :
  iptables -P INPUT DROP
  
Example :
  iptables -A INPUT -p tcp --dport 22 -j ACCEPT
  iptables -A OUPUT -p tcp --sport 22 -j ACCEPT
  iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.2 -j ACCEPT
  iptables -A FORWARD -p tcp --sport 80 -d 172.16.20.50 -j ACCEPT
  
Prioritas Permission :
  iptables -I INPUT -p tcp --dport 53 -j ACCEPT
  iptables -I INPUT 2 -p tcp --dport 80 -j ACCEPT  => Rule diatur di urutan ke dua

Reset Iptables :
  iptables -F

Save and Restore Iptables :
  iptables-save > iptables.conf
  iptables-restore < iptables.conf
