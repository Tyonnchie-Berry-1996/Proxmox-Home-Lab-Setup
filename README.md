## High-Level Homelab Diagram

```mermaid
%%{init: {
  'theme':'base',
  'flowchart': { 'useMaxWidth': false },
  'themeVariables': { 'fontSize': '18px' }
}}%%
flowchart LR
    internet(("Internet"))
    vpn["Network Switch &\nVPN Router\n(MAC filtering + Firewall rules + Port Forwarding + DDNS)"]
    bridge["Proxmox Linux bridge\n(Wired connection)"]

    internet --- vpn --- bridge

    %% MIDDLE: SERVERS
    subgraph servers["Proxmox Servers\n(3 nodes)"]
        node1["Node 1\n48 x Intel Xeon E5-2680 (NUMA)\nQuadro M2000\n2.5G NIC"]
        node2["Node 2\n4 x Intel Core i5-6500T @ 2.50GHz\n8 TB NFS\nLVM: 5 TB LV + 3 TB local"]
        node3["Node 3\n4 x Intel Core i5-6500T @ 2.50GHz\n8 TB NFS\nexFAT + virtual FS + cloud drive"]
    end

    %% RIGHT TOP: CLUSTER VMs
    subgraph vm_cluster["Cluster"]
        winvm["Windows VM\nGame emulation\nTrading algos\nLive TV + Adobe"]
        jellyfin["Ubuntu Jellyfin VM\nLocal Netflix + Live TV\nHW acceleration for transcoding"]
        kali["Kali Linux VM\nPrivate GPT\nLite AI tests"]
        filecloud["Ubuntu FileCloud VM\nCloud drive backend\nStorage hub for VPN devices"]
    end

    %% RIGHT BOTTOM: OFF-CLUSTER / TRI-DRIVE
    subgraph offcluster["Off-Cluster / NFS"]
        tridrive["exFAT partition"]
        triway["Virtual file system layer"]
        trinow["Cloud drive export"]
    end

    %% FLOW
    bridge --> servers

    node1 --> vm_cluster
    node2 --> vm_cluster
    node3 --> offcluster
