#!/bin/bash

rsync -avzh --progress \
	--exclude '.git' \
	--exclude 'apply.sh' \
	./ ~/
