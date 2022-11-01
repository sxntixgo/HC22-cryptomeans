#!/bin/bash

echo $1 | base64 | tr 'A-Z' 'a-z'