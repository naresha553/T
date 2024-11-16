#!/bin/bash

# Log file for output
LOGFILE="/var/log/simple_hba_scan.log"

# Function to log messages
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOGFILE"
}

# Trigger a rescan of all SCSI hosts using echo
rescan_scsi_hosts() {
    log "Starting SCSI host rescan..."
    for host in /sys/class/scsi_host/host*; do
        echo "- - -" >"$host/scan"
        log "Triggered rescan for $host"
    done
    log "SCSI host rescan completed."
}

# Main execution block
main() {
    log "HBA scan script started..."
    
    # Rescan SCSI hosts
    rescan_scsi_hosts

    log "HBA scan script completed."
}

# Run the script
main
