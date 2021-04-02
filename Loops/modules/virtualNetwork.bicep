param vnetName string
param addressPrefix string
param subnets array = []
param dnsServers array = []
param enableDdosProtection bool = false
param ddosProtectionPlanId string = ''
param tags object = {}
param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2020-08-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    dhcpOptions: {
      dnsServers: dnsServers
    }
    enableDdosProtection: enableDdosProtection
    ddosProtectionPlan: enableDdosProtection ? {
      id: ddosProtectionPlanId
    } : json('null')
    subnets: subnets
  }
}

output id string = vnet.id
output Subnets array = vnet.properties.subnets
