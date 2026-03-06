// main.bicep
module storageModule './modules/storage/main.bicep' = {
  name: 'storageDeploy-${uniqueString(resourceGroup().id)}' 
  params: {
    storageSku: 'Standard_LRS'
  }
}

module serviceBusModule './modules/servicebus/main.bicep' = {
  name: 'servicebus-${uniqueString(resourceGroup().id)}' 
  params: {
    serviceBusNamespaceName: 'approotns'
    serviceBusQueueName: 'testqueue'
  }
}

// Accessing an output from the module
output storageId string = storageModule.outputs.saName  