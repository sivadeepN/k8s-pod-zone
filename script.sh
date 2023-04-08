#!/bin/sh
echo "fetching zone info"
# Get the zone
zone=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/zone" | cut -d "/" -f 4)
# set label to the zone value
kubectl label pod $HOSTNAME zone=$zone
echo "label set to $zone"
