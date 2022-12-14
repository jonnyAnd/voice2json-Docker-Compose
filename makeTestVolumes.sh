#!/bin/bash

VOLUME_PARENT_FOLDER="./volumes/"
VOLUME_STORAGE_FOLDER="./volumes/storage"

initialise(){ 

    VOLUME_PARENT_FOLDER_EXIST=$(doesDirExists $VOLUME_PARENT_FOLDER)

    if [ "$VOLUME_PARENT_FOLDER_EXIST" = true ] ; then

        echo "A volume folder is already setup!"
        echo "Do you want to delete this and make again (all container files will be lost)"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) deleteAndCreateVolumeFolders; break;;
                No ) exit;;
            esac
        done

    else
        echo "Volume folder not found."
        createVolumeFolders
    fi
}

deleteAndCreateVolumeFolders(){
    rm -rf $VOLUME_PARENT_FOLDER
    createVolumeFolders
}

createVolumeFolders(){
    echo "Creating Volume folders"
    mkdir $VOLUME_PARENT_FOLDER  ##./volumes
    mkdir $VOLUME_STORAGE_FOLDER ##./volumes/storage
}

doesDirExists(){
    if [ -d $@ ] 
    then
        echo "true" 
    else
        echo "false"
    fi
}


setWorkingDirToScriptLocation(){
    ## just to make sure this script works in the folder its in rather than where you run it from.
    cd "$(dirname "$0")"
}



## --- Startup ---
setWorkingDirToScriptLocation
initialise $1
