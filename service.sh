#!/system/bin/sh
# This script is executed on device boot.

log_print() {
  echo "[$(date)] Restart-SMS $1"
}

log_print "Waiting boot completed..."
# Add more commands here

while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done

log_print "Restart SMS Service..."

/system/bin/service call phone 185 i32 0 i32 0
/system/bin/service call phone 186 i32 0 i32 0
sleep 2
/system/bin/service call phone 185 i32 0 i32 0
/system/bin/service call phone 186 i32 0 i32 1

log_print "Done."
