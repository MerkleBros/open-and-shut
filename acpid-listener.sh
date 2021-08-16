#!/bin/bash
coproc acpi_listen
trap 'kill $COPROC_PID' EXIT

while read -ru "${COPROC[0]}" -a event; do
    echo "${event[@]}"
    # handler.sh "${event[@]}"
done
