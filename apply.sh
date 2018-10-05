#!/bin/bash

git submodule init
git submodule update --recursive

rsync -avzh "./home/" "$HOME/"
