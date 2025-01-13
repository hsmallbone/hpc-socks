Simple script to port forward HTTP servers in a SLURM environment.

Usage
=====
Place ssh_generator.sh on the SLURM login node. 

Set the project name and HTTP port in your sbatch and ssh_generator.sh

Connect to your SLURM environment using a SOCKS proxy. For example, in Mac OS set the SOCKS proxy in Settings > Wi-Fi > Details > Proxies > SOCKS proxy (default port 9999) then use `ssh -D 9999 hsmallbone@remote-host`

Run your SLURM script and run ssh_generator.sh on the **login node**. This could be done within your SLURM script as long as you SSH to the login node.

Connect to the application port on your computer via localhost
