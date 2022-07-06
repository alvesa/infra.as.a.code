resourceGroup = RG
bicepFile = './main.bicep'
parameters = './resources/new/api-management.json'

az deployment group create -g $resourceGroup -f $bicepFile -p $parameters --output jsonc