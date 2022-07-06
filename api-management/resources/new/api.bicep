param apim object
param api object
param apiService object
param products array

resource APIM 'Microsoft.ApiManagement/service@2021-08-01' existing = {
  name: apim.name
}

var versionSet = api.versionSet

resource apiVersionSet 'Microsoft.ApiManagement/service/apiVersionSets@2021-08-01' existing = {
  name: '${APIM.name}/${api.name}-${versionSet.version}'
}

resource apiServiceInstance 'Microsoft.ApiManagement/service/apis@2021-08-01' = {
  name: '${APIM.name}/${api.name}-${versionSet.version};rev=${versionSet.revisionNumber}'
  properties: {
    apiVersionSetId: apiVersionSet.id
    path: apiService.properties.path
    displayName: APIM.name
    value: loadTextContent('../../misc/swagger.json')
    format: 'swagger-json'
  }
}

resource serviceProducts 'Microsoft.ApiManagement/service/products@2021-08-01' existing = {
  name: products[0]
  parent: APIM
}

resource serviceNe 'Microsoft.ApiManagement/service/products@2021-08-01' existing = {
  name: products[1]
  parent: APIM
}

resource serviceYel 'Microsoft.ApiManagement/service/products@2021-08-01' existing = {
  name: products[2]
  parent: APIM
}

resource apiProducts 'Microsoft.ApiManagement/service/products/apis@2021-08-01' = {
  name: '${api.name}-${versionSet.version}'
  parent: serviceProducts
  dependsOn: [APIM]
}

resource apiProducts2 'Microsoft.ApiManagement/service/products/apis@2021-08-01' = {
  name: '${api.name}-${versionSet.version}'
  parent: serviceNe
  dependsOn: [APIM]
}

resource apiProducts3 'Microsoft.ApiManagement/service/products/apis@2021-08-01' = {
  name: '${api.name}-${versionSet.version}'
  parent: serviceYel
  dependsOn: [APIM]
}



