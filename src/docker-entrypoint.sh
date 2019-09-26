#!/bin/bash
GEOSERVER_HOME="/geoserver"

# a function to start geoserver using its startup script.
function start_geoserver {
    ${GEOSERVER_HOME}/bin/startup.sh &
}

# a function to stop geoserver using its shutdown script.
function stop_geoserver {
    ${GEOSERVER_HOME}/bin/shutdown.sh
}

# a function that spins, stopping every 1s to check if any geoserver
# processes are running. the loop terminates when no running geoserver
# processesa are found.
function wait_for_exit {
    while pgrep -f ${GEOSERVER_HOME} > /dev/null; do
        /bin/sleep 3
    done
    echo "All GeoServer processes have stopped."
}

# a function that is called whenever a signal is caught requesting that
# the process be terminated. in most cases, this will come from Docker
# as this script will be running as PID 1.
function signal_trap {
    echo "A SIGTERM or SIGINT signal was caught; trying to shut down."
    stop_geoserver
}

# trap termination signals and stop the server processes. this is
# necessary because Docker will send SIGTERM to the container's
# PID 1 when it tries to stop the container. since Bash doesn't
# pass this along, we have to handle it ourselves.
trap signal_trap SIGTERM SIGINT

# begin the server startup process.
start_geoserver

echo "wait 3 seconds for geoserver startup"
/bin/sleep 3

echo "Listening for termination signals..."
# loop until all geoserver processes are finished.
wait_for_exit
