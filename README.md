**Narwal-Arch CustomArch Linux Repository**


Welcome to the Narwal-Arch custom Arch Linux repository! This repository provides a curated collection of packages that are not available in the official Arch Linux repositories but may be useful or interesting to Arch Linux users.

How to Use this Repository
To use the Narwal-Arch repository, you need to add the repository's link to your Arch Linux package manager configuration.

Add the Narwal-Arch Repository
Open your favorite package manager configuration file (/etc/pacman.conf) with a text editor as root:

sudo nano /etc/pacman.conf


Add the following lines at the end of the file:

**[narwal-arch]
SigLevel = Optional TrustAll
Server = https://s3.ap-south-1.amazonaws.com/$repo/os/$arch/
**

Save the file and exit the text editor.

Update Package Database
After adding the repository, it's essential to update your package database:

**sudo pacman -Sy**


Install Packages
You can now install packages from the Narwal-Arch repository using pacman. For example, to install a package called plasma-narwal, run:

**sudo pacman -S plasma-narwal**


Stay Up to Date
To keep the packages from the Narwal-Arch repository up to date, make sure to regularly update your system with:


**sudo pacman -Syu**


Contributing
We welcome contributions to the Narwal-Arch repository! If you have packages that you believe would be valuable to the Arch Linux community, please feel free to submit pull requests to our repository on GitHub.

Issue Reporting
If you encounter any issues or have suggestions for improving the repository, please open an issue on our GitHub repository.

Disclaimer
Please note that the Narwal-Arch repository is a community-driven effort and not affiliated with the official Arch Linux project. While we strive to maintain the quality of the packages in this repository, we cannot guarantee their safety or compatibility. Use packages from this repository at your own risk.

Happy Arching! 🐧
