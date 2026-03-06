

using deployment to do deployment

az deployment group create --resource-group MyDevRG  --template-file main.bicep --parameters storageSku=Standard_LRS


    az deployment group create --resource-group MyDevRG  --template-file storage.bicep --parameters storageSku=Standard_LRS

using stack for deployment
--- 
az stack group create --name "storage-enterprise-stack" --resource-group "MyDevRG"   --template-file ./storage.bicep --deny-settings-mode "none" --action-on-unmanage "detachAll"

after migrating to module and run the following command

 az deployment group create --resource-group MyDevRG  --template-file main.bicep


 az deployment group validate --resource-group MyDevRG  --template-file main.bicep

az stack group create --name "storage-enterprise-stack" --resource-group "MyDevRG"   --template-file ./storage.bicep --deny-settings-mode "none" --action-on-unmanage "detachAll"

----

 az stack group validate  --name "storage-enterprise--demo" --resource-
group "MyDevRG"   --template-file ./main.bicep --deny-settings-mode "none" --action-on-unmanage "detachAll"

az stack group create --name "storage-enterprise--demo" --resource-group "MyDevRG"   --template-file ./main.bicep --deny-settings-mode "none" --action-on-unmanage "detachAll"


To publish
-- 

az bicep publish --file ./modules/storage/main.bicep   --target "br:myregistry.azurecr.io/bicep/modules/storage:v1.0.0"