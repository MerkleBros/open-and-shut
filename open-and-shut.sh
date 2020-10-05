#! /usr/bin/env bash
set -uo pipefail

readonly LID_OPEN_CLOSE_COUNT_PATH="/home/patrick/recurse/acpi-actions/lid-open-close-count";

acpi_listen | while read -r line; do
    acpi_module=$(echo "$line" | awk '{print $1;}');
    case "$acpi_module" in
        "button/lid")
            module_property_one=$(echo "$line" | awk '{print $2;}');
            case "$module_property_one" in
                "LID")
                    module_property_two=$(echo "$line" | awk '{print $3;}');
                    if [ "$module_property_two" != "open" ] &&
                       [ "$module_property_two" != "close" ]; then
                        continue;
                    fi
                    if [ -f "$LID_OPEN_CLOSE_COUNT_PATH" ]; then
                        typeset -i count=$(cat "$LID_OPEN_CLOSE_COUNT_PATH")
                        echo $((count + 1)) > "$LID_OPEN_CLOSE_COUNT_PATH";
                    else
                        touch "$LID_OPEN_CLOSE_COUNT_PATH";
                        echo 1 > "$LID_OPEN_CLOSE_COUNT_PATH";
                    fi
            esac
    esac
done
