# Playing with Azure DevOps

#### Resources

- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines) 📚
  - [YAML schema reference](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema)
  - [Build and release tasks](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks)
  - [Predefined variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables)
- [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview) 📚*MS-Learn*
  - Reference for: [Resources with Bicep and ARM templates](https://docs.microsoft.com/en-us/azure/templates) 📚*MS-Learn*
  - Examples
    - [Quickstarts templates](https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts) 👤*Azure*
    - [Playground with sample templates](https://bicepdemo.z22.web.core.windows.net)
- [Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure) 📚
  - [Install the Azure PowerShell module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
  - [PowerShell Module Browser](https://docs.microsoft.com/en-us/powershell/module)
- ARM - [Azure Resource Manager](https://docs.microsoft.com/en-us/azure/azure-resource-manager) 📚
  - [Understand the structure and syntax of ARM templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)
  - [ARM template functions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-template-functions)
  - [Define resources with Bicep and ARM templates](https://docs.microsoft.com/en-us/azure/templates)
  - [Deploy resources with ARM templates and Azure PowerShell](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-template-deploy)
- [Azure Developer CLI (azd)](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli) 📚
  - [Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference) 📚
  - [AZD CLI deep dive](https://youtu.be/OD0_nP9QB6g?t=3173) 📽*1 hour - Jason Taylor - NDC Sydney 2024*
- Others
  - [YouTube channel](https://www.youtube.com/@geralexgr/videos) in YAML pipeline topic 📽*Gerasimos Alexiou*
  - [Azure DevOps Pipelines Refactoring Technics](https://devkimchi.com/2019/09/04/azure-devops-pipelines-refactoring-technics/) 📓*DevKimchi*
  - [6 ways passing Secrets to ARM templates](https://devkimchi.com/2019/04/24/6-ways-passing-secrets-to-arm-templates/) 📓*DevKimchi*
  - [Renovate](https://docs.renovatebot.com) 📓*Official docs - automated dependency updates*
    - [Setting up Azure DevOps pipeline for automatic NuGet package updates](https://nietras.com/2024/07/09/renovate-azure-devops) 📓*Nietras*
    - [Automate .NET SDK updates with global.json and Renovate](https://anthonysimmon.com/automate-dotnet-sdk-updates-global-json-renovate) 📓*Anthony Simmon*
    - [Sharing the Renovate configuration across multiple projects](https://www.meziantou.net/sharing-the-renovate-configuration-across-multiple-projects.htm) 📓*Meziantou*

#### Pipelines

###### HelloDevOps/pipeline-hello-devops.yml

This is a very simple pipeline using just script tasks to play around with the template and YAML basics.

###### FunctionAppProject/pipeline/pipeline-function-app.yml

1. Stage: Build Azure Function App
2. Stage: Deploy to Development, Stage or Production depends on the parameter
   1. Job: Provisioning Azure Resources using ARM templates. Using a variable group to read values from KeyVault and set them to the Function App configuration during the provisioning process.
   2. Job: Deploy Azure Function App

![](https://github.com/19balazs86/AzureDevOps/blob/master/FunctionAppProject/DevOpsPipelineResult.JPG)

###### SomeUnitTests/pipeline-unit-test.yml

A simple restore, build and Unit test, which can be applied during the build process.

###### NugetPackageLibrary/pipeline-library.yml

- A simple pack and push package to internal Nuget feed. Extra steps: read version number from the csproj xml file and set a variable in script.
- [Effective Nuget Package Versioning with GitVersion](http://loudandabrasive.com/effective-nuget-versioning-in-azure-devops) *(Loud & Abrasive)*

###### PlayingWithMountebank/pipeline.yml

- [PlayingWithMountebank](https://github.com/19balazs86/PlayingWithMountebank) repository contains a pipeline with the following steps. Install the mountebank NPM package globally, run it in the background. Run unit test to initiate HTTP call over the imposter, defined in the test.

###### Azure Container App / pipeline.yml

- [Azure Container App](https://github.com/19balazs86/AzureContainerApp) repository contains a pipeline to build and push docker image to ARC and update the Container App with the latest image.