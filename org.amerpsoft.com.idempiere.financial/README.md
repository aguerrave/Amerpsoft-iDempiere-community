&lArr;[COMMUNITY PLUGINS](../README.md) | [Home](../README.md)
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="../images/AMERPSOFT_logo_600.png" alt="Logo" width="150" height="90">
  </a>
</div>

<a name="readme-top"></a>

# Financial Plugin

## <b>Description</b>

AMERPSOFT Financial Plugin is related to Idempiere Accounting in order to complement some tasks, processes and reports.

<b>Content:</b>

```text
- Database Functions
- Initial Client Setup
- Installing plugin
- Processes
- Accounting Reports
```
Follow steps:

| Steps | Title                                          | Comments                                                                           |
| ----: | ---------------------------------------------- | ---------------------------------------------------------------------------------- |
|     1 | [Install Database Functions](#step1)           | Install Database Functions for Postgresql or Oracle                                |
|     2 | [Initial Client Setup](#step2)                 | Initial Client Setup accounting elements and basic data for a demo Client          |
|     3 | [Installing plugin](#step3)                    | Install plugin using OSGI console                                                  |
|     4 | [Processes](#step4)                            | Verify processes installed                                                         |
|     5 | [Accounting Reports](#step5)                   | Review Accounting Reports                                                          |


## <a name="step1"></a>⭐️1.	Install Database Functions.
#### Special Function for Reporting Dates and Text:

```text
* amf_dow2letter.sql
* amf_month2letter.sql
* amf_num2letter.sql
* amf_num2letter1000.sql
```

<p align="left">(<a href="#readme-top">back to top</a>)</p>

## <a name="step2"></a>⭐️2. Initial Client Setup 

Before installing financial plugin, you must have a Client with appropriate Accounting elements and Accounting Schema created. You can use the garden client, but it is advisable to create a demo client with the chart of accounts adapted to your country's accounting.

For more Information see on Idempiere Wiki [Initial Client Setup](https://wiki.idempiere.org/en/Initial_Tenant_Setup_Process_ID-53161) -  [Default Accounts](https://wiki.idempiere.org/en/Default_Accounts_Usage)

### 2.1 Select Accounting plans provided

These files are provided:

- LVE NIIF Paln de cuentas Diciembre2015.csv
- LPY Plan de cuentas 2024.csv

### 2.3 Create new Client

Initial Tenant.
As a Systenm Administrator Start Tenant setup process.
Give all values related with Tenant and Organization. Very importar <b> Chart of Accounts File </b>. Here you enter the csv file.

<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Initial_Tenant_Setup1.png" alt="Logo" width="800">
  </a>
</div>

Start the process until you get a final OK. This means you have completely created he Tenant (Client) and all default accounts have been validated.

<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Initial_Tenant_Setup2.png" alt="Logo" width="800">
  </a>
</div>

Next, Import Accounts.

### 2.3 Import Account Elements

Login as a Tenant administrative user and goto to Window <b>Import File Loader</b>.

Select File to Load (same CSV file used for Initial Tenenat Setup). Also Select import format (Accounting - Accounts) and Execute Import.

You will receive a final message with the number of rous imported. In thsi example (451).

<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Import_Accounts1.png" alt="Logo" width="800">
  </a>
</div>

As a Tenant administrative user, goto to <b> Import Accounts </b>.  You will have the records imported, but normally first one is empty and you must delete it. 

You may review all imported records.

<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Import_Accounts2.png" alt="Logo" width="800" >
  </a>
</div>

Execute <b> Import Accounts </b> Process, select Client and Element, rest inputs leave default values.

<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Import_Accounts3.png" alt="Logo" width="800" >
  </a>
</div>

Verify imports and errors, reviewing 'Import Error Messages' Column.


<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Import_Accounts4.png" alt="Logo" width="800">
  </a>
</div>

Change Accounts Tree Settings on 'Tree' Window. Check 'Display Search Key'.

<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Accounts_Tree_Settings.png" alt="Logo" width="800">
  </a>
</div>

Review Account Elements.

<div align="center">
  <a href="AMERPSOFT_logo">
    <img src="./install/images/Account_Elements.png" alt="Logo" width="800">
  </a>
</div>



<p align="left">(<a href="#readme-top">back to top</a>)</p>

## <a name="step3"></a>⭐️3. Installing plugin 



Installation Procedure: [AMERPSOFT Financial Plugin](./install/Financial_Installation.md)

<p align="left">(<a href="#readme-top">back to top</a>)</p>

## <a name="step4"></a>⭐️4. Processes. 

AMERPSOFT Financial Processes

```text
- Amfin Process Reset Accounting
- Amfin Process Repost Accounting
- Amfin Process GLJournal Annual Closing
```
<p align="left">(<a href="#readme-top">back to top</a>)</p>

## <a name="step5"></a>⭐️5. Accounting Reports 

AMERPSOFT Financial Reports

```text
- Amfin Account Elements Jasper
- Amfin Trial Balance Jasper One Period
- Amfin Trial Balance Jasper by Two Dates
- Amfin State Financial Balance Jasper
- Amfin State Financial Integral Results Jasper
```
<p align="left">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

These plugins and tutorial is brought to you by Luis Amesty from: [Amerpsoft Consulting](http://amerpsoft.com/). 

For any question or improvement see me at: [Idempiere WIKI](https://wiki.idempiere.org/en/User:Luisamesty)

<p align="left">(<a href="#readme-top">back to top</a>)</p>

## Requires Idempiere release 11 

  Under Test - See release-11 branch lso for more details.

<p align="left">(<a href="#readme-top">back to top</a>)</p>
