// main.bicep
@description('Storage Account Name (must be globally unique)')
param storageName string = 'store${uniqueString(resourceGroup().id)}'

@description('The location for the resource')
param location string = resourceGroup().location

@description('Storage SKU')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
])

param storageSku string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: '${toLower(storageName)}'
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
}

// 2. Call the nested child module (Same folder reference)
module container './blob-service.bicep' = {
  name: 'container-deploy'
  params: {
    storageAccountName: storageAccount.name
    containerName: 'app-data'
  }
}

output saName string = storageAccount.name