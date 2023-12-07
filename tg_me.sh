wget -O/tmp/tg_new.tgz https://github.com/jbrown21122/Tiny-Gen/raw/master/tg_majestic.tgz
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
