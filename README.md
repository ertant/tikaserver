# tikaserver
This repo contains the Dockerfile to create a docker image that contains the Apache Tika 1.20 Server on Port 9998 using Java 8.

Out-of-the-box the container also includes dependencies for the GDAL and Tesseract OCR parsers.  To balance showing functionality versus the size of the image, this file currently installs the language packs for the following languages:
* English
* Turkish

To install more languages simply update the apt-get command to include the package containing the language you required, or include your own custom packs using an ADD command.

## Usage

First you need to pull down the build from Dockerhub, which can be done by invoking:

    docker pull 6kare/tika

Then to run the container, execute the following command:

    docker run -d -p 9998:9998 6kare/tika

## Building

To build the image from scratch, simply invoke:

    docker build -t 'docker-tikaserver' github.com/ertant/tikaserver
   
You can then use the following command (using the name you allocated in the build command as part of -t option):

    docker run -d -p 9998:9998 tikaserver

## Rest API

After docker image is executed you can call tika server with following rest calls.

### PDF text extraction

    PUT localhost:9998/tika HTTP/1.1
    Content-Type: application/pdf
    X-Tika-OCRLanguage: eng

    <pdf binary>
    
### Image OCR
    
    PUT localhost:9998/tika HTTP/1.1
    Content-Type: image/jpeg
    X-Tika-OCRLanguage: tur

    <jpeg binary>

## Excel Spreadsheet

    PUT localhost:9998/tika HTTP/1.1
    Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet

    <xslsx binary>

## More

For more info on Apache Tika Server, go to the [Apache Tika Server documentation](http://wiki.apache.org/tika/TikaJAXRS).
