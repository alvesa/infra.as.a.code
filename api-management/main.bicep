param apim object

module APIM './resources/new/api-management.bicep' = {
  name: apim.name
  params: {
    location: apim.location
    apim: apim
  }
}
