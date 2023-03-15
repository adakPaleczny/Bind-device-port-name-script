# Bind-device-port-name-script
Bash script giving device port static name
## Alias for a port bash script
bind_device_script.sh is a bash script making alias for device port. To use that script you have to have executable privilege and run as a root. For changing file permision use: 
```bash
   chmod u+x bind_device_script.sh
```
To use script write that commed in terminal *where system_port_name* is e.g. *ttyUSB0* and *name_you_give* is your alias e.g. *USB* 
```bash
   sudo ./bind_device_script.sh system_port_name name_you_give
```
