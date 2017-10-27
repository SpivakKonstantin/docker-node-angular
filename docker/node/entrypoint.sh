#!/bin/bash

cwd=$(pwd)
cd app &&
npm install


cd $cwd

exec "$@"
