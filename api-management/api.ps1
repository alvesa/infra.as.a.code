resourceGroup = RG
bicepFile = './main.bicep'
parameters = './resources/api-management.json'

az deployment group create -g $resourceGroup -f $bicepFile -p $parameters --output jsonc