

using deployment to do deployment

az deployment group create --resource-group MyDevRG  --template-file main.bicep --parameters storageSku=Standard_LRS

using stack for deployment
--- 
az stack group create --name "storage-enterprise-stack" --resource-group "MyDevRG"   --template-file ./storage.bicep --deny-settings-mode "none" --action-on-unmanage "detachAll"

