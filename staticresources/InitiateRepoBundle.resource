{
  "recordTypeMap": {},
  "RecordSetBundles": [
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v56.0/sobjects/copado__JobTemplate__c/a0u8c00004lA4xTAAS"
          },
          "copado__ApiName__c": "Initiate Repository_1",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1,
          "Id": "a0u8c00004lA4xTAAS",
          "LastReferencedDate": "2023-01-24T23:29:08.000+0000",
          "LastViewedDate": "2023-01-24T23:29:08.000+0000",
          "Name": "Initiate Repository"
        }
      ],
      "ObjectType": "copado__JobTemplate__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0t8c00000ImhOjAAJ"
          },
          "copado__ApiName__c": "Initiate Repository_1_Initiate Repository Function_1",
          "copado__ConfigJson__c": "{\"functionName\":\"initiate_repository\",\"parameters\":[{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\"},{\"name\":\"provider\",\"value\":\"{$Context.Git_Provider__c}\"},{\"name\":\"branch\",\"value\":\"main\"},{\"name\":\"DefaultPackageDir\",\"value\":\"force-app\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a0u8c00004lA4xTAAS",
          "copado__Order__c": 1,
          "copado__Type__c": "Function",
          "Id": "a0t8c00000ImhOjAAJ",
          "Name": "init"
        }
      ],
      "ObjectType": "copado__JobStep__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a0l8c000009IzS6AAK"
          },
          "copado__API_Name__c": "initiate_repository",
          "copado__Image_Name__c": "copado-multicloud-metadata:v1",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"name\" : \"provider\",\n  \"defaultValue\" : \"{$Context.Git_Provider__c}\"\n}, {\n  \"name\" : \"branch\",\n  \"defaultValue\" : \"main\"\n}, {\n  \"name\" : \"DefaultPackageDir\",\n  \"defaultValue\" : \"force-app\"\n} ]",
          "copado__Script__c": "# Clone Repo\ncopado -p 'cloning repo...'\necho \"provider:\"\necho \"$provider\"\necho \"*****cloning repo*****\"\ncopado-git-get -c \"$branch\"\n\n# Create SFDX Project\ncopado -p 'creating project...'\necho \"*****creating new sfdx project*****\"\nsfdx force:project:create -n tmp -p $DefaultPackageDir -x\n\n# List New Directories/Files from Project\necho \"*****listing new directories/files*****\"\nls -LR\ngit add .\n\n# Move New Directories/Files to Root\ncopado -p \"initializing repo...\"\necho \"*****moving files*****\"\ngit mv -f tmp/.eslintignore .\ngit mv -f tmp/.forceignore .\ngit mv -f tmp/.gitignore .\ngit mv -f tmp/.prettierignore .\ngit mv -f tmp/.prettierrc .\ngit mv -f tmp/.husky/pre-commit .\ngit mv -f tmp/.vscode/extensions.json .\ngit mv -f tmp/.vscode/settings.json .\ngit mv -f tmp/.vscode/launch.json .\ngit mv -f tmp/* .\ngit add .\n\n# Add Exclude from Autoresolve File with Instructions\necho \"*****adding exclude from autoresolve file*****\"\ntouch .copado_exclude_autoresolve\necho \"# Files matching patterns in this file will be excluded from auto-resolve during merge conflicts\" >> .copado_exclude_autoresolve\necho \"# The pattern syntax is the same as for .gitignore files\" >> .copado_exclude_autoresolve\necho \"# Here is more documentation:\" >> .copado_exclude_autoresolve\necho \"# Copado Docs and Samples: https://docs.copado.com/articles/copado-ci-cd-publication/conflict-resolution-in-copado-devops-platform/a/h3__67432754\" >> .copado_exclude_autoresolve\ngit add .\n\n# Push Changes\ncopado -p \"pushing changes to git...\"\necho \"*****pushing changes*****\"\ngit commit -m \"init\"\ngit push origin $branch",
          "copado__Type__c": "Custom",
          "Id": "a0l8c000009IzS6AAK",
          "LastReferencedDate": "2023-01-24T23:27:44.000+0000",
          "LastViewedDate": "2023-01-24T23:27:44.000+0000",
          "Name": "Initiate Repository"
        }
      ],
      "ObjectType": "copado__Function__c"
    }
  ],
  "blobsByUID": {}
}