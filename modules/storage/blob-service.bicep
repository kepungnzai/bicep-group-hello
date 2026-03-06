param storageAccountName string
param containerName string = 'logs'

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: '${storageAccountName}/default/${containerName}'
}
