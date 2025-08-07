@secure()
param kubeConfig string

extension kubernetes with {
  namespace: 'default'
  kubeConfig: kubeConfig
}

resource appsDeployment_dbCheck 'apps/Deployment@v1' = {
  metadata: {
    name: 'db-check'
    labels: {
      app: 'db-check'
    }
  }
  spec: {
    replicas: 1
    selector: {
      matchLabels: {
        app: 'db-check'
      }
    }
    template: {
      metadata: {
        labels: {
          app: 'db-check'
        }
      }
      spec: {
        containers: [
          {
            name: 'db-check'
            image: 'sturrent/dns-monitor:latest'
          }
        ]
      }
    }
  }
}
