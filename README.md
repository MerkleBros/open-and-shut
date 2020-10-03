## Open and Shut
A Bash script (`open-and-shut.sh`) for keeping track of how many times my laptop has been opened and closed (for Ubuntu 18.04).

The `ACPI` (Advanced Configuration and Power Interface) events related to the lid opening and closing:
- `button/lid LID open`
- `button/lid LID close`

These events are broadcast from the kernel to user space by the `acpid` (Advanced Configuration and Power Interface daemon) process. The `acpi_listen` command can be used to listen for these events. The number of lid open and close events is written to a file `lid-open-close-count`.
