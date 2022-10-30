# GCP-Project

Deploy a python web application on GKE. if u need to know about app you can go and read this readme file https://github.com/atefhares/DevOps-Challenge-Demo-Code

## 1. we need to build our image using docker and push it to GCR

### Build image and upload to GCR
```
docker build -t <img-name> .
docker tag <img-name> gcr.io/<project-id>/<img-name>
docker push gcr.io/<project-id>/<img-name>
```
## 2. now we need to build infrastructure by 
```
cd terraform/
terraform init
terraform apply --var-files prod.tfvars
```
## 3.connect to private GKE cluster through bastion vm
```
gcloud compute ssh management-instance --tunnel-through-iap
gcloud container clusters get-credentials private-cluster --zone us-central1-a
```
## 4.deploy redis deploy and service u can find it on /k8s/redis/
```
kubectl apply -f redis-service.yaml
kubectl apply -f redis-deploy.yaml
```
## 5.now we need to get a sredis HOST_IP from redis service
```
kubectl get service -o wide
```
## 6.copy ip and put it on helm values file k8s/app/pythonapp/ variable name ==> REDIS_HOST

```
vim values.yaml
```
## 7.Deploy app to GKE cluster and expose deploymnet through load balancer
```
helm install <appname> .
```
## 8.now u can access your app by using loadbalancer ip
```
kubectl get service -o wide
```
