param vnets array = [
  {
    name: 'landingzone-1-vnet'
    addressPrefix: '10.1.0.0/24'
    subnets: [
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
  }
]
