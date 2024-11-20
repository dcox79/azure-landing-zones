targetScope = 'subscription'

param location string

resource managementResourceGroup 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: 'management'
  location: location
}

resource connectivityResourceGroup 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: 'connectivity'
  location: location
}

module managementResourcesDeployment 'management/management.bicep' = {
  scope: managementResourceGroup
  name: 'managementResourceDeployment'
  params: {
    location: location
  }
}

module connectivityResourcesDeployment 'connectivity/connectivity.bicep' = {
  scope: connectivityResourceGroup
  name: 'connectivityResourceDeployment'
  params: {
    location: location
  }
}
