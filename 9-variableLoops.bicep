param vnetName string = 'landingzone-1-vnet'
param addressPrefix string = '10.1.0.0/24'
param subnets array = [
  {
    name: 'frontend'
    subnetPrefix: '10.1.0.0/26'
    routeTable: true
    disableBGPRoutePropagation: true
    routes: [
      {
        name: 'nextHop-Internet'
        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopType: 'Internet'
        }
      }
    ]
  }
  {
    name: 'backend'
    subnetPrefix: '10.1.0.64/26'
    routeTable: false
    disableBGPRoutePropagation: true
    routes: []
  }
]
param location string = resourceGroup().location

module nsgs 'modules/nsg.bicep' = [for subnet in subnets: {
name: '${subnet.name}'
params: {
  name: subnet.name
  location: resourceGroup()
}
}]

module virtualNetwork 'modules/virtualNetwork.bicep' = {
  name: '${vnetName}-deploy'
  params: {
    vnetName: vnetName
     addressPrefixes: addressPrefix
     subnets: subnetProperty   
  }
}
