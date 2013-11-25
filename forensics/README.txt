1. To figure out which image was different, we simply used "diff" to find the
odd one out. Once we figured out that "a.jpg" was different, we used steghide as
was mentioned in class to see if there was any information hidden in the image.
After trying a few random passwords, we decided to enter a blank passphrase and 
successfully uncovered another image hiding in "a.jpg" labeled "prado.jpg" that
is another image of Norman Ramsey.

2. 

1) The disk has two partitions, the first is FAT16 and the other is ext4.

2) There is no phone carrier involved.  From bash history, one of the first
commands run was “raspi-config.”  We concluded that raspberry pis do not have
phone carriers.

3) Version number is usually in /etc/.  In this case we found the OS under 
/etc/debian_version.  It is Kali Linux 1.0.

4) Teeth and metasploit are installed in /opt/. Based on the bash history of 
root, it looks like triggerhappy, parted, tor and tightvncserver are installed.

5) Using /etc/passwd- and /etc/shadow- we cracked the root password with 
john the ripper. The root password is “toor”, this is a bad password.

6) There are no other accounts aside from daemon accounts (eg, mySQL, postgres)

7) We found a few dozen pictures using photorec and testdisk.  A fair number of 
these are pictures of Celine Dion, both as an adult and as a child.  There is 
also a single questionably pornographic photo of a woman with a ball gag.  
Many of them were located in /root/pictures.  The perp also has a collection of 
upcoming tour dates and a receipt for a ticket purchase.  We also found a 
spotify station link which links to her album.

8) He deleted all the files in the home directory, all the files in /etc/ and 
several photos in /root/ including new{1,2,3}.jpg and receipt.pdf. He also
moved his dropbox file to be hidden.

9) We could not find any encrypted files, although we found evidence of truecrypt
being installed on the system.

10) Using testdisk we found that there was receipt.pdf in the /root/ directory, but 
testdisk was unable to recover it. Using photorec, we recovered the receipt. 
The suspect saw Celine Dion at The Colosseum at Caesars Palace, Las Vegas, NV. 
He sat at section 2NDMZ4, row E, seat 408. 

11) We didn't really understand the FAT16 partition and why it existed. We're not
sure what else could be considered "peculiar" especially relative to the strange
images on the sd card.

12) Based on the upcoming tour dates, the receipt, and the photos, we concluded that
the perp is stalking Celine Dion.

