FROM digitallyseamless/nodejs-bower-grunt

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install root ca
ADD digitallyseamless_root_ca.crt /usr/local/share/ca-certificates/ca.crt
RUN update-ca-certificates --fresh

# enable bash.bashrc for non-interactive
RUN sed -i 's/^\[ -z "\$PS1" \] && return/#&/' /etc/bash.bashrc

# install nvm
RUN curl https://raw.githubusercontent.com/DigitallySeamless/nvm/v0.24.0-system-globals/install.sh \
		| NVM_DIR=/usr/local/nvm bash && \
		echo 'source /usr/local/nvm/nvm.sh > /dev/null' >> /etc/bash.bashrc

# allow root to use bower
RUN echo 'alias bower="bower --allow-root"' >> /etc/bash.bashrc
