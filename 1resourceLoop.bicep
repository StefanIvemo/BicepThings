param vnets array = [
  {
    name: 'landingzone-1-vnet'
    addressPrefix: '10.1.0.0/24'
  }
  {
    name: 'landingzone-2-vnet'
    addressPrefix: '10.2.0.0/24'
  }
]

resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = [for vnet in vnets: {
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
