// main.bicep
module storageModule './modules/storage/main.bicep' = {
  name: 'storageDeploy-${uniqueString(resourceGroup().id)}' // Unique deployment name in Azure portal
  params: {
    storageSku: 'Standard_LRS'
  }
}

module serviceBusModule './modules/servicebus/main.bicep' = {
  name: 'servicebus-${uniqueString(resourceGroup().id)}' // Unique deployment name in Azure portal
  params: {
    serviceBusNamespaceName: 'approotns'
    serviceBusQueueName: 'testqueue'
  }
}

// Accessing an output from the module
output storageId string = storageModule.outputs.saName  