#Docker_FileStorageWeb/Dockerfile
FROM base
RUN yum install libjpeg-devel giflib-devel freetype-devel libreoffice
xorg-x11-server-Xvfb.x86_64 -y \
        && yum groupinstall Fonts -y

#pdf2swf
COPY swftools-0.9.1.tar.gz swftools-0.9.1.tar.gz
RUN tar zxf swftools-0.9.1.tar.gz \
        && cd swftools-0.9.1 \
        && ./configure \
    && make \
        && make install 

#pdfminer
COPY pdfminer-20140328.tar.gz pdfminer-20140328.tar.gz
RUN tar zxf pdfminer-20140328.tar.gz \
        && cd pdfminer-20140328 \
        && python setup.py install

EXPOSE 8261

CMD /FileStorageWeb/FileStorageWeb
