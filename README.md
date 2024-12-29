# Azure Data Platform for the company's sales performance.

## Summary

This project is about creating a secure and scalable data platform to handle sales analytics and reporting for the company. It combines on-premises systems with cloud services, making possible to process, analyzem and visualize data in real time.

## Sales Performance Dashboard

### Objective

Track and visualize the company's sales performance.

### Key Visuals

* Revenue trends over time (line chart).
* Top 10 best-selling products (bar chart).
* Sales by territory (map visualization).
* Monthly vs. yearly sales comparison (combo chart).

### Insights

* Identify seasonal trends in sales.
* Analyze performance by sales territory.
* Spot the most and least profitables products.

## Architecture Overview

### Key Components:

1. **On-Premises SQL Server Database**: Hosts transactional and historical data.
2. **Azure Data Factory**: Orcherstrates ETL Workflows and copies data to Azure Data Lake.
3. **Azure Data Lake Storage Gen2**: Centalized storage for raw and processed data.
4. **Azure Databricks**: Transforms and analyzes data.
5. **Azure Synapse Analytics**: Enables data warehousing and reporting.
6. **Power BI**: Provides interactive dashboards and reports.
7. **Azure Active Directory**: Manages identity and access control.
8. **Azure Key Vault**: Secures sensitive information.

## Implementation Details

### Data Flows

1. **Ingestion**: Exctract data from on-premises SQL Server to Azure Data Lake using Data Factory. Set up integration runtime to connect on-premises with cloud.
2. **Storage**: Organize raw data in Azure Data Lake for analytics.
3. **Processing**: Use Databricks for data tranformation and load processed data into Synapse.
4. **Analytics**: Query and analyze data in Synapse.
5. **Visualization**: Connect Power BI to Synapse for reporting.

## Supporting Documents

* Architecture Diagram is in the `Documentation` folder
* SQL Scripts is in the `SQL_Scripts` folder
* Screenshots in the `Screenshots` folder
