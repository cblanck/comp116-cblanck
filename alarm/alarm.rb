require 'packetfu'
include PacketFu

stream = PacketFu::Capture.new(:start => true, :iface => 'wlan0', :promisc => true)

inc_num = 1
alert_str = "%d. ALERT: %s from %s (%s)!"

stream.stream.each do |p|
    pkt = Packet.parse p
    payload = pkt.payload()
    protocol = "Unknown"
    if pkt.is_a? TCPPacket
        protocol = "TCP"
        if pkt.tcp_header.tcp_flags.to_i() == 0
            puts alert_str % [inc_num, "NULL scan is detected", pkt.ip_saddr(), "TCP"]
            inc_num += 1
            next
        elsif pkt.tcp_header.tcp_flags.to_i() == 0b101001
            puts alert_str % [inc_num, "Xmas scan is detected", pkt.ip_saddr(), "TCP"]
            inc_num += 1
            next
        elsif pkt.tcp_dst() == 80
            protocol = "HTTP"
            if (payload =~ /4\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/) or
            (payload =~ /5\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/) or
            (payload =~ /6011(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/) or
            (payload =~ /3\d{3}(\s|-)?\d{6}(\s|-)?\d{5}/)
                puts alert_str % [inc_num, "Credit card leaked in the clear", pkt.ip_saddr, protocol]
                inc_num += 1
            elsif (payload =~ /<script>alert\('XSS'\);<\/script>/im)
                puts alert_str % [inc_num, "XSS attack detected", pkt.ip_saddr, protocol]
                inc_num += 1
            end
        end
    elsif pkt.is_a? ICMPPacket
        protocol = "ICMP"
    elsif pkt.is_a? UDPPacket
        protocol = "UDP"
    end
    if (payload =~ /pass/im)
        puts alert_str % [inc_num, "Password leaked in the clear", pkt.ip_saddr, protocol]
        inc_num += 1
    end
    if (payload =~ /nmap/i)
        puts alert_str % [inc_num, "Nmap scan detected", pkt.ip_saddr, protocol]
    end
end
