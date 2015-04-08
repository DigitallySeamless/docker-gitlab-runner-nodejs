FROM digitallyseamless/nodejs-bower-grunt

# setup env
ENV BASH_ENV ~/.bashrc
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install nvm
RUN curl https://raw.githubusercontent.com/DigitallySeamless/nvm/v0.24.1-system-globals/install.sh | bash && \
		sed -i 's;nvm\.sh"  # This loads nvm;nvm.sh" \&> /dev/null  # This loads nvm;' ~/.bashrc

# install root ca
RUN curl https://raw.githubusercontent.com/DigitallySeamless/docker-gitlab-runner-nodejs/master/digitallyseamless_root_ca.crt \
		> /usr/local/share/ca-certificates/DIGITALLY_SEAMLESS_ROOT_CA.crt && \
		update-ca-certificates
