wget -O/tmp/tg_new.tgz https://github.com/jbrown21122/Tiny-Gen/raw/master/Tiny-Gen-Cleaned_Go4.tar.z 
mkdir /usr/local/tinygen
cd /usr/local/tinygen
cp /tmp/tg_new.tgz .
tar -xzvf tg_new.tgz
rm -f tg_new.tgz
rm -f /usr/local/tinygen/tg_new.tgz
#patch files
mkdir /tmp/patch
wget -O/tmp/patch/patch.gz https://github.com/jbrown21122/Tiny-Gen/raw/master/patch_files.gz
cd /tmp/patch
tar -xzvf patch.gz
mv sasan_majestic.sh /usr/local/tinygen/.sasan.sh
mv currywurst /usr/local/tinygen/.curry_wurst
mv enter /usr/local/tinygen/.enter
cp /usr/local/tinygen/AlexaWget.CentOS.sh /usr/local/tinygen/AlexaWget.CentOS.sh.Alexa
mv /tmp/patch/AlexaWget.CentOS.sh /usr/local/tinygen/AlexaWget.CentOS.sh
mkdir /tmp/urls
sed -i s'|/etc/profile.d/pi.logo/|/usr/local/tinygen/.curry_wurst|g' /usr/local/tinygen/new_sasan
sed -i s'|Pgcc|tgcc|g' /usr/local/tinygen/new_sasan
sed -i s'|PiNY|TINY|g' /usr/local/tinygen/new_sasan
#latter fixes 1/1/2024
mv /usr/local/tinygen/.sasan.sh /usr/local/tinygen/.sasan.bak
mv /usr/local/tinygen/new_sasan /usr/local/tinygen/.sasan.sh
