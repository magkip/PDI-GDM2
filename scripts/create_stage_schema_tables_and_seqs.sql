-- ################################################################################################
-- These scripts can be run within a GDW database that already has created two schema:  ${mxns.gdw.schema.gdw} and ${mxns.gdw.schema.gdw_stage}.
-- CREATE SCHEMA ${mxns.gdw.schema.gdw};
-- CREATE SCHEMA ${mxns.gdw.schema.gdw_stage};
-- ################################################################################################

USE SCHEMA ${mxns.gdw.db.gdw}.${mxns.gdw.schema.gdw_stage};

-- ################################################################################################
-- MAP TABLES
-- ################################################################################################
-- map_analysis

CREATE TABLE map_analysis
(
  source_instance   VARCHAR NOT NULL
, source_analysis_code   VARCHAR NOT NULL
, source_analysis_version   INTEGER NOT NULL
, source_variation_code   VARCHAR NOT NULL
, gdw_analysis_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_analysis
   ADD CONSTRAINT pk_map_analysis_types 
   PRIMARY KEY (source_instance, source_analysis_code, source_analysis_version, source_variation_code);

CREATE TABLE E$_MAP_ANALYSIS
(
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_analysis_code   VARCHAR
, source_analysis_version   INTEGER
, source_variation_code   VARCHAR
, gdw_analysis_id   INTEGER 
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ 
);

-- ################################################################################################
-- map_analysis_types

CREATE TABLE map_analysis_types 
( 
  source_instance   VARCHAR NOT NULL
, source_analysis_type   VARCHAR NOT NULL
, gdw_analysis_type_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_analysis_types 
   ADD CONSTRAINT pk_map_analysis_types 
   PRIMARY KEY (source_instance, source_analysis_type);

CREATE TABLE E$_MAP_ANALYSIS_TYPES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR 
, source_analysis_type   VARCHAR
, gdw_analysis_type_id   INTEGER 
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
);

-- ################################################################################################
-- map_ca 

CREATE TABLE map_ca 
( 
  source_instance   VARCHAR NOT NULL
, source_ca_num   INTEGER NOT NULL
, gdw_ca_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_ca 
   ADD CONSTRAINT pk_map_ca 
   PRIMARY KEY (source_instance, source_ca_num);

CREATE TABLE E$_MAP_CA
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_ca_num   INTEGER
, gdw_ca_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
);

-- ################################################################################################
-- map_categories  

CREATE TABLE map_categories 
( 
  source_instance   VARCHAR NOT NULL
, source_category_code   VARCHAR NOT NULL
, gdw_category_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_categories 
   ADD CONSTRAINT pk_map_categories 
   PRIMARY KEY (source_instance, source_category_code);

CREATE TABLE E$_MAP_CATEGORIES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_category_code   VARCHAR
, gdw_category_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
);

-- ################################################################################################
-- map_checklists  

CREATE TABLE map_checklists 
( 
  source_instance   VARCHAR NOT NULL
, source_checklist_num   INTEGER NOT NULL
, source_variation_num   INTEGER NOT NULL
, source_version_num   INTEGER NOT NULL
, gdw_checklist_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_checklists 
   ADD CONSTRAINT pk_map_checklists 
   PRIMARY KEY (source_instance, source_checklist_num, source_variation_num, source_version_num);

CREATE TABLE E$_MAP_CHECKLISTS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_checklist_num   INTEGER
, source_variation_num   INTEGER
, source_version_num   INTEGER
, gdw_checklist_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
);

-- ################################################################################################
-- map_checklists_trans 

CREATE TABLE map_checklists_trans 
( 
  gdw_checklist_id   INTEGER NOT NULL
, language_id   INTEGER NOT NULL
, checklist_title   VARCHAR 
, variation_title   VARCHAR 
, foot_note   VARCHAR
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL 
);

ALTER TABLE map_checklists_trans 
   ADD CONSTRAINT pk_map_checklists_trans 
   PRIMARY KEY (gdw_checklist_id, language_id);

CREATE TABLE E$_MAP_CHECKLISTS_TRANS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
,  gdw_checklist_id   INTEGER
, language_id   INTEGER
, checklist_title   VARCHAR 
, variation_title   VARCHAR 
, foot_note   VARCHAR
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_client_market  

CREATE TABLE map_client_market 
( 
  source_instance   VARCHAR NOT NULL
, source_client_market_code   VARCHAR NOT NULL
, gdw_client_market_id   INTEGER NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL 
);

ALTER TABLE map_client_market 
   ADD CONSTRAINT pk_map_client_market 
   PRIMARY KEY (source_instance, source_client_market_code);

-- ################################################################################################
-- map_common_names 

CREATE TABLE map_common_names 
( 
  source_instance   VARCHAR NOT NULL
, common_name   VARCHAR NOT NULL
, gdw_common_name_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL 
);

ALTER TABLE map_common_names
   ADD CONSTRAINT pk_map_common_names
   PRIMARY KEY (source_instance, common_name);

CREATE TABLE E$_MAP_COMMON_NAMES 
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, common_name   VARCHAR
, gdw_common_name_id   INTEGER 
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_concl_levels 

CREATE TABLE map_concl_levels 
( 
  source_instance   VARCHAR NOT NULL
, source_key_1   VARCHAR NOT NULL
, source_key_2   VARCHAR 
, gdw_level_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL 
);

ALTER TABLE map_concl_levels
   ADD CONSTRAINT pk_map_concl_levels
   PRIMARY KEY (source_instance, source_key_1, source_key_2);

-- ################################################################################################
-- map_concl_weights 

CREATE TABLE map_concl_weights 
( 
  source_instance   VARCHAR 
, concl_weight   INTEGER 
, gdw_weight_id   INTEGER 
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL 
);

ALTER TABLE map_concl_weights
   ADD CONSTRAINT pk_map_concl_weights
   PRIMARY KEY (source_instance, concl_weight);

-- ################################################################################################
-- map_customers 

CREATE TABLE map_customers 
( 
  source_instance   VARCHAR NOT NULL
, source_customer_code   VARCHAR NOT NULL
, gdw_customer_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_customers 
   ADD CONSTRAINT pk_map_customers 
   PRIMARY KEY (source_instance, source_customer_code);

CREATE TABLE E$_MAP_CUSTOMERS 
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_customer_code   VARCHAR
, gdw_customer_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
 
);

-- ################################################################################################
-- map_customer_desc 

CREATE TABLE map_customer_desc 
(
  gdw_customer_id   INTEGER NOT NULL
, gdw_customer_desc   VARCHAR 
, gdw_client_market_id   INTEGER
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL 
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_customer_desc 
   ADD CONSTRAINT pk_map_customer_desc 
   PRIMARY KEY (gdw_customer_id);

-- ################################################################################################
-- map_cust_hierarchies 

CREATE TABLE map_cust_hierarchies 
( 
  source_instance   VARCHAR NOT NULL
, source_hierarchy_type   VARCHAR NOT NULL
, source_hierarchy_code   VARCHAR NOT NULL
, gdw_hierarchy_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_cust_hierarchies 
   ADD CONSTRAINT pk_map_cust_hierarchies 
   PRIMARY KEY (source_instance, source_hierarchy_code, source_hierarchy_type);

CREATE TABLE E$_MAP_CUST_HIERARCHIES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_hierarchy_type   VARCHAR
, source_hierarchy_code   VARCHAR
, gdw_hierarchy_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_issues 

CREATE TABLE map_issues 
( 
  source_instance   VARCHAR NOT NULL
, source_issue_code   VARCHAR NOT NULL
, gdw_issue_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_issues 
   ADD CONSTRAINT pk_map_issues 
   PRIMARY KEY (source_instance, source_issue_code);

CREATE TABLE E$_MAP_ISSUES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_issue_code   VARCHAR
, gdw_issue_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_items 

CREATE TABLE map_items 
( 
  source_instance   VARCHAR NOT NULL
, source_item_num   INTEGER NOT NULL
, gdw_item_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_items 
   ADD CONSTRAINT pk_map_items 
   PRIMARY KEY (source_instance, source_item_num);

CREATE TABLE E$_MAP_ITEMS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_item_num   INTEGER
, gdw_item_id   INTEGER 
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_labs 

CREATE TABLE map_labs 
( 
  source_instance   VARCHAR NOT NULL
, source_lab_code   VARCHAR NOT NULL
, gdw_lab_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_labs 
   ADD CONSTRAINT pk_map_labs 
   PRIMARY KEY (source_instance, source_lab_code);

CREATE TABLE E$_MAP_LABS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_lab_code   VARCHAR
, gdw_lab_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ 

);

-- ################################################################################################
-- map_lab_types 

CREATE TABLE map_lab_types 
( 
  source_instance   VARCHAR NOT NULL
, source_lab_type_code   VARCHAR NOT NULL
, gdw_lab_type_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_lab_types 
   ADD CONSTRAINT pk_map_lab_types 
   PRIMARY KEY (source_instance, source_lab_type_code);

-- ################################################################################################
-- map_lacta_alerts

CREATE TABLE map_lacta_alerts 
(
  source_instance VARCHAR NOT NULL
, source_key1 VARCHAR NOT NULL
, source_key2 VARCHAR
, source_key3 VARCHAR
, lacta_alert_code VARCHAR
, updated_on TIMESTAMP_NTZ NOT NULL
, updated_by  VARCHAR NOT NULL
, gdw_updated_on TIMESTAMP_NTZ NOT NULL
);

-- ################################################################################################
-- map_lacta_analysis

CREATE TABLE map_lacta_analysis
(
  source_instance VARCHAR NOT NULL
, source_key1 VARCHAR NOT NULL
, source_key2 VARCHAR
, source_key3 VARCHAR
, lacta_analysis_code VARCHAR
, updated_on TIMESTAMP_NTZ NOT NULL
, updated_by  VARCHAR NOT NULL
, gdw_updated_on TIMESTAMP_NTZ NOT NULL
);

-- ################################################################################################
-- map_lacta_categories

CREATE TABLE map_lacta_categories
(
  source_instance VARCHAR NOT NULL
, source_key1 VARCHAR NOT NULL
, source_key2 VARCHAR
, source_key3 VARCHAR
, lacta_category_code VARCHAR
, updated_on TIMESTAMP_NTZ NOT NULL
, updated_by  VARCHAR NOT NULL
, gdw_updated_on TIMESTAMP_NTZ NOT NULL
);

-- ################################################################################################
-- map_languages 

CREATE TABLE map_languages 
( 
  source_instance   VARCHAR NOT NULL
, source_language_code   VARCHAR NOT NULL
, gdw_language_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_languages 
   ADD CONSTRAINT pk_map_languages 
   PRIMARY KEY (source_instance, source_language_code);

-- ################################################################################################
-- map_market_category 

CREATE TABLE map_market_category 
( 
  source_instance   VARCHAR NOT NULL
, source_mkt_cat_code   VARCHAR NOT NULL
, source_mkt_cat_group   VARCHAR NOT NULL
, source_parent_mkt_cat_code   VARCHAR 
, source_parent_mkt_cat_group   VARCHAR 
, grand_parent_mkt_cat_code   VARCHAR 
, grand_parent_mkt_cat_group   VARCHAR 
, gdw_market_category_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_market_category
   ADD CONSTRAINT pk_map_market_category
   PRIMARY KEY (source_instance, source_mkt_cat_code, source_mkt_cat_group, source_parent_mkt_cat_code, source_parent_mkt_cat_group, grand_parent_mkt_cat_code, grand_parent_mkt_cat_group);

CREATE TABLE E$_MAP_MARKET_CATEGORY
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_mkt_cat_code   VARCHAR
, source_mkt_cat_group   VARCHAR
, source_parent_mkt_cat_code   VARCHAR 
, source_parent_mkt_cat_group   VARCHAR 
, grand_parent_mkt_cat_code   VARCHAR 
, grand_parent_mkt_cat_group   VARCHAR 
, gdw_market_category_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_matrices 

CREATE TABLE map_matrices 
( 
  source_instance   VARCHAR NOT NULL
, source_matrice_code   VARCHAR NOT NULL
, gdw_matrice_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_matrices
   ADD CONSTRAINT pk_map_matrices
   PRIMARY KEY (source_instance, source_matrice_code);

-- ################################################################################################
-- map_meanings 

CREATE TABLE map_meanings 
( 
  source_instance   VARCHAR NOT NULL
, source_key1   VARCHAR NOT NULL
, source_key2   VARCHAR 
, source_key3   VARCHAR
, gdw_meaning_id   INTEGER
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_meanings
   ADD CONSTRAINT pk_map_meanings
   PRIMARY KEY (source_instance, source_key1, source_key2, source_key3);

CREATE TABLE E$_MAP_MEANINGS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_key1   VARCHAR
, source_key2   VARCHAR 
, source_key3   VARCHAR
, gdw_meaning_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_mxns_entity

CREATE TABLE map_mxns_entity 
( 
  source_instance   VARCHAR NOT NULL
, source_code_type   VARCHAR NOT NULL
, source_code   VARCHAR NOT NULL
, gdw_mxns_entity_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_mxns_entity 
   ADD CONSTRAINT pk_map_mxns_entity 
   PRIMARY KEY (source_instance, source_code_type, source_code);

-- ################################################################################################
-- map_options

CREATE TABLE map_options 
( 
  source_instance   VARCHAR NOT NULL
, source_option_code   VARCHAR NOT NULL
, source_option_type   VARCHAR NOT NULL
, gdw_option_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_options
   ADD CONSTRAINT pk_map_options
   PRIMARY KEY (source_instance, source_option_code, source_option_type );

-- ################################################################################################
-- map_packages 

CREATE TABLE map_packages 
( 
  source_instance   VARCHAR NOT NULL
, package_code   VARCHAR NOT NULL
, gdw_package_id   INTEGER NOT NULL
, package_type   VARCHAR NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_packages 
   ADD CONSTRAINT pk_map_packages 
   PRIMARY KEY (source_instance, package_code, package_type);

CREATE TABLE E$_MAP_PACKAGES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, package_code   VARCHAR
, gdw_package_id   INTEGER
, package_type   VARCHAR
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
);

-- ################################################################################################
-- map_products  

CREATE TABLE map_products 
( 
  source_instance   VARCHAR NOT NULL
, product_code   VARCHAR NOT NULL
, gdw_product_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_products 
   ADD CONSTRAINT pk_map_products 
   PRIMARY KEY (source_instance, product_code);

CREATE TABLE E$_MAP_PRODUCTS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, product_code   VARCHAR
, gdw_product_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
);

-- ################################################################################################
-- map_products_packages 

CREATE TABLE map_products_packages 
( 
  source_instance   VARCHAR NOT NULL
, product_code   VARCHAR NOT NULL
, package_code   VARCHAR NOT NULL
, gdw_product_package_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_products_packages 
   ADD CONSTRAINT pk_map_products_packages 
   PRIMARY KEY (source_instance, product_code, package_code);

CREATE TABLE E$_MAP_PRODUCTS_PACKAGES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, product_code   VARCHAR
, package_code   VARCHAR
, gdw_product_package_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_reports 

CREATE TABLE map_reports 
( 
  source_instance   VARCHAR NOT NULL
, source_report_type   VARCHAR NOT NULL
, source_report_code   VARCHAR NOT NULL
, gdw_report_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_reports 
   ADD CONSTRAINT pk_map_reports 
   PRIMARY KEY (source_instance, source_report_type, source_report_code);

CREATE TABLE E$_MAP_REPORTS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_report_type   VARCHAR
, source_report_code   VARCHAR
, gdw_report_id   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_services 

CREATE TABLE map_services 
( 
  source_instance   VARCHAR NOT NULL
, gdw_service_id   INTEGER 
, service_code   VARCHAR NOT NULL
, service_version   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_services 
   ADD CONSTRAINT pk_services 
   PRIMARY KEY (source_instance, service_code, service_version);

CREATE TABLE E$_MAP_SERVICES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, gdw_service_id   INTEGER 
, service_code   VARCHAR
, service_version   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ
);

-- ################################################################################################
-- map_services_family 

CREATE TABLE map_services_family 
( 
  source_instance   VARCHAR NOT NULL
, service_family_code   VARCHAR NOT NULL
, gdw_service_family_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_services_family 
   ADD CONSTRAINT pk_services_family 
   PRIMARY KEY (source_instance, service_family_code);

-- ################################################################################################
-- map_sites 

CREATE TABLE map_sites 
( 
  source_instance   VARCHAR NOT NULL
, source_site_code   VARCHAR NOT NULL
, gdw_site_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_sites 
   ADD CONSTRAINT pk_map_sites 
   PRIMARY KEY (source_instance, source_site_code);

CREATE TABLE E$_MAP_SITES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_site_code   VARCHAR
, gdw_site_id   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

-- ################################################################################################
-- map_statuses  

CREATE TABLE map_statuses 
( 
  source_instance   VARCHAR NOT NULL
, source_status_code   VARCHAR NOT NULL
, gdw_status_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_statuses 
   ADD CONSTRAINT pk_map_statuses 
   PRIMARY KEY (source_instance, source_status_code);

-- ################################################################################################
-- map_templates

CREATE TABLE map_templates 
( 
  source_instance   VARCHAR NOT NULL
, gdw_template_id   INTEGER 
, template_type   VARCHAR NOT NULL
, template_code   VARCHAR NOT NULL
, template_version   INTEGER NOT NULL
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_templates 
   ADD CONSTRAINT pk_map_templates 
   PRIMARY KEY (source_instance, template_type, template_code, template_version);

CREATE TABLE E$_MAP_TEMPLATES
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, gdw_template_id   INTEGER 
, template_type   VARCHAR
, template_code   VARCHAR
, template_version   INTEGER
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ 

);

-- ################################################################################################
-- map_units

CREATE TABLE map_units 
( 
  source_instance   VARCHAR NOT NULL
, source_unit_code   VARCHAR NOT NULL
, gdw_unit_id   INTEGER 
, updated_on	TIMESTAMP_NTZ NOT NULL
, updated_by	VARCHAR NOT NULL
, gdw_updated_on   TIMESTAMP_NTZ NOT NULL
);

ALTER TABLE map_units 
   ADD CONSTRAINT pk_map_units 
   PRIMARY KEY (source_instance, source_unit_code);

CREATE TABLE E$_MAP_UNITS
( 
  error_ts TIMESTAMP_NTZ NOT NULL
, error_description VARCHAR NOT NULL
, source_instance   VARCHAR
, source_unit_code   VARCHAR
, gdw_unit_id   INTEGER 
, updated_on	TIMESTAMP_NTZ
, updated_by	VARCHAR
, gdw_updated_on   TIMESTAMP_NTZ

);

--#########################################################################################################
-- MAP TABLE SEQUENCES 
--#########################################################################################################

CREATE SEQUENCE MAP_ANALYSIS_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_ANALYSIS_TYPES_SEQ
     START WITH 1
   , INCREMENT BY 1;
   
CREATE SEQUENCE MAP_CATEGORIES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_CA_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_CHECKLISTS_SEQ
    START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_COMMON_NAMES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_CONCL_WEIGHTS_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_CUSTOMERS_SEQ
     START WITH 5000
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_CUST_HIERARCHIES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_ISSUES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_ITEMS_SEQ
     START WITH 1
   , INCREMENT BY 1;
   
CREATE SEQUENCE MAP_LABS_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_MARKET_CATEGORY_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_MEANINGS_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_PACKAGES_SEQ
     START WITH 1
   , INCREMENT BY 1;
   
CREATE SEQUENCE MAP_PRODUCTS_PACKAGES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_PRODUCTS_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_REPORTS_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_SERVICES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_SITES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_TEMPLATES_SEQ
     START WITH 1
   , INCREMENT BY 1;
 
CREATE SEQUENCE MAP_UNITS_SEQ
     START WITH 1
   , INCREMENT BY 1;