#!/bin/bash

dnf upgrade --refresh;
dnf update -y;
dnf distro-sync -y;
