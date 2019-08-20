echo "+================================+"
echo "+ pptp client command line linux +"
echo "+================================+"
#mobprobe ppp-generic
#apt-get install pptp-linux pptpd ppp curl
cat <<EOF > /etc/ppp/peers/dial-vpn
pty "pptp (ip address or host vpn server ) --nolaunchpppd"
lock
noauth
nobsdcomp
nodeflate
name ( username vpn )
remotename dial-vpn
ipparam dial-vpn
require-mppe-128
usepeerdns
defaultroute
persist
EOF
cat <<EOF > /etc/ppp/chap-secrets
username_vpn   dial-vpn        password_vpn
EOF
echo " You can connect vpn using : pon dial-vpn "
echo " You can disconect vpn using : poff dial-vpn "
