param apim object

module APIM './resources/existing/api-management.bicep' = {
  name: apim.name
  params: {
    apim: apim
  }
}
