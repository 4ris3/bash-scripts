#!/bin/bash

echo "Put folder path to backup:"
read BACKUP_FOLDER_PATH
echo
echo "Check your PATH $BACKUP_FOLDER_PATH (y/n)"
read YES_NO
YES_NO=$(echo "$YES_NO" | tr '[:upper:]' '[:lower:]') 

if [ "$YES_NO" = "y" ]; then

    if  [ -d "$BACKUP_FOLDER_PATH" ]; then
        echo "Directory exists, now we made some magic..."
        FOLDER_NAME=$(basename "$BACKUP_FOLDER_PATH")
        echo "Make /backup/$FOLDER_NAME"
        sudo mkdir -p /backup/$FOLDER_NAME/

    else 
        echo "Wrong path"
    fi

elif [ $YES_NO = "n" ]; then
    echo "Canceled"
else
    echo "Invalid input. Please enter 'y' or 'n'"
fi