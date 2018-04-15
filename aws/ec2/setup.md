## Setup

### Create an instance

1. Login and go EC2 with region: Tokyo
2. Launch Instance
3. Select Amazon Linux AMI
4. Tag: name : hogehoge
5. Open ports 80 and 22

### Connect

1. Open EC2 dashboard, select an instance and push *Connect*

```
$ cd <A path exists .pem>
$ chmod 400 <.pem>
$ ssh -i <.pem> ec2-user@<ec2-...ap-northeast-1.compute.amazonaws.com>
```

Warning: 最初に`ec2-user@`をつけないと接続できません。これはログインユーザーを指定するものです。

[https://stackoverflow.com/questions/18551556/permission-denied-publickey-when-ssh-access-to-amazon-ec2-instance](https://stackoverflow.com/questions/18551556/permission-denied-publickey-when-ssh-access-to-amazon-ec2-instance)

> Use the ssh command to connect to the instance. You'll specify the private key (.pem) file and user_name@public_dns_name. For Amazon Linux, the user name is ec2-user. For RHEL5, the user name is either root or ec2-user. For Ubuntu, the user name is ubuntu. For Fedora, the user name is either fedora or ec2-user. For SUSE Linux, the user name is root. Otherwise, if ec2-user and root don't work, check with your AMI provider.

### Setup for Amazon Linux AMI

At first, 

```
[ec2-user@< > ~]$ sudo yum update -y
```

### Setup web daemen

Setup the web daemon and start when booted

```
[ec2-user@< > ~]$ sudo yum -y install httpd php mysql
[ec2-user@< > ~]$ sudo service httpd start
[ec2-user@< > ~]$ sudo chkconfig httpd on
```

To create,

```
[ec2-user@< > ~]$ sudo vim /var/www/html/index.html
```
```html
<html>
Hello, world!!
</html>

```

And you can see the page after access `<ec2-...ap-northeast-1.compute.amazonaws.com>` from any browsers
