#!/usr/bin/perl
print "\t\t########################################################\n\n";
print "\t\t#         Zone Hash Coded By Baki Enes Yalçın          #\n\n";
print "\t\t########################################################\n\n";
if(!@ARGV[1]){
print "\t\t\n";
print "\t\tusage: perl zone.pl <list_site.txt> <defacer>\n\n";
exit;

}
$arq = @ARGV[0];
$grupo = @ARGV[1];
chomp $grupo;
open(a,"<$arq");
@site = <a>;
close(a);
$b = scalar(@site);
for($a=0;$a<=$b;$a++)
{chomp $site[$a];
if($site[$a] =~ /http/) { substr($site[$a], 0, 7) =""; }
print "[+] sent $site[$a]\n";
use IO::Socket::INET;
$sock = IO::Socket::INET->new(PeerAddr => "www.zone-h.org", PeerPort => 80, Proto => "tcp") or next;
print $sock "POST /component/option,com_notify/Itemid,89/task,single/ HTTP/1.0\r\n";
print $sock "Accept: */*\r\n";
print $sock "Referer: http://www.zone-h.org/component/option,com_notify/Itemid,89/task,single/\r\n";
print $sock "Accept-Language: pt-br\r\n";
print $sock "Content-Type: application/x-www-form-urlencoded\r\n";
print $sock "Connection: Keep-Alive\r\n";
print $sock "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)\r\n";
print $sock "Host: www.zone-h.org\r\n";
$length=length("defacer=$grupo&domain=http%3A%2F%2F$site[$a]&method=22&reason=5&option=com_notify");
print $sock "Content-Length: $length\r\n";
print $sock "Pragma: no-cache\r\n";
print $sock "\r\n";
print $sock "defacer=$grupo&domain=http%3A%2F%2F$site[$a]&method=22&reason=5&option=com_notify\r\n";
close($sock);
}
