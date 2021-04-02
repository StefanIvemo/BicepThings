var vnets = [
  {
    name: 'landingzone-1-vnet'
    addressPrefix: '10.1.0.0/24'
  }
  {
    name: 'landingzone-2-vnet'
    addressPrefix: '10.2.0.0/24'
  }
]

module virtualNetwork 'modules/virtualNetwork.bicep' = [for vnet in vnets: {
  name: '${vnet.name}-deploy'
  params: {
    vnetName: vnet.name
    addressPrefix: vnet.addressPrefix    
  }
}]
