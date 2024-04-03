helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server
helm repo update metrics-server

HELM_CHART_VERSION="3.8.2"

helm upgrade --install metrics-server metrics-server/metrics-server --version "$HELM_CHART_VERSION" \
  --namespace metrics-server \
  --create-namespace \
  -f "./metrics-server-values.yaml"