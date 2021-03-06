# GiveWP API Client

GiveWP Donation API

## Requirements

- [Salesforce DX](https://www.salesforce.com/products/platform/products/salesforce-dx/)


If everything is set correctly:

- Running `sfdx version` in a command prompt should output something like:

  ```bash
  sfdx-cli/5.7.5-05549de (darwin-amd64) go1.7.5 sfdxstable
  ```


## Installation

1. Copy the output into your Salesforce DX folder - or alternatively deploy the output directly into the workspace.
2. Deploy the code via Salesforce DX to your Scratch Org

   ```bash
   $ sfdx force:source:push
   ```
3. If the API needs authentication update the Named Credential in Setup.
4. Run your Apex tests using

    ```bash
    $ sfdx sfdx force:apex:test:run
    ```
5. Retrieve the job id from the console and check the test results.

  ```bash
  $ sfdx force:apex:test:report -i theJobId
  ```


## Getting Started

Please follow the [installation](#installation) instruction and execute the following Apex code:

```java
SwagDefaultApi api = new SwagDefaultApi();

Map<String, Object> params = new Map<String, Object>{
    'r_number' => '"50"',
    'key' => '"<Give API key>"',
    'token' => '"<Give API token>"',
    'r_date' => '"yesterday"'
};

try {
    // cross your fingers
    SwagModel0 result = api.giveApiDonationsGet(params);
    System.debug(result);
} catch (Swagger.ApiException e) {
    // ...handle your exceptions
}
```

## Documentation for API Endpoints

All URIs are relative to *https://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*SwagDefaultApi* | [**giveApiDonationsGet**](SwagDefaultApi.md#giveApiDonationsGet) | **GET** /give-api/donations | 


## Documentation for Models

 - [SwagDonations](SwagDonations.md)
 - [SwagForm](SwagForm.md)
 - [SwagModel0](SwagModel0.md)
 - [SwagPaymentMeta](SwagPaymentMeta.md)


## Documentation for Authorization

All endpoints do not require authorization.
Authentication schemes defined for the API:

## Author



