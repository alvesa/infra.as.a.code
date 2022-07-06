param location string = resourceGroup().location
param apim object

resource APIM 'Microsoft.ApiManagement/service@2021-08-01' = {
  name: apim.name
  location: location
  sku: {
    capacity: apim.sku.capacity
    name: apim.sku.name
  }
  properties: {
    publisherEmail: apim.properties.publisherEmail
    publisherName: apim.properties.publisherName
  }
}
