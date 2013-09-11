set1.pcap
---------

1. **How many packets are there in this set?**  
    276

2. **What protocol was used to transfer files from PC to server?**  
    FTP and FTP-DATA

3. **Briefly describe why the protocol used to transfer the files is insecure?**  
    FTP is insecure because everything is sent in the clear (i.e. unencrypted). This means that someone can piece together all the packets to get the file that was sent.

4. **What is the secure alternative to the protocol used to transfer files?**  
    You could use SFTP or SCP to securely transfer files.

5. **What is the IP address of the server?**  
    67.23.79.113

6. **What was the username and password used to access the server?**  
    user: stokerj  
    pass: w00tfu!

7. **How many files were transferred from PC to server?**
    3 files

8. **What are the names of the files transferred from PC to server?**  
    code.rtf  
    secret.pdf  
    acb.jpg

set2.pcap
---------

10\. **How many packets are there in your set?**
    74566

11\. **How many plaintext username-password pairs are there in this packet set?**
    3 from POP  
    5 from TELNET (but they all failed)

12\. **Briefly describe how you found the username-password pairs.**
    I searched for the string "pass" in all the packets. Once I figured out which protocols were sending usernames and passwords in plaintext I limited to those protocols and counted the pairs.

13. **For each of the plaintext username-password pair that you found, identify the protocol used, server IP, the corresponding domain name (e.g., google.com), and port number.**  
    
    USER | PASS | PROTOCOL | IP | DOMAIN | PORT  
    e129286 | 4.Ekkama | POP | 67.128.149.178 | | 110  
    mbergeson@hjnews.com | mb123on | POP | 67.128.149.178 | | 110  
    brewer | 1qazxsw209simona12 | POP | 67.173.185.22 | | 110  
    cisco | chris10 | TELNET | 200.60.17.1 | lacnic.net | 23  
    cisco | chelita | TELNET | 200.60.17.1 | lacnic.net | 23  
    cisco | chayank | TELNET | 200.60.17.1 | lacnic.net | 23   
    cisco | cereza | TELNET | 200.60.17.1 | lacnic.net | 23  
    cisco | buburuza | TELNET | 200.60.17.1 | lacnic.net | 23    
    

IMPORTANT NOTE: PLEASE DO NOT LOG ON TO THE WEBSITE OR SERVICE ASSOCIATED WITH THE USERNAME-PASSWORD THAT YOU FOUND!

14. **Of all the plaintext username-password pairs that you found, how many of them are legitimate? That is, the username-password was valid, access successfully granted?**  
    All the POP username-password pairs seem to be legitimate except for the first one (e129286 - 4.Ekkama). Every TELNET username-password failed.

15. **How did you verified the successful username-password pairs?**  
    I followed the TCP stream and could see whether or not the server responded with an "authentication successful" sort of message.

16. **In a few words, explain why I asked you not to log on to websites or services associated with the username-password pairs that you found.**  
    Chances are that those accounts are compromised right now, seeing as the data in the pcap makes it very easy to find those accounts. In the case of the TELNET usernames, it looks like someone was trying to bruteforce a password on their server, so it would be pointless.

17. **What advice would you give to the owners of the username-password pairs that you found so their account information would not be revealed "in-the-clear" in the future?**  
    USE AN ENCRYPTED FORM OF COMMUNICATION!!!

For problems 18 and 19 I repurposed commands from http://blog.spiderlabs.com/2012/12/pcap-files-are-great-arnt-they.html which I found through a Google search for tshark commands.

18. **Provide a listing of all IP addresses with corresponding hosts (hostname + domain name) that are in this PCAP set. Describe your methodology.**  
    I used the tshark command "tshark -r set2.pcap -q -z hosts,ipv4"  
    (results can be found in file iphosts.txt)
    
19. **Provide a summary of the all protocols used. What was the most popular protocol used? Describe your methodology.**  
    I used the tshark command "tshark -r set2.pcap -q -z io,phs"  
    (results can be found in file protocols.txt)  
    The most popular protocol used was the ethernet protocol, which is on top of the hierarchy. This makes sense because every protocol eventually needs to use the ethernet protocol to actually transfer data.

20. **A fun question: what other interesting things did you find in this PCAP set (e.g., files)?**  
    I found a few pdfs of things from the SANS institute InfoSec Reading Room that had
    been transferred over FTP.
