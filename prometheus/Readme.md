# Install prometheus server

helm install prometheus prometheus-community/prometheus -n observability -f values.yaml

helm uninstall prometheus -n observability
