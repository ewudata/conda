# #!/bin/sh
# yum install epel-release -y
# yum install httpd mod_wsgi -y
# yum install -y https://centos7.iuscommunity.org/ius-release.rpm
# yum install -y python36u python36u-libs python36u-devel python36u-pip
# pip3.6 install --upgrade pip
# pip3.6 install virtualenv
# mkdir /opt/djangoproject
# cd /opt/djangoproject
# virtualenv djenv
# source djenv/bin/activate
# pip install django

# echo "source djenv/bin/activate" >> /home/vagrant/.bashrc

# cd django_shared/
# django-admin.py startproject mysite
# cd mysite
# python manage.py runserver 0.0.0.0:8000