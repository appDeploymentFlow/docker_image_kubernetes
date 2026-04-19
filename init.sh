#test pod
kubectl run -it --rm mysql-client --image=mysql:8.0 --bash
#inside this check
#mysql -h db-service -uroot -proot
#show databases;
#show tables;

#create configMap using backend sql
# kubectl create configmap mysql-schema --from-file=./backend/schema/backend.sql
##This adds demo.sql as a key in the ConfigMap’s data section.

