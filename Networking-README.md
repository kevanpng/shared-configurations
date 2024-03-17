
# TODO 
## onprem
- [ ] Setup a private CA on desktop

## Cloud


# Notes
## replace systemd-resolved with Coredns on local desktop
so that I can add hosted zone here

Executed these steps and it works.

Local desktop stop using systemd-resolved to resolve DNS, and it now uses coredns that is working locally backed by cloudflare 
https://dev.to/n1try/how-to-enable-dns-over-tls-on-ubuntu-using-coredns-18mp
https://github.com/coredns/deployment/tree/master/systemd

How systemd-resolved works
https://wiki.archlinux.org/title/systemd-resolved

How coredns works 
https://coredns.io/plugins/file/

How to test dns
https://superuser.com/questions/1647407/how-to-properly-test-a-local-dns-server-locally

to reverse the steps, just execute the reverse of the above link.

adding zone entry to coredns and configuring the  authoritative  nameserver for that zone
https://superuser.com/questions/1647407/how-to-properly-test-a-local-dns-server-locally
https://coredns.io/manual/toc/#configuration

setting permanent resolveconf
https://www.tecmint.com/set-permanent-dns-nameservers-in-ubuntu-debian/

Problem: When there is nameserver 127.0.0.1 on the /etc/resolv.conf and /etc/resolveconf/resolv.conf.d/head , it will tell the desktop that 
dns should be resolve on localhost (because there is a coredns server running). However, how K0s cluster works is that it will copy the host's /etc/resolv.conf and put that configuration into the 
coredns of the cluster so that it can resolv ip using the desktop. However, since there is this loopback entry in etc/resolve.conf, the coredns in the cluster will loopback
into itself, which creates an infinite loop, crashing the coredns pod. 
solution: change the 127.0.0.1 entry into the private ipv4 address of the desktop so that it is still pointing to the coredns server ip but without being loopback.
the risk is that the ip of the desktop need to be static, which is done by setting on the router.



## static ips
ingress at 192.168.18.40
desktop at 192.168.18.39
if ip address of istio ingress change, update kevan.home.db 
/etc/coredns/kevan.home.db

all the configurations are specified here. where are all the logs, errors, working dir
https://github.com/coredns/deployment/tree/master/systemd


https://www.tecmint.com/set-permanent-dns-nameservers-in-ubuntu-debian/


## Squid proxy

managed to use it as a proxy for multiple devices, including phone.
but never managed to see the caching for static websites having cache hit.
perhaps the test wasnt done properly, need to repeat the test with other
image websites or bundles.

BIG PROBLEM -> does not support wss websockets , so code-server crashed.
squid proxy has no plans to support that as well. so this means that
it cannot be used as a proxy for workloads that need WSS.