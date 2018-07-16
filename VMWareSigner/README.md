### Purpose
Simple script that automates the process of generating keys to sign the VMWare network drivers.

Create a new folder in an appropriately secured folder and run this script from that folder.

_Updated:_ **NO LONGER MAINTAINED**
Due to the lack of verification for linux downloads e.g. sum or hash files, verifiable public key & because the VMWare system subsequently puts dkms modules into the load sequence, I've moved away from VMWare.
If you have to build and sign the UEFI modules there should be some verification that the code was issued from who it says it was.
The script can be canabalised for use with other modules you wish to sign and apply via MOK so I won't delete it entirely. If you have a root CA-backed enterprise CA to issue the certs for the target machine this can replace the certificate generation steps.

### Reason Needed
Because the drivers run within the OS they must be authorised to start at boot - if you're running UEFI and secure boot this would normally be prevented.

Basically we generate an X509 which is then used to authenticate the drivers to secure boot (via MOKutil). Either use your organisations existing internal / system security X509 or generate them for the task.

Use passwords for the private certificate and keep them away from public access. If your keys are compromised and you download malicious software which is signed you may inadvertantly add root kits to your systems.  

### NB
1. Do *Not* run this script and use the outputs without first configuring it to your own specifications. The example certificate generation is not intended for actual use.
2. You will need to re-sign the two VMWare drivers everytime the kernel is updated. 
