targetScope = 'subscription'

param namePrefix string = 'hub'
param vnets array = [
  {
    addressPrefix: '10.1.0.0/24'
    location: 'westeurope'
  }
  {
    addressPrefix: '10.2.0.0/24'
    location: 'eastus'
  }
  {
    addressPrefix: '10.3.0.0/24'
    location: 'eastus'
  }
]

var resourceGroups = [for unique(vnet) in vnets: [
  vnet.location
]] 

resource rgs 'Microsoft.Resources/resourceGroups@2020-10-01' = [for location in resourceGroups: {
  name: '$'
}]

resource virtualNetworks 'Microsoft.Network/virtualNetworks@2018-11-01' = [for vnet in vnets: {
  name: vnet.name
  scope: 
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet.addressPrefix
      ]
    }
  }
}]
