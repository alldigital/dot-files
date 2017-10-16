#!/bin/sh

site=$1

wget --mirror --convert-links --adjust-extension --page-requisites --no-parent $site
