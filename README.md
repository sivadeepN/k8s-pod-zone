# k8s-pod-zone
This docker image can be used to fetch the zone info of a k8s pod and set it as a label to the pod. This label can be further used to add the zone as an env variable which can be used in the container. Critical use cases are zone aware replication, zone based routing which saves inter zone egress
