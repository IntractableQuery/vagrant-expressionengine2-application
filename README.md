# Vagrant Laravel Application
Basic development server for Laravel applications. Uses the standard Vagrant Ubuntu Precise base box (`precise64.box`).

## Requirements
As you might expect, in order for this to work you need:

1. [Vagrant][vagrant];
2. A Laravel 4 project.

[vagrant]: http://vagrantup.com/

## Configuration
You may customise the server for your application using the clearly marked "configurable properties" in the following files:

- `/Vagrantfile`
- `/puppet/modules/app/manifests/init.pp`

## Getting started
1. Download the repository ZIP file;
2. Unzip it;
3. Copy the files to the root of your Laravel 4 application;
4. Run `vagrant up`;
5. Wait a while.

### What it does
Creates a virtual machine running a basic LAMP stack, configured to work with your Laravel 4 application.

In addition to the standard LAMP installation, we:

- Create a database and user, as per the settings in `/puppet/modules/app/manifests/init.pp`;
- Install Composer globally;
- Install PHPUnit;
- Install some useful PHP extensions, including `mcrpyt` (required by Laravel), and `sqlite` (required for unit testing);
- Set the correct ownership and permissions on the `app/storage` directory.

### What it doesn't do
Modify your `/etc/hosts` file. You'll need to add your chosen development domain, as follows:

~~~~~
# /etc/hosts
127.0.0.1  my-project.dev
~~~~~

## Usage
The following example assume that your configurable properties are as follows:

- _Hostname_: `my-project.dev`
- _HTTP Port_: `8080`
- _SSH Port_: `2201`
- _Database Name_: `devdb`
- _Database User_: `devdba`
- _Database Password_: `devdba_password`

### Accessing the site via a browser
Assuming you've added the appropriate entry to your `/etc/hosts` file, you can access your site at `http://my-project.dev:8080/`.

### Accessing the database using Sequel Pro
You can connect to the database using Sequel Pro (or an equivalent piece of software) using the following settings:

- _Connection Type_: `SSH`
- _MySQL Host_: `127.0.0.1`
- _Username_: `devdba`
- _Password_: `devdba_password`
- _Database_: `devdb`
- _Port_: `3306`
- _SSH Host_: `localhost`
- _SSH User_: `vagrant`
- _SSH Key_: `~/.vagrant.d/insecure_private_key`
- _SSH Port_: `2201`

### Accessing the server via SSH
`cd` to the directory containing your `Vagrantfile` (the project root, unless you've done something unexpected), and run `vagrant ssh`.