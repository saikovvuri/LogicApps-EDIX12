# Building B2B (EDI X12) workflow using Azure LogicApps

>This repo is a placeholder for building an end to end deployable (templates) Logic app to receive purchase orders from trading partners and process it downstream. Still working on automating deployments for logic apps using the guidelines in the references section

## References
- https://github.com/Azure-Samples/azure-logic-apps-deployment-samples
- https://github.com/jeffhollan/LogicAppTemplateCreator

## Logic App Definition

<img src="media/LogicAppDefinition.png" alt="Designer View" />

Convert each good message to xml, with this expression:
xml(base64ToBinary(items('For_each')?['Payload']))