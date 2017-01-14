#!/usr/bin/env bash


# openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=mIT01/"

for f in $(dirname $(modinfo -n vboxdrv))/*.ko;
  do echo "Signing $f";
  /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $f;
done

# /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo vboxdrv)
#
# /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo vboxguest)
#
# /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo vboxnetadp)
#
# /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo vboxnetflt)
#
# /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo vboxpci)
#
# /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo vboxsf)
#
# /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo vboxvideo)

mokutil --import MOK.der
