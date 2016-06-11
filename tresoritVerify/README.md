###Purpose
Found the vendor documentation quite lengthy and can see that new versions will need verification. 

And I'll constantly forget how this run package is composed over the period between versions; this script makes it easier to manage.

Bit concerned that the pub key needs to be verified regularly (not taken care of in this script)

####Steps
- Download the tresorit_installer.run from https://tresorit.com/download/linux
- Run this script passing path to installer as 1st param

####TO-DO
- ~~Allow script param of installer path~~
- See if I can figure out a way to curl or wget the Tresorit public key
