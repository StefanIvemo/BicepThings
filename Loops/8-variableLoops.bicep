param fwName string = 'steffes-fw'
param subnetId string = '/subscriptions/95695240-9cfc-444f-8dcb-a7e45ce85aa2/resourceGroups/finalbosse2/providers/Microsoft.Network/virtualNetworks/steffes-vnet/subnets/AzureFirewallSubnet'
param publicIpCount int = 5
param location string = resourceGroup().location

resource publicIPs 'Microsoft.Network/publicIPAddresses@2020-08-01' = [for i in range(1, publicIpCount): {
  name: '${fwName}-publicip-${i}'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}]

var fwIpConfigurations = [for i in range(1, publicIpCount): {
  name: '${fwName}-vnetIPConf-${i}'
  properties: {
    subnet: i == 1 ? {
      id: subnetId
    } : json('null')
    publicIPAddress: {
      id: publicIPs[i-1].id
    }
  }
}]

resource firewall 'Microsoft.Network/azureFirewalls@2020-06-01' = {
  name: fwName
  location: location
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }
    ipConfigurations: fwIpConfigurations
  }
}
