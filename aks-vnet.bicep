param location string
param vnetName string
param vvnetPreffix array
param subnets array

resource vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: vvnetPreffix
    }
    subnets: subnets
    dhcpOptions: {
      dnsServers: [ '168.63.129.16', '1.1.1.1', '8.8.8.8' ]
    }
  }
}

var aksSubnetId = resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, 'aks-subnet')

output aksVnetId string = vnet.id
output akssubnet string = aksSubnetId
