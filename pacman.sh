sudo pacman -S --needed s3cmd base-devel
echo "[narwal-arch]\nSigLevel = Optional TrustAll\nServer = https://s3.ap-south-1.amazonaws.com/$repo/os/$arch/" >> /etc/pacman.conf
s3cmd --configure
chmod 0600 ~/.s3cfg
mkdir -p repo
repo-add repo/narwal-arch.db.tar.xz
s3cmd sync --follow-symlinks --acl-public local-repo/ s3://narwal-arch/os/x86_64/
sudo pacman -Syy
