#!/bin/bash

read -p "Username: `echo $'\n> '`" VAULT_USERNAME
read -sp "Password: `echo $'\n> '`" VAULT_PASSWORD

#obtaintoken
export VAULT_TOKEN=TOKENVAULT

#obtain git user and passs
export GIT_USERNAME=GITUSERNAME
export GIT_PASSWORD=GITPASSWORD

echo "\n"
/bin/bash
