
FROM fedora23_utd

MAINTAINER stagiaire

# os update is already in fedora23_utd image
#RUN dnf update -y && dnf clean all

# python3 is already installed
# install pip
RUN dnf -y install python-pip
#yum install -y python-devel
# upgrade pip
RUN python3 -m pip install -U pip
#pip3 install --upgrade pip
# install flask
RUN pip3 install flask
# install flask plugins
RUN pip3 install flask_script flask_bootstrap flask_moment flask_wtf
# install git
RUN dnf -y install git

# create directory to receive source
RUN mkdir -p /home/dev
# move to source dir
WORKDIR /home/dev
# get app source core from git server
RUN git clone https://github.com/astondevops/web_server_flask

# open port
EXPOSE 5000

WORKDIR /home/dev/web_server_flask
ENTRYPOINT ["python3", "hello.py", "runserver"]
# starting web server on a public ip
#ENTRYPOINT ["python3", "hello.py", "runserver", "-h=0.0.0.0"]
