
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



## static ips
ingress at 192.168.18.40
desktop at 192.168.18.39
if ip address of istio ingress change, update kevan.home.db 
/etc/coredns/kevan.home.db

all the configurations are specified here. where are all the logs, errors, working dir
https://github.com/coredns/deployment/tree/master/systemd