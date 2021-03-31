@batchSize(3)
resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = [for i in range(0,9): {
  name: 'landingzone-${i+1}-vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.${i+1}.0.0/24'
      ]
    }
  }
}]
