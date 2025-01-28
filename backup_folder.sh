#!/bin/bash

echo "Put folder path to backup:"
read BACKUP_FOLDER_PATH
if [ ! -d "$BACKUP_FOLDER_PATH" ]; then
    echo "Wrong path"
    else

        echo
        echo "Check your PATH: $BACKUP_FOLDER_PATH (y/n):"
        read YES_NO
        YES_NO=$(echo "$YES_NO" | tr '[:upper:]' '[:lower:]') 
        echo
        BACKUP_DATE=$(date +'%d-%m-%Y-%R')

        if [ "$YES_NO" = "y" ]; then

            if  [ -d "$BACKUP_FOLDER_PATH" ]; then
                echo "Directory exists, now we made some magic..."
                FOLDER_NAME=$(basename "$BACKUP_FOLDER_PATH")
                FULL_BACKUP_PATH="backup/$FOLDER_NAME/$FOLDER_NAME-$BACKUP_DATE"
                    if [ -d "$FULL_BACKUP_PATH" ]; then
                    echo "Backup already exists. Wait one minute before you create next backup."
                        else
                            sudo mkdir -p /backup/$FOLDER_NAME/$FOLDER_NAME-$BACKUP_DATE
                            echo "Done! /backup/$FOLDER_NAME/$FOLDER_NAME-$BACKUP_DATE"
                    fi
            fi

        elif [ $YES_NO = "n" ]; then
            echo "Canceled"
        else
            echo "Invalid input. Please enter 'y' or 'n'"
        fi
fi