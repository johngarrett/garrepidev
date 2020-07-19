---
title: Ping in C++
image_url: /images/ping-cpp.png
abstract: ping rewritten in c++. Orignally done for a cloudflare internship. 
tags: c++, networking
---
## about
- written in C++, compiled and run on Arch Linux 5.6.3. See `writeup.md` for documentation and overview.
    - specifically, `g++ *.cpp *.h -Wall -std=c++14 -O3`
## requirements
- [X] accept a hostname or IP address as terminal arguments
- [X] send ICMP echo requests in an infinite loop
- report loss and rtt times
## extra credit
- support for ipv4 & 6
    - nmap makes you throw a -6 flag
- allow to set TTL as an argument
- any additional features
---
## scratch pad
- commands from ping
    - ~~`-a` audible ping~~
    - `-c` count, the amount of ping packets to send
    - `-D` print timestamps
    - `-h` help
    - ~~`-m` mark~~
    - `-q` queit, only show output at the end
    - `-p` packet size
    - `-V` version
---
## status
- [X] ping ipv4 hosts
- [X] listen for and filter responses
- [X] support ipv6
- [X] command line
    - [X] sanitization
    - [X] show help logs
    = [X] -q quiet
- ~~[ ] #ifdef if `<linux/icmp.h>` and `<linux/in.h>` are avaliable, `<netinet/ip_icmp.h>` if not~~
- ~~[ ] ncurses support ??~~
- [X] fix pid issue
- [X] fix sendto and recvfrom
- [X] reduce use of cstrings
- [X] conform to c++ conventions (camel case)
- [X] add data to packets
- [ ] impliment ttl for ipv6 packets
- [X] allow ping for hostname
- [X] track time for each packet
- [ ] support macOS compilation
- [ ] create man page
- [X] exceptions (include errno and handle)
- [X] print entire exception error
- ~~[ ] switch from icmp header to icmp packet~~
- [ ] fix iterator issue
    - [ ] infinite loop for unspecified iterations
- ~~[ ] checksum for ipv6~~
- [X] entire packet should be -s size not only the data
- [X] correctly parse out from recv
