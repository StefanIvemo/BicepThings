param vnets array = [
  {
    name: 'landingzone-1-vnet'
    addressPrefix: '10.1.0.0/24'
    subnets: [
      {
        name: 'frontend'
        subnetPrefix: '10.1.0.0/26'
        nsg: true
        securityRules: []
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
      {
        name: 'backend'
        subnetPrefix: '10.2.0.64/26'
      }
    ]
  }
]


var steffe = [for name in steffe: {

}]
