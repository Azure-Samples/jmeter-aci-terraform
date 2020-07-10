#Alternate Implementation For Larger Infrastructures

###Whats Different
- Azure Key Vaults used to store secrets
- Azure Devops Service connections used to authenticate pipeline agents instead of saving Azure Service principle in Devops library as a variable group
- Pipeline stages, parameters and AzureCLI tasks used
- JMeter properties files used to:
    - make load profile flexible
    - enabling multiple test environments
- JMeter worker count made configurable so it can be set via pipeline
- Azure Backend Listener plugin has been added to the [Dockerfile](../docker/Dockerfile)

---

###How to use it
- Replace the [pipelines](../pipelines), [jmeter](../jmeter), [terraform](../terraform) folders with ones [here](./)
- Create Azure Key vault and appropriate RBAC role should be assigned to Azure Service Principle being used by the pipeline agents
- Azure container registry secret and Azure service principle secret added to key vault
- Updating both pipeline YAML's `AzureKeyVault@1` task `SecretsFilter` to retrieve correct `key` from Azure key vault
- Service Connection set up on Azure Devops using Azure service principle
- Updating service connection name to `pipeline/azure-variables.yml`
- Copy the [Report Generator Properties](./docker/reportgenerator.properties) file to main [docker](../docker) folder and add below line to the [Dockerfile](../docker/Dockerfile)
    ```docker
    COPY reportgenerator.properties ${JMETER_BIN}
    ```

---

##Notes
- In pipeline YAML's within [this folder](./), `AzureCLI@2` task uses bash script type which means the YAML's are only compatible with Linux/macOS pipeline agents. PowerShell Core script can run on cross-platform agents (Linux, macOS, or Windows) if you need compatibility with windows agent

- You can initialise terraform with a backend if you would like to store state files in a storage location of your choice