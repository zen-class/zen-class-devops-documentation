# Networking

<p> Computer networking refers to the practice of connecting multiple computers and devices together to enable communication and the sharing of resources. It involves the design, implementation, and management of hardware and software components that facilitate data transmission and exchange between networked devices.</p>

### Here are some key aspects of computer networking:
<ol>
<li>Network Topologies: Network topologies define the physical or logical arrangement of devices in a network. Common topologies include star, bus, ring, mesh, and hybrid configurations.</li>


<li>Network Protocols: Network protocols are sets of rules and conventions that govern how devices communicate and exchange data over a network. Protocols determine aspects such as data format, error handling, addressing, routing, and security.</li>


<li>IP Addressing: IP addressing is a system for identifying and addressing devices on a network. It uses IP (Internet Protocol) addresses, which consist of a unique numeric code assigned to each device. IPv4 and IPv6 are the most commonly used IP addressing schemes.</li>


<li>Switches and Routers: Switches and routers are networking devices that facilitate the flow of data between devices on a network. Switches enable the creation of local area networks (LANs) by connecting devices within a confined space, while routers connect multiple networks and enable data routing between them.</li>


<li>Network Security: Network security focuses on protecting networked systems and data from unauthorized access, misuse, and threats. It involves measures such as firewalls, encryption, access controls, intrusion detection systems, and vulnerability management.</li>


<li>Wireless Networking: Wireless networking enables devices to connect to a network without physical wired connections. It relies on technologies like Wi-Fi (Wireless Fidelity) and Bluetooth, allowing for flexibility and mobility in device connectivity.</li>


<li>Network Services and Applications: Networks provide various services and applications, including file sharing, printing, email, web browsing, video conferencing, remote access, and cloud computing. These services rely on network infrastructure to enable communication and resource sharing.</li>


<li>Network Management: Network management involves monitoring, troubleshooting, and optimizing network performance and reliability. It includes tasks such as network monitoring, configuration management, performance analysis, and capacity planning.</li></ol>

Computer networking is essential for businesses, organizations, and individuals to connect devices, share information, and access resources efficiently. It enables the internet, intranets, and local networks to function, supporting a wide range of applications and services that facilitate communication, collaboration, and data transfer.

# OSI Model
<p>The Open Systems Interconnection (OSI) model is a set of standards that defines how computers communicate over a network. In the OSI model, data flow gets broken down into seven layers that build upon each other. Each layer uses data from the layer before it and serves a specific purpose in the broader network communication.</p>

The OSI model works from the bottom up, beginning from layer 1 (Physical) and ending with the top layer 7 (Application). The top layer is the most direct point of user interaction with the OSI model—if you’re reading this article on a device, you’re working on the 7th layer at this very moment.

![shutterstock_508948102-1](https://github.com/zen-class/zen-class-devops-documentation/assets/36299748/23683353-27c0-4896-ae01-d3e76ce8e3df)
### Layer 1: Physical
The Physical layer handles raw data within physical media. That raw data is made up of bit of information and the Physical layer converts those into electrical signals that define certain aspects of a piece of physical media. For example, Physical layer specifications may define aspects like voltage levels, transmission distances, and cable standards. You find Physical-layer specifications in technologies like Bluetooth and Ethernet.

### Layer 2: Data Link
The Data Link layer takes data in the form of electrical signals (frames) and delivers them across members (nodes) of a single network. Data Link frames only operate on a local network and do not cross the boundaries into other networks.

The Data Link layer can also detect and recover transmission errors by attaching extra information containing an error detection code to a given frame. When that frame is sent across the network, its receiver checks the received frame by matching the extracted data with the code.

### Layer 3: Network
A Network describes the entire ecosystem of subnetworks and other networks that are all connected to each other via special hosts called gateways or routers. The Network layer works with routes (paths from one network to another). The Layer determines the most effective route to convey information. Sometimes, the message you’re trying to send is particularly large. In this case, the network may split it into several fragments at one node, send them separately, and reassemble them at the destination node.

### Layer 4: Transport
The Transport layer protocols provide host-to-host communication services for applications. It is responsible for connection-oriented communication, reliability, and flow control. Connection-oriented communication uses a pre-established connection between hosts as a pathway for communicating between applications. Some protocols of the Transport layer are connection-oriented, but some protocols of this layer are not connection-oriented and instead transfer data end-to-end without the need for connection.

### Layer 5: Session
The Session layer controls connections, whether that’s keeping an eye on possible connection losses or temporarily closing or re-opening connections depending on their frequency of use. The protocols of the Session layer try to recover any connection losses when they happen. It also optimizes connections: if a connection is not used for a long period, Session-layer protocols may close it and re-open it later. These protocols also provide synchronization points in the stream of exchanged messages, or in other words, spots for large messages to momentarily regather and make sure they’re all on the same page.

### Layer 6: Presentation
The Presentation layer also called a Syntax layer, ensures that the recipient of the information can read and understand what it receives from another system; the information is presented in a legible way. Processes such as data encoding, compression, and encryption happen on this layer.

### Layer 7: Application
The OSI model’s top and final layer is the Application layer. The Application layer displays the data in the correct format to the end-user—you! This includes technologies such as HTTP, DNS, FTP, SSH, and much more. Almost everyone interacts with the protocols of the Application layer on a day-to-day basis.

# Network Troubleshooting Tools


 ```bash
# Ping command to check connectivity
ping 192.168.0.1

# Display IP configuration
ipconfig /all

# Trace route to a destination host
traceroute www.example.com

# Perform DNS lookup
nslookup www.example.com

# Display network statistics and connections
netstat -a

# Display ARP cache
arp -a

# Configure network interface
ifconfig eth0 up

# Display IP routing table
route -n

# Securely connect to a remote server
ssh username@192.168.0.1

# Connect to an FTP server
ftp ftp.example.com
