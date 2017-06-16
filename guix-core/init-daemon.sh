addgroup guixbuild
addgroup guix-builder
mkdir -p /gnu/store
chgrp guix-builder -R /gnu/store
chmod 1775 /gnu/store

builders=10

for i in `seq 1 $builders` ; do
  adduser -S guix-builder$i guix-builder
  adduser guix-builder$i guix-builder
done
