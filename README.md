# k8s-pod-zone
This docker image can be used to fetch the zone info of a k8s pod and set it as a label to the pod. This label can be further used to add the zone as an env variable which can be used in the container. Critical use cases are zone aware replication, zone based routing which saves inter zone egress


Use this in an init container like this

    initContainers:
    - name: get-pod-zone
      image: docker.io/sivadeep/k8s-pod-zone:latest
      command: ['/script.sh']


and pass as a env variable like this

    env:
    - name: POD_ZONE
      valueFrom:
        fieldRef:
          fieldPath: metadata.labels['zone']  


Steps for building an image on local:

1. docker buildx build --platform linux/amd64 .
2. docker tag image-id sivadeep/k8s-pod-zone


<img width="702" alt="Screenshot 2023-04-08 at 1 00 13 PM" src="https://user-images.githubusercontent.com/22883726/230709430-338ec020-e7ee-402d-af98-a839e8649d5f.png">
