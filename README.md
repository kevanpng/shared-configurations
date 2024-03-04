# References
https://istio.io/latest/docs/setup/getting-started/#bookinfo
https://stackoverflow.com/questions/51468491/how-kubectl-port-forward-works
https://learncloudnative.com/blog/2020-01-09-deploying_multiple_gateways_with_istio

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
# AWS Load balancer controller 
## Troubleshooting
AWS load balancer controller created NLB wth target groups that had no targets.

https://stackoverflow.com/questions/51254530/aws-load-balancer-is-not-registered-with-instances
Get logs of load balancer controller deployment

sudo k0s kubectl logs -n kube-system deployment.apps/aws-load-balancer-controller
{
  "level": "error",
  "ts": "2024-03-04T14:39:44Z",
  "msg": "Reconciler error",
  "controller": "targetGroupBinding",
  "controllerGroup": "elbv2.k8s.aws",
  "controllerKind": "TargetGroupBinding",
  "TargetGroupBinding": {
    "name": "k8s-istiosys-istioing-f5807ed0a0",
    "namespace": "istio-system"
  },
  "namespace": "istio-system",
  "name": "k8s-istiosys-istioing-f5807ed0a0",
  "reconcileID": "bb4ce4d2-b716-4135-8792-9b55e1c4f8b0",
  "error": "providerID is not specified for node: ip-172-31-31-185.ap-southeast-1.compute.internal"
}
By adding this provider ID to the node, 

k patch node ip-172-31-31-185.ap-southeast-1.compute.internal -p '{"spec":{"providerID":"aws:///ap-southeast-1a/i-051db4fb041e7a5d6"}}'

And creating a configuration change to istio-values.yaml and istioctl install again, the target group was fixed.


# ISTIO
## Troubleshooting


## Tests and expected result
- [x] when update annotation on ingress gateway load-balancer-source-ranges, NLB should update, not be killed and reprovisioned. This leads to outage.
  - update values, istioctl install, successfully updated the istio ingress gateway with new annotations without killing istio gateway
- [ ] https 
