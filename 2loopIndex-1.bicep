resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = [for i in range(0,3): {
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
