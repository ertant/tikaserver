apt-get update
apt-get install -y apt-utils

echo "#Installing tesseract"
apt-get -y -q install tesseract-ocr tesseract-ocr-eng tesseract-ocr-tur

curl https://www.apache.org/dist/tika/tika-server-1.20.jar -o tika-server-1.20.jar

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

echo "# Cleaning up"
apt-get clean

