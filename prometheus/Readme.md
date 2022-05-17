# Install prometheus server

helm install prometheus prometheus-community/prometheus -n observability -f values.yaml
