#!/bin/bash
date | sha512sum |sha256sum | head -c $(( (RANDOM %63) + 16 )) ; echo

