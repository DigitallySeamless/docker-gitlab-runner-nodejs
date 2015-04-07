FROM digitallyseamless/nodejs-bower-grunt

# setup env
ENV BASH_ENV ~/.bashrc
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install nvm
RUN curl https://raw.githubusercontent.com/DigitallySeamless/nvm/system-globals/install.sh | bash && \
		sed -i 's;nvm\.sh"  # This loads nvm;nvm.sh" \&> /dev/null  # This loads nvm;' ~/.bashrc

# install root ca
ADD digitallyseamless_root_ca.crt /usr/local/share/ca-certificates/DIGITALLY_SEAMLESS_ROOT_CA.crt
RUN update-ca-certificates --fresh
