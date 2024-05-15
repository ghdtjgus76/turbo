Setup
  $ . ${TESTDIR}/../../../helpers/setup_integration_test.sh single_package

  $ ${TURBO} run test --dry=json
  {
    "id": "[a-zA-Z0-9]+", (re)
    "version": "1",
    "turboVersion": "[a-z0-9\.-]+", (re)
    "monorepo": false,
    "globalCacheInputs": {
      "rootKey": "I can\xe2\x80\x99t see ya, but I know you\xe2\x80\x99re here", (esc)
      "files": {
        "package-lock.json": "1c117cce37347befafe3a9cba1b8a609b3600021",
        "package.json": "8606ff4b95a5330740d8d9d0948faeada64f1f32",
        "somefile.txt": "45b983be36b73c0788dc9cbcb76cbb80fc7bb057"
      },
      "hashOfExternalDependencies": "",
      "globalDotEnv": null,
      "environmentVariables": {
        "specified": {
          "env": [],
          "passThroughEnv": null
        },
        "configured": [],
        "inferred": [],
        "passthrough": null
      }
    },
    "envMode": "strict",
    "frameworkInference": true,
    "tasks": [
      {
        "taskId": "build",
        "task": "build",
        "hash": "c60663bba2242806",
        "inputs": {
          ".gitignore": "03b541460c1b836f96f9c0a941ceb48e91a9fd83",
          "package-lock.json": "1c117cce37347befafe3a9cba1b8a609b3600021",
          "package.json": "8606ff4b95a5330740d8d9d0948faeada64f1f32",
          "somefile.txt": "45b983be36b73c0788dc9cbcb76cbb80fc7bb057",
          "turbo.json": "bf9ddbce36808b6ea5a0ea2b7ceb400ee6c42c4c"
        },
        "hashOfExternalDependencies": "",
        "cache": {
          "local": false,
          "remote": false,
          "status": "MISS",
          "timeSaved": 0
        },
        "command": "echo building > foo.txt",
        "cliArguments": [],
        "outputs": [
          "foo.txt"
        ],
        "excludedOutputs": null,
        "logFile": "\.turbo(\/|\\\\)turbo-build\.log", (re)
        "dependencies": [],
        "dependents": [
          "test"
        ],
        "resolvedTaskDefinition": {
          "outputs": [
            "foo.txt"
          ],
          "cache": true,
          "dependsOn": [],
          "inputs": [],
          "outputMode": "full",
          "persistent": false,
          "env": [],
          "passThroughEnv": null,
          "dotEnv": null,
          "interactive": false
        },
        "expandedOutputs": [],
        "framework": "",
        "envMode": "strict",
        "environmentVariables": {
          "specified": {
            "env": [],
            "passThroughEnv": null
          },
          "configured": [],
          "inferred": [],
          "passthrough": null
        },
        "dotEnv": null
      },
      {
        "taskId": "test",
        "task": "test",
        "hash": "0728c819ea8d3dfe",
        "inputs": {
          ".gitignore": "03b541460c1b836f96f9c0a941ceb48e91a9fd83",
          "package-lock.json": "1c117cce37347befafe3a9cba1b8a609b3600021",
          "package.json": "8606ff4b95a5330740d8d9d0948faeada64f1f32",
          "somefile.txt": "45b983be36b73c0788dc9cbcb76cbb80fc7bb057",
          "turbo.json": "bf9ddbce36808b6ea5a0ea2b7ceb400ee6c42c4c"
        },
        "hashOfExternalDependencies": "",
        "cache": {
          "local": false,
          "remote": false,
          "status": "MISS",
          "timeSaved": 0
        },
        "command": "cat foo.txt",
        "cliArguments": [],
        "outputs": null,
        "excludedOutputs": null,
        "logFile": "\.turbo(\/|\\\\)turbo-test\.log", (re)
        "dependencies": [
          "build"
        ],
        "dependents": [],
        "resolvedTaskDefinition": {
          "outputs": [],
          "cache": true,
          "dependsOn": [
            "build"
          ],
          "inputs": [],
          "outputMode": "full",
          "persistent": false,
          "env": [],
          "passThroughEnv": null,
          "dotEnv": null,
          "interactive": false
        },
        "expandedOutputs": [],
        "framework": "",
        "envMode": "strict",
        "environmentVariables": {
          "specified": {
            "env": [],
            "passThroughEnv": null
          },
          "configured": [],
          "inferred": [],
          "passthrough": null
        },
        "dotEnv": null
      }
    ],
    "user": ".*", (re)
    "scm": {
      "type": "git",
      "sha": "[a-z0-9]+", (re)
      "branch": ".+" (re)
    }
  }
  
