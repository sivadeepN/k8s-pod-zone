# k8s-pod-zone
This docker image can be used to fetch the zone info of a k8s pod and set it as a label to the pod. This label can be further used to add the zone as an env variable which can be used in the container. Critical use cases are zone aware replication, zone based routing which saves inter zone egress


Use this in an init container like this

    initContainers:
    - name: get-pod-zone
      image: artifactory-gojek.golabs.io:6555/pod-zone-docker:2.1
      command: ['/script.sh']


and pass as a env variable like this

    env:
    - name: POD_ZONE
      valueFrom:
        fieldRef:
          fieldPath: metadata.labels['zone']  