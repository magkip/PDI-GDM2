LOG_DIR="/u01/pentaho/pdi-gdw-replatform/logs"
KETTLE_DIR="/u01/pentaho/pdi-ce-6.1.0.1-196"
JOB_FILE="/u01/pentaho/pdi-gdw-replatform/etl/j_incremental_load_gdw.kjb"
LOG_FILE_PREFIX="j_incremental_load_gdw"

export KETTLE_HOME="/u01/pentaho/pdi-gdw-replatform"

# stdbuf -o0 causes the log to be written immediately and not in chunks
# 2>&1 redirects stderr to stdout so that errors are logged to the log file and not the terminal
stdbuf -o0 sh $KETTLE_DIR/kitchen.sh -file=$JOB_FILE -level=basic > $LOG_DIR/log-$LOG_FILE_PREFIX-`date +%Y-%m-%d_%H-%M-%S`.log 2>&1 &
