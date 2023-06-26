#!/bin/bash
printDetails() {
    echo ""
    echo "Infrastructure details"
    echo "-----------------------------------------------------"
    echo ""
    echo "Service               Connection                  User Password"
    echo "PostgreSQL:           Port: 5438                  admin pass"    
    echo "PGAdmin:              http://localhost:8071"
    echo ""
    echo ""
    echo ""
}

chooseAction() {
    echo "--- Choose your docker compose action ---"
    select action in "up" "stop" "pull" "rm" "delete-volumes" "follow-logs" "show-status";
    do
        ACTION=$action	    
        break;
    done
}

printDetails
chooseAction


if [ $ACTION == "show-status" ];
then            
    docker-compose ps
    echo ""    
    docker-compose images
elif [ $ACTION == "delete-volumes" ];
then    
    echo "Delete Volumes"    
    docker-compose down --volumes
elif [ $ACTION == "follow-logs" ];
then
    echo "Follow Logs"    
    docker-compose logs --follow
elif [ $ACTION == "stop" ];
then
    echo "Stop all containers"    
    docker-compose stop
else
    echo "--- Choose your profile ---"
    select profile in all only-db
    do

    if [ $ACTION == "up" ] 
        then 
        ACTION="up -d"
    fi

    docker-compose --profile $profile $ACTION
    break;
    done
fi





