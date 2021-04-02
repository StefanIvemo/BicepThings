var vnets = [
  {
    name: 'landingzone-1-vnet'
    addressPrefix: '10.1.0.0/24'
    enabled: true
  }
  {
    name: 'landingzone-2-vnet'
    addressPrefix: '10.2.0.0/24'
    enabled: false
  }
]

resource virtualNetworks 'Microsoft.Network/virtualNetworks@2020-06-01' = [for vnet in vnets: if (vnet.enabled) {
  name: vnet.name
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet.addressPrefix
      ]
    }
  }
}]
