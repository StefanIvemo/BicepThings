param vnets array = [
  {
    namePrefix: 'sandbox'
    addressPrefix: '10.1.0.0/24'
  }
  {
    namePrefix: 'sandbox'
    addressPrefix: '10.2.0.0/24'
  }
  {
    namePrefix: 'sandbox'
    addressPrefix: '10.3.0.0/24'
  }
]

resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = [for (vnet, i) in vnets: {
  name: '${vnet.namePrefix}-${i+1}-vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet.addressPrefix
      ]
    }
  }
}]
