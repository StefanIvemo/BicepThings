param subnets array = [
  {
    name: 'frontend'
    subnetPrefix: '10.1.0.0/26'
  }
  {
    name: 'backend'
    subnetPrefix: '10.1.0.64/26'
  }
]

resource vnet 'Microsoft.Network/virtualNetworks@2018-11-01' = {
  name: 'sandbox-vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/24'
      ]
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.subnetPrefix
      }
    }]
  }
}
