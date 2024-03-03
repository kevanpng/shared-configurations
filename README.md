# References
https://istio.io/latest/docs/setup/getting-started/#bookinfo
https://stackoverflow.com/questions/51468491/how-kubectl-port-forward-works

# Apps to add
- [ ] code server
- [ ] istio, kiali
- [ ] horizontal pod autoscaler
- [ ] cluster autoscaler karpenter
- [ ] prometheus, grafana, alert manager
- [ ] aws load balancer controller
- [ ] external secrets
- [ ] EBS CSI
- [ ] EFS CSI

- [ ] teleprescence

- [ ] Postgres (stateful workload)
- [ ] Kafka
- [ ] horizontal pod autoscaler
- [ ] cluster autoscaler karpenter
- [ ] ECR




# best practice cloud development environment

* developer feature branch cloud environment
* developer cloud IDE
* Fast development of features
* Fast data generation for lower environments
* microservices development
* remote debugging

How to change code in a running pod in a remote k8s cluster?
* how to run IDE in the cloud? in my k8s cluster?, and connect to kube api server to run manifest changes, and run 


Cloud IDE k8s cluster -> teleprescence ->  individual remote K8s cluster

Add openEBS provisioner



# Code server
super difficult to install pycharm into a container then use, so just
stick with code server

## Tests and expected result
- [x] kill pod, files are still there
- [ ] https 
- [x] git pull public repo
- [ ] teleprescence to neighbour container
- [ ] configure login with proper AD
- [ ] pod can talk to kube-api server -> so that it can apply manifest directly
- [ ] pod iam role - service account
- [ ] extensions baked into helm chart, no need to always install at user side
- [ ] clone private github repo with ssh keys

