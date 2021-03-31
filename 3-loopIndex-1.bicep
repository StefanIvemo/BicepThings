resource virtualNetworks 'Microsoft.Network/virtualNetworks@2018-11-01' = [for i in range(10,4): {
  name: 'landingzone-${i}-vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.${i}.0.0/24'
      ]
    }
  }
}]
