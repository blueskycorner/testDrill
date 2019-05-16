#!/bin/sh

upd()
{
    docker run -i --name drill-1.16.0 -p 8047:8047 --volume /opt/docker-apps/drill/drill_embedded/conf:/opt/drill/conf --volume /opt/docker-apps/drill/drill_embedded/sys.storage_plugins:/opt/drill/sys.storage_plugins --detach --restart unless-stopped -t drill/apache-drill:1.16.0 /bin/bash
}

stop()
{
    docker stop drill-1.16.0
}

rm()
{
    docker rm drill-1.16.0
}

if [ $1 == "upd" ]; then 
    # run drill container
    upd
    exit $?
fi

if [ $1 == "stop" ]; then 
    # stop drill container
    stop
    exit $?
fi

if [ $1 == "rm" ]; then 
    # remove drill container
    rm
    exit $?
fi