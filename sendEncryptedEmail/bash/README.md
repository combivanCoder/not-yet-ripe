### General
1. You will need to use the full path to the pub key and output .bin if you are running the command under different users (e.g. root crontab)
2. The sendEncryptedMail command can be run by any user but only users with write permission to the folder the first time; as it needs to generate the binary version of the ASCII pub key first

#### Crontab
1. Can be called from crontab using the following
```
PATH=<usual paths>:/opt/send # or wherever you're putting the script
MAILTO=recipient@domain.com # backup for plain text outputs where you're not piping the 
                            # output to sendEncryptEmail

# send everything to pipe (stderr + stdout)
0 5 * * * /path/script 2>&1 | sendEncryptedMail "Carefully worded subject"

# send only if the stderr has a result
0 5 * * * /path/script 2>&1 > /dev/null | sendEcnryptedMail "Carefully worded subject"
```
#### Encapsulation 
1. Can be called from other scripts by path, by encapsulating in function and sourcing into another script etc
