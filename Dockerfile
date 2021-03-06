FROM digitallyseamless/nodejs-bower-grunt

# setup env
ENV BASH_ENV ~/.bashrc
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# configure npm
RUN echo 'unsafe-perm = true' >> /root/.npmrc

# install nvm
RUN curl https://raw.githubusercontent.com/DigitallySeamless/nvm/v0.25.4-system-globals/install.sh | bash && \
		echo -e '#!/bin/bash\n[[ -f "/root/.nvm/nvm.sh" ]] && . /root/.nvm/nvm.sh && nvm "$@"' > /bin/nvm && \
    chmod +x /bin/nvm

# install root ca
RUN curl https://raw.githubusercontent.com/DigitallySeamless/docker-gitlab-runner-nodejs/master/digitallyseamless_root_ca.crt \
		> /usr/local/share/ca-certificates/DIGITALLY_SEAMLESS_ROOT_CA.crt && \
		update-ca-certificates
