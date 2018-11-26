[[ -z "$1" ]] || [[ -z "$2" ]] || [[ -z "$3" ]] || [[ -z "$4" ]] && echo "Please provide the following arguments:" && echo "FROM_PORT TO_PORT SERVICE_NAME SERVICE_PORT" && echo "For example: 80 90 service1 8080" && exit 1

FROMPORT=$1
TOPORT=$2
SERVICE=$3
SERVICEPORT=$4

echo "Generating mappings from port $FROMPORT to port $TOPORT with serivce name \"$SERVICE\" and port $SERVICEPORT..."
echo "==============================================="
echo "====== server port to internal hostname ======="
echo "==============================================="
for (( COUNTER=$FROMPORT; COUNTER<=$TOPORT; COUNTER+=1 )); do
    echo "\"$COUNTER\" \"$SERVICE\";"
done

echo "==============================================="
echo "====== server port to internal port ==========="
echo "==============================================="

for (( COUNTER=$FROMPORT; COUNTER<=$TOPORT; COUNTER+=1 )); do
    echo "\"$COUNTER\" \"$((SERVICEPORT + COUNTER))\";"
done

echo "==============================================="
echo "=================== listen ===================="
echo "==============================================="
for (( COUNTER=$FROMPORT; COUNTER<=$TOPORT; COUNTER+=1 )); do
    echo "listen \"$COUNTER\";"
done