param apim object

resource APIM 'Microsoft.ApiManagement/service@2021-08-01' existing = {
  name: '${apim.name}'
}

output currentAPIM object = APIM
