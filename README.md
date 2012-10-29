Remix Raspian with a tasty dose of TurnKey Linux. Bring TKL's appliance genius to the Raspberry Pi.

Raspliance-core (http://github.com/ghoulmann/Raspliance-core) tries to make the perfect server appliance platform for the Raspberry Pi. It chucks everything unnecessary out - that includes sudo. The result is as close to TurnKey Linux's Core 12.0 (Squeeze) as I could manage. (http://turnkeylinux.org/core).

With Raspliance Core ready - apply Raspliance-LAMP-Stack to approximate Turnkey Linux's 32-bit LAMP 12.0 (http://turnkeylinux.org/lamp).

LAMP: Linux, Apache, MySQL, and PHP. Just like TKL, this appliance serves webmin (straight from TKL, themes and all) on port 12321, shellinabox (a web-based shell) on port 12320.

In addition, it relies on TKL's inithook system to prompt for passwords for root and mysql's admin user on restart (also certs are regenerated).

SSH is served on 22 per convention.

Although intended to work headlessly (sans display), this patch includes TKL's confconsole, which displays the hostname, ip address, and ports of each service.

Assuming you're working from a fresh Raspbian/Raspian install, start be enabling ssh.

Don't get attached to the default user, pi. Login for a moment, then do sudo passwd root to set a password for root. Logout; then log in as root, either with SSH or directly.

Install git: apt-get update && apt-get install git -y. It'll take a moment.

---Compile TKLPATCH---

Do this:

  cd /tmp
  
  git clone git://github.com/ghoulmann/Raspliance-core.git
  
  cd Raspliance-core
  
  ./compile_tklpatch.sh (installs necessary packages and compiles TKLPatch, TKL's software dev kit); you are now able to do this:

---Create Raspliance-Core---

Do this:

tklpatch-apply / Raspliance-core/  (which means, apply the patch called Raspliance-core to the root of the filesystem); it takes a long time as it strips out packages then installs new packages and their dependencies.

---Create Raspliance-LAMP-Stack---

Go back to tmp:

  cd /tmp

Clone the patch from github to your tmp directory:  

  git clone git://github.com/ghoulmann/raspliance-LAMP-Stack.git

Apply the patch:

  cd raspliance-LAMP-Stack

  tklpatch-apply / Raspliance-LAMP-Stack/
