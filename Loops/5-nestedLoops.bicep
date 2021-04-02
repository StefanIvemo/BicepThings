var vnets = [
  {
    name: 'landingzone-1-vnet'
    addressPrefix: '10.1.0.0/24'
    subnets: [
      {
        name: 'frontend'
        subnetPrefix: '10.1.0.0/26'
      }
      {
        name: 'backend'
        subnetPrefix: '10.1.0.64/26'
      }
      {
        name: 'appservice'
        subnetPrefix: '10.1.0.128/26'
      }
    ]
  }
  {
    name: 'landingzone-2-vnet'
    addressPrefix: '10.2.0.0/24'
    subnets: [
      {
        name: 'frontend'
        subnetPrefix: '10.2.0.0/26'
      }
    ]
  }
]

resource vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = [for vnet in vnets: {
  name: vnet.name
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet.addressPrefix
      ]
    }
    subnets: [for subnet in vnet.subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.subnetPrefix
      }
    }]
  }
}]
