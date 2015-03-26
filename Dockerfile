FROM digitallyseamless/nodejs-bower-grunt:0.8

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install root ca
ADD digitallyseamless_root_ca.crt /usr/local/share/ca-certificates/DIGITALLY_SEAMLESS_ROOT_CA.crt
RUN update-ca-certificates --fresh
