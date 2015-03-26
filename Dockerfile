FROM digitallyseamless/nodejs-bower-grunt

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install root ca
ADD digitallyseamless_root_ca.crt /usr/local/share/ca-certificates/ca.crt
RUN update-ca-certificates --fresh
