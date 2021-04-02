resource virtualNetworks 'Microsoft.Network/virtualNetworks@2020-06-01' = [for i in range(1, 4): {
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
