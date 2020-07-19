---
title: Reimplimenting Ping in C++ using only the standard library 
date: 06/07/2020
image_url: /images/ping-cpp.png
abstract: Here's my attempt to reimpliment ping in C++. I have more experience with C but I thought this would benefit from an object oriented design. The majority of functions implemented are designed functionally and, thus, static. There were a few issues that are discussed in the future section that I plan to continually work on. 
tags: programming, c++, linux, networking
---

## Table of Contents
1. [Overview](#overview)
2. [Documentation](#documentation)
    - [Ping.cpp](#ping.cpp)
    - [Ping.h](#ping.h)

3. [Future](#future)
4. [Sources](#sources)

---

## Documentation
#### ping.cpp - discussed from top to bottom

`void ping::start_ping( . . . )`

- getpid() returns the pid of the current process. A bitwise and with 0xFFF is taken to limit the size of the pid.

    - this has to be limited because the id field on icmp packets can only hold up to a short of data. *CK*

- Printing out the results is the only time `printf` is used, I made an attempt to use `std::cout` across the board but using `cout` here resulted in unreadable and verbose code:

```cpp
std::cout << "\t" << destination << " ping stats \t\n";
std::cout << results.num_sent << " sent packets, " << results.num_recv << " received packets.";
std::cout << std::setprecision(2) << float(results.num_sent - results.num_recv) / float(results.num_sent) * 100 << "% packet loss.";
std::cout << "time: " << std::setprecision(2) << std::fixed << eplapsed_time.count() << "ms\n";
std::cout << "rtt min/avg/max: " << std::setprecision(2) << results.stats.min << "/" << std::setprecision(2) << results.stats.avg
```

`ping::PingResults ping::ping_destination( . . . )`  
- `setsockopt` requires different options depending on the IP protocol being used  
    - because an ICMP6 header has no option to set TTL, HOP LIMIT is set on the IPV6 raw socket  
    - filters are applied to both types of sockets to limit the amount of incoming packets we experience later on  

- rtt  
    - `std::vector<float> rtts` keep track of all rtt information for the statistics displayed at the end  
    - when viewing `/usr/include/netinet/ip_icmp.h` I noticed there is a response code for `ICMP_TIMESTAMPREPLY`. I tried exploring this further but couldn't find a way to reliably use this.  
        - the windows c++ networking libraries have icmp4 structs with timestamp fields but I couldn't find an equivalent in linux  
    - `std::chrono::high_resolution::clock::now()` is used to track the time delta inbetween sending a packet and receiving a packet  
        - when comparing with wireshark's logs, this yielded equivalent timestamps  
- `while(1)` send loop  
    - a while loop was used instead of a for loop to mimick the loop used later on when listening for replies  
        - "this should be infinite execution unless otherwise specified by the user (`params.packet_quantity` defaults to inf)"  
    - `std::this_thread::sleep_for(std::chrono::milliseconds(params.delay))`  
        - initially this was not included but when analyzing the behavior of the posix `ping` program, I noticed it was sleeping between sending packets  
        - implementing this improved read accuracy and the significance of calculated rtts  

`void ping::send_icmp_echo_packet ( . . . )`  
- the printed packet size is equal to the header size + the specified data size  
    - it makes more sense for the user to specify the size of the data instead of the overall packet  
- checksums  
    - ICMP6  
        -initially, I was calculating a separate checksum for the ICMP6 packets but was experiencing issues.  
            - when zeroing out this value I noticed, in wireshark, the checksum was being computed later on in the stack automatically  
    - ICMP4  
        - `memset(packet_ptr + header_size, 'J', data_size);` is occurring before constructing the icmp structs because ICMP4's checksum depends on the data being sent  

`unsigned short ping::listen_for_reply( . . . )`  
- `start_time` is passed over to ensure, on each loop iteration, that the max rtt was not exceeded  
- `if (d.type == IPV6)`  
    - no offset is used for icmpv6 because `recv` automatically crops out the incoming header  
    - `/usr/include/netinet/icmp6.h` specifies a lot of response codes, I only implemented ones I found relevant to pinging  
- `else if(d.type == IPV4)`  
    - `recv` does _not_ automatically crop out incoming headers so we they are offset with `bytes -= hlen;`  
    - `ICMP_ECHOREPLY` has a code of 0 but so does `ICMP_REDIR_NET`, `ICMP_EXC_TTL`, and `ICMP_NET_UNREACH`  
        - per wikipedia, I know that types 0-8 with a code of 0 are pertaining to ECHO replies/requests and a type of 3 and codes between 0-15 signify the destination is unreachable.  


`uint16_t ping::checksum( . . . )`  
- this computes the standard checksum for icmp4 packets  
- I was experiencing issues with odd number data lengths and found the solution to be adding a padding of 1 odd number checksum calculations  
    
#### ping.hpp - discussed from top to bottom  

`struct Parameters`  
The goal of my ping class is to be used by anyone or anything -- not just my driver program. Because of this, I made sure that the parameters were easily understandable for anyone interfacing with the class. I also included default values to indicate to the user what expected data ranges look like.  

`static void start_ping( . . . )`  
This is what the user of ping is expected to interface with. With no configuration, a programmer can pass in a hostname or IP address as a standard string and understand the results sent back.  

`static PingResults start_ping( . . . )`  
This is for the programmer that wants more extensibility from the ping classes. This returns a `PingResult` object that the user can manipulate however they see fit.  
- `PingResults` is sent back to allow more use cases  
    - If they only need to print the ping results, there is an implemented `.to_string()` function  

`struct Destination`  
It was hard following the conditional cases throughout `ping.cpp` that handled both IPV4 and IPV6 protocols. Containing all the information in a struct that can be passed around increased readability and extensibility.  
- `Destination(std::string address)`  
    - this tries to initialize a destination 3 different ways. By IPV4 address, by IPV6 address, and by hostname  
        - if all those fail, an `invalid_argument` is thrown  
    - `get_sock_addr()` allows functions to call `destination.get_sock_addr()` and `sizeof(destination.get_sock_addr())` without having to consider what kind of protocol to conform to  
    - `std::string readable_address` helps when displaying messages to the cleint. without having to convert from socketaddress or handle wether the user provided an address or a hostname, the destination can be displayed in a readable manner.  

`struct PingResults`  
The more advanced user will interface with this. There is a nested struct for tracking the RTT statistics and a function to output the results to string.  

---


## Future
- `setsockopt()`
    I managed to set socket options for ICMP6 using the following code:
    ```cpp
     if (dest.type == IPV6) {
        icmp6_filter filter;
        ICMP6_FILTER_SETBLOCKALL(&filter);
        ICMP6_FILTER_SETPASS(ICMP6_DST_UNREACH, &filter);
        if (setsockopt(sock, IPPROTO_ICMPV6, ICMP6_FILTER, reinterpret_cast<char *>(&filter), sizeof(filter)) < 0) {
            if (!params.quiet) std::cout << "Could not set filters for ICMP6... we will still continue\n";
        }
        if (setsockopt(sock, IPPROTO_IPV6, IPV6_RECVHOPLIMIT, &params.ttl, sizeof(params.ttl)) < 0) {
            if (!params.quiet) std::cout << "Could not set hoplimit for ICMP6... we will still continue\n";
        }
    }
    ```
    However, with the libraries I was using, I couldn't do the same for ICMP4 packets.
- no macOS compilation
- handling neighbor advertisements/requests
    Only rarely did I get these packets back but, when I did, I couldn't handle them. Wireshark shows that they contain an address pointing to the destination you _should_ send data to.
- Embedding time stamps in the packets
    - type 13/14 icmp4 packets with code 0 are for "timestamp request/replies"
    - Windows' library contains structs with these as field members but they don't appear on linux

---
## Sources
Non conclusive but these were the resources and websites I kept referencing.
- Linux man pages
- `/usr/include/netinet/*`
- `/usr/include/sys/socket.h`
- https://www.geeksforgeeks.org/socket-programming-cc/
- https://www.gta.ufrj.br/ensino/eel878/sockets/sockaddr_inman.html
- http://man7.org/linux/man-pages/man2/setuid.2.html
- https://linux.die.net/man/2/setsockopt
- http://www.skrenta.com/rt/man/raw.4.html
- https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol
- https://www.cymru.com/Documents/icmp-messages.html
- https://developer.lsst.io/cpp/api-docs.html
- https://www.geeksforgeeks.org/bitwise-operators-in-c-cpp/
- http://long.ccaba.upc.edu/long/045Guidelines/eva/ipv6.html
- https://tools.ietf.org/html/rfc2292#section-3.2
- https://labs.apnic.net/?p=1057


