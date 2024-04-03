kubectl config current-context

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --set controller.service.type=LoadBalancer \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/aws-load-balancer-type"="nlb" \
  --namespace ingress-nginx --create-namespace

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server
helm repo update metrics-server

HELM_CHART_VERSION="3.8.2"

helm upgrade --install metrics-server metrics-server/metrics-server --version "$HELM_CHART_VERSION" \
  --namespace metrics-server \
  --create-namespace \
  -f "./metrics-server-values.yaml"

# helm repo add autoscaler https://kubernetes.github.io/autoscaler

# helm upgrade --install helm-autoscale autoscaler/cluster-autoscaler \
#     --set autoDiscovery.clusterName='kubernetes-example-cluster' \
#     --set awsRegion='eu-west-2' \
#     --set rbac.create='true' \
#     --set rbac.serviceAccount.annotations."eks\.amazonaws\.com/role-arn"='arn:aws:iam::670484296822:role/cluster-autoscaler-2'
