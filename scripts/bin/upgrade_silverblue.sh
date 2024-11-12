#!/bin/bash

VERSION="${1}"

rpm-ostree rebase fedora:fedora/"${VERSION}"/x86_64/silverblue
