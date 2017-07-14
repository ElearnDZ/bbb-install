# bbb-install

Install BigBlueButton 1.0 using the instructions at http://docs.bigbluebutton.org/10install.html, and optionally install the development environment and tools.

This is an interactive installation, even with the -y switch.  You cannot leave it unattended as you will need to confirm installation of some items and agree to licenses.

The installation process changes for each major release of BBB, so these scripts will require updating for BBB 1.1.

	bbb-install [-h] [-c] [-m extra-modules] [-p ffmpeg-ppa-url] [-n hostname-or-ip] [-s tls_hostname]
	where:
		-c = Do not enable SSL
		-e = Install haveged for increased entropy on virtual machines
		-h = Help
		-m <modules>  = Extra BBB modules to install, e.g. -m 'bbb-demo bbb-check'
		-p <ppa>      = PPA to use to install ffmpeg, e.g. -p mc3man/trusty-media
		-n <hostname> = BBB hostname or IP address (if not default)
		-s <hostname> = SSL hostname to use in configuration, if not default hostname
		-y = Answer Y to apt-get install

The script will try to install ffmpeg from source, as specified in the BBB installation instructions, if no PPA is supplied.  This is far slower than using a PPA.

The SSL certificate, key, and intermediate CA must be in ssl.crt, ssl.key, and ssl.ca in the same folder as the script.

The script is intended to be run by a non-privileged user with sudo rights.  Do not run the script through sudo.  It calls sudo when specified by the BBB instructions.  A typical invocation might be:

	./bbb-install -n `hostname -f` -s `hostname -f` -y -e

The development environment can be installed using dev-bbb-install.

	dev-bbb-install [-h] [-b gitrepo-url]
	where:
		-h = Help
		-b <url> = BBB GIT repository to clone, e.g. -b https://github.com/bigbluebutton/bigbluebutton
		-y = Answer Y to apt-get install

You must pass an upstream GIT repository for the script to clone.  This is most likely your fork of bigbluebutton/bigbluebutton.  An https URL is recommended as GIT will prompt you for a password if one is required.  With a git URL you may need to have keys set up to allow you access to the repository.

