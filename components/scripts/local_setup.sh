#!/usr/bin/env bash
################################################################################
# Name           | Description                                   | Version
################################################################################
# local_setup.sh | Moves environment specific files             | 1
#                | from var/<environment>/terraform to           |
#                | components/terraform and removes copied files |
################################################################################
# Usage - run from top level of repo ./componenets/scripts/local_setup.sh

################################################################################
# Script prompt
################################################################################
echo
echo -e "\033[1;34m Local Terraform Setup \033[0m"
echo ----------------------------------------------------------
read -p "Enter environment name: " ENVIRONMENT

################################################################################
# Variables
################################################################################
TERRAFORM_DIRECTORY="components/terraform"
VARIABLES_DIRECTORY="components/terraform/var/$ENVIRONMENT"

################################################################################
# Directory Check
################################################################################
echo
echo "Current Terraform directory: $TERRAFORM_DIRECTORY"
[ ! -d "$TERRAFORM_DIRECTORY" ] && echo "Directory $TERRAFORM_DIRECTORY DOES NOT exist."
echo "Current Terraform variables directory: $VARIABLES_DIRECTORY"
[ ! -d "$VARIABLES_DIRECTORY" ] && echo "Directory $VARIABLES_DIRECTORY DOES NOT exist."

################################################################################
# Move Block
################################################################################
cp -r $VARIABLES_DIRECTORY/* $TERRAFORM_DIRECTORY/.
