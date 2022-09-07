FROM python:3.11-rc-bullseye

RUN useradd -rm -d /home/cloud-user -s /bin/bash -g root -G sudo -u 1001 cloud-user
WORKDIR /home/cloud-user

COPY ./* ./

RUN pwd &&\
    pip install -r requirements.txt &&\
    mv piera.py /usr/local/lib/python3.11/site-packages/piera/piera.py &&\
    chmod 777 run.sh &&\
    chmod 777 runCommand.sh

RUN curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-install-linux.tar.gz -o openshift-install.tar.gz &&\
    curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz -o openshift-client.tar.gz &&\
    tar -xzf openshift-install.tar.gz --directory /usr/local/bin &&\
    tar -xzf openshift-client.tar.gz --directory /usr/local/bin &&\
    rm -rf openshift-install.tar.gz &&\
    rm -rf openshift-client.tar.gz

USER cloud-user

CMD ["/home/cloud-user/run.sh"]
