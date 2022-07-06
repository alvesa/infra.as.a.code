param apim object
param api object
param apiService object

module APIM './resources/new/api.bicep' = {
  name: apim.name
  params: {
    apim: apim
    api: api
    apiService: apiService
  }
}


