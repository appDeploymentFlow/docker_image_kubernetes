# Deployment of Expense web application using Kubernetes + Docker
This will create docker image and deploy pods using that image

1. namespace
```
kubectl create ns expense-app
kubectl get ns
```

![namespace](images/ns.png)

2. pv
```
kubectl apply -f pv.yaml
kubectl get pv
```
3. pvc
```
kubectl apply -f pvc.yaml
kubectl get pvc -n expense-app
```

![PersistentVolume](images/pv-pvc.png)

4. configMap
```
kubectl apply -f configFile.yaml
kubectl get cm -n expense-app
```

![configMap](images/config.png)

5. secrets
```
kubectl apply -f secretFile.yaml
kubectl get secrets -n expense-app
```

![secrets](images/secret.png)

6. database
```
kubectl apply -f db.yaml
kubectl get all -l app=db -n expense-app
```

![databases](images/db-table.png)

7. backend image
```
nerdctl build -t backend:01 -f backendImage/Dockerfile .
nerdctl tag backend:01 localhost:5000/backend:01
nerdctl push localhost:5000/backend:01
```

![backend-image](images/backendImage.png)
![backend-image-tag](images/backend.png)

8. backend deployment
```
kubectl apply -f backend.yaml
kubectl get all -l app=backend -n expense-app
```

![backend-deployment](images/backendDeploy.png)
![backend-connectivity](images/backend-ping.png)

9. frontend image
```
nerdctl build -t frontend:01 -f frontendImage/Dockerfile .
nerdctl tag frontend:01 localhost:5000/frontend:01
nerdctl push localhost:5000/frontend:01
```

![frontend-image](images/frontendImage.png)
![frontend-image-tag](images/frontend.png)

10. frontend deployment
```
kubectl apply -f frontend.yaml
kubectl get all -l app=frontend -n expense-app
```

![frontend-Deployment](images/frontendDeploy.png)

11. ingress-nginx
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml

```
kubectl apply -f ingress.yaml
```
Browser     (curl http://expense-app.local:31362)
   ↓
expense-app.local
   ↓
Ingress Controller
   ├── /      → frontend
   └── /api   → backend
```

![ingress-controller](images/ingress-controller.png)
![ingress-resource](images/ingress.png)

- Browser View

![Home-Page](images/frontendView.png)
![Adding-Details](images/DataStore.png)
