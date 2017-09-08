-- ################################################################################################
-- These scripts can be run within a GDW database that already has created two schema:  ${mxns.gdw.schema.gdw} and ${mxns.gdw.schema.gdw_stage}.
-- CREATE SCHEMA ${mxns.gdw.schema.gdw};
-- CREATE SCHEMA ${mxns.gdw.schema.gdw_stage};
-- ################################################################################################

USE SCHEMA ${mxns.gdw.db.gdw}.${mxns.gdw.schema.gdw};

-- ################################################################################################
-- GDW TABLES
-- ################################################################################################

--  dim_accreditations

CREATE TABLE dim_accreditations
   (
       accreditation_id        	INTEGER    NOT NULL
       , accreditation_name    	VARCHAR    NOT NULL
       , accreditation_desc    	VARCHAR
       , accreditation_comment 	VARCHAR
       , removed               	VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on			TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_accreditations
   ADD CONSTRAINT pk_dim_accreditations
   PRIMARY KEY (accreditation_id);
   
-- ################################################################################################
--  dim_analysis

CREATE TABLE dim_analysis
   (
         analysis_id		INTEGER    NOT NULL
       , analysis_variation	VARCHAR
       , analysis_type_id     INTEGER
       , lab_type_id          INTEGER
       , common_name_id       INTEGER
       , removed              VARCHAR
       , method		VARCHAR
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , updated_by            VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_analysis
   ADD CONSTRAINT pk_dim_analysis
   PRIMARY KEY (analysis_id);

CREATE TABLE E$_dim_analysis
   (
         error_ts TIMESTAMP_NTZ NOT NULL
       , error_description VARCHAR NOT NULL
       , analysis_id            INTEGER    
       , analysis_variation   VARCHAR
       , analysis_type_id     INTEGER
       , lab_type_id          INTEGER
       , common_name_id       INTEGER
       , removed              VARCHAR
       , method		VARCHAR
       , updated_on            TIMESTAMP_NTZ    
       , updated_by            VARCHAR    
       , gdw_updated_on           TIMESTAMP_NTZ                    
   );


-- ################################################################################################
--  dim_analysis_trans

CREATE TABLE dim_analysis_trans
   (
       analysis_id            INTEGER
       , language_id          INTEGER
       , analysis_name        VARCHAR
       , analysis_desc        VARCHAR
       , analysis_comment     VARCHAR
	   , updated_on           TIMESTAMP_NTZ
       , updated_by           VARCHAR
       , gdw_updated_on       TIMESTAMP_NTZ	NOT NULL
   );

ALTER TABLE dim_analysis_trans
   ADD CONSTRAINT pk_dim_analysis_trans
   PRIMARY KEY (analysis_id, language_id);

CREATE TABLE E$_dim_analysis_trans
   (
         error_ts             TIMESTAMP_NTZ NOT NULL
       , error_description    VARCHAR NOT NULL
       , analysis_id          INTEGER
       , language_id          INTEGER
       , analysis_name        VARCHAR
       , analysis_desc        VARCHAR
       , analysis_comment     VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on       TIMESTAMP_NTZ                
   );

-- ################################################################################################
--  dim_analysis_types

CREATE TABLE dim_analysis_types
   (
       analysis_type_id       INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , analysis_type_desc   VARCHAR
       , is_active             VARCHAR
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , updated_by            VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_analysis_types
   ADD CONSTRAINT pk_dim_analysis_types
   PRIMARY KEY (analysis_type_id, language_id);

-- ################################################################################################
-- dim_audit_categories

CREATE TABLE dim_audit_categories
   (
       audit_id               INTEGER    NOT NULL
       , category_id          INTEGER    NOT NULL
       , updated_on 		TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_audit_categories
   ADD CONSTRAINT pk_dim_audit_categories
   PRIMARY KEY (audit_id, category_id);

CREATE TABLE E$_dim_audit_categories
   (
		error_ts TIMESTAMP_NTZ NOT NULL
		, error_description VARCHAR NOT NULL
		, audit_id               INTEGER    
		, category_id          INTEGER    
		, updated_on 		TIMESTAMP_NTZ
        , updated_by             VARCHAR
		, gdw_updated_on           TIMESTAMP_NTZ                   
   );

-- ################################################################################################
--  dim_audit_options

CREATE TABLE dim_audit_options
   (
       audit_id               INTEGER    NOT NULL
       , option_id            INTEGER    NOT NULL
       , updated_on 	TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_audit_options
   ADD CONSTRAINT pk_dim_audit_options
   PRIMARY KEY (audit_id, option_id);

CREATE TABLE E$_dim_audit_options
   (
         error_ts TIMESTAMP_NTZ NOT NULL
       , error_description VARCHAR NOT NULL
       , audit_id               INTEGER    
       , option_id            INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ                    
   );

-- ################################################################################################
-- dim_categories

CREATE TABLE dim_categories
   (
       category_id            INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , category_name        VARCHAR
       , category_desc        VARCHAR
       , category_type        VARCHAR
       , parent_category_id   INTEGER
       , updated_on	TIMESTAMP_NTZ
       , updated_by	VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_categories
   ADD CONSTRAINT pk_dim_categories
   PRIMARY KEY (category_id, language_id);

CREATE TABLE E$_dim_categories
   (
         error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , category_id            INTEGER    
       , language_id          INTEGER    
       , category_name        VARCHAR
       , category_desc        VARCHAR
       , category_type        VARCHAR
       , parent_category_id   INTEGER
       , updated_on	TIMESTAMP_NTZ
       , updated_by	VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ                  
   );

-- ################################################################################################
-- dim_checklists

CREATE TABLE dim_checklists
   (
       checklist_id           INTEGER    NOT NULL
       , source_checklist_num INTEGER    NOT NULL
       , source_variation_num INTEGER
       , source_version_num   INTEGER
       , updated_on           TIMESTAMP_NTZ
       , updated_by 	VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_checklists
   ADD CONSTRAINT pk_dim_checklists
   PRIMARY KEY (checklist_id);

CREATE TABLE E$_dim_checklists
   (
         error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , checklist_id           INTEGER    
       , source_checklist_num INTEGER    
       , source_variation_num INTEGER
       , source_version_num   INTEGER
       , updated_on           TIMESTAMP_NTZ
       , updated_by 	VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ              
   );

-- ################################################################################################
-- dim_checklist_trans

CREATE TABLE dim_checklist_trans
   (
       checklist_id           INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , checklist_title      VARCHAR
       , variation_title      VARCHAR
       , foot_note            VARCHAR
       , updated_on	TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_checklist_trans
   ADD CONSTRAINT pk_dim_checklist_trans
   PRIMARY KEY (checklist_id, language_id);

CREATE TABLE E$_dim_checklist_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , checklist_id           INTEGER    
       , language_id          INTEGER    
       , checklist_title      VARCHAR
       , variation_title      VARCHAR
       , foot_note            VARCHAR
       , updated_on	TIMESTAMP_NTZ
       , updated_by             VARCHAR 
       , gdw_updated_on           TIMESTAMP_NTZ           
   );

-- ################################################################################################
-- dim_client_market

CREATE TABLE dim_client_market
   (
         client_market_id       INTEGER    NOT NULL
       , client_market_name   VARCHAR    NOT NULL
       , client_market_desc   VARCHAR
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_client_market
   ADD CONSTRAINT pk_dim_client_market
   PRIMARY KEY (client_market_id);

CREATE TABLE E$_dim_client_market
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , client_market_id       INTEGER    
       , client_market_name   VARCHAR    
       , client_market_desc   VARCHAR
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           
   );
   
-- ################################################################################################
-- dim_common_name

CREATE TABLE dim_common_name
   (
       common_name_id         INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , common_name_desc     VARCHAR
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_common_name
   ADD CONSTRAINT pk_dim_common_name
   PRIMARY KEY (common_name_id, language_id); 

CREATE TABLE E$_dim_common_name
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , common_name_id         INTEGER    
       , language_id          INTEGER    
       , common_name_desc     VARCHAR
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ              
   );

-- ################################################################################################
-- dim_concl_levels

CREATE TABLE dim_concl_levels
   (
       concl_level_id         INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , concl_level_desc     VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_concl_levels
   ADD CONSTRAINT pk_dim_concl_levels
   PRIMARY KEY (concl_level_id, language_id);

-- ################################################################################################
-- dim_concl_weights

CREATE TABLE dim_concl_weights
   (
       weight_id              INTEGER
       , language_id          INTEGER
       , concl_weight         INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR    
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- ################################################################################################
-- dim_countries

CREATE TABLE dim_countries
   (
       country_id             INTEGER    NOT NULL
       , country_name         VARCHAR    NOT NULL
       , country_desc         VARCHAR
       , country_code         VARCHAR     NOT NULL
       , accreditation_id     INTEGER
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_countries
   ADD CONSTRAINT pk_dim_countries
   PRIMARY KEY (country_id);
  
-- ################################################################################################
-- dim_country_currencies

CREATE TABLE dim_country_currencies
   (
       country_curr_id        INTEGER    NOT NULL
       , country_id           INTEGER    NOT NULL
       , currency_id          INTEGER    NOT NULL
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_country_currencies
   ADD CONSTRAINT pk_dim_country_currencies
   PRIMARY KEY (country_curr_id);
   
-- ################################################################################################
-- dim_currencies

-- CREATE TABLE
CREATE TABLE dim_currencies
   (
       currency_id            INTEGER    NOT NULL
       , currency_name        VARCHAR    NOT NULL
       , currency_desc        VARCHAR
       , currency_code        VARCHAR    NOT NULL
       , currency_symbol      VARCHAR
       , currency_unit        VARCHAR
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_currencies
   ADD CONSTRAINT pk_dim_currencies
 PRIMARY KEY (currency_id);

-- ################################################################################################
-- dim_customers

CREATE TABLE dim_customers
   (
       customer_id            INTEGER    NOT NULL
       , customer_desc        VARCHAR
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , updated_by            VARCHAR    NOT NULL
       , ts_person            VARCHAR
       , cs_person            VARCHAR
       , client_market_id     INTEGER
       , is_gka               VARCHAR default 'F'
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_customers
   ADD CONSTRAINT pk_dim_customers
   PRIMARY KEY (customer_id);
   
CREATE TABLE E$_dim_customers
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , customer_id            INTEGER    
       , customer_desc        VARCHAR
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ    
       , updated_by            VARCHAR    
       , ts_person            VARCHAR
       , cs_person            VARCHAR
       , client_market_id     INTEGER
       , is_gka               VARCHAR default 'F'
       , gdw_updated_on           TIMESTAMP_NTZ                   
   );

-- ################################################################################################
-- dim_customer_hierarchies

CREATE TABLE dim_customer_hierarchies
   (
       customer_id                  INTEGER NOT NULL
       , hierarchy_id               INTEGER NOT NULL
       , parent_hierarchy_id        INTEGER
       , is_active                  VARCHAR
       , lims_hierarchy_code        VARCHAR
       , market_global_industry_id  INTEGER
       , market_genaral_industry_id INTEGER
       , market_industry_segment_id INTEGER
       , client_market_id           INTEGER
       , template_id                INTEGER
       , mxns_entity_id             INTEGER
       , source_instance            VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_customer_hierarchies
   ADD CONSTRAINT pk_dim_customer_hierarchies
   PRIMARY KEY (customer_id, hierarchy_id);

CREATE TABLE E$_dim_customer_hierarchies
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , customer_id                  INTEGER 
       , hierarchy_id               INTEGER 
       , parent_hierarchy_id        INTEGER
       , is_active                  VARCHAR
       , lims_hierarchy_code        VARCHAR
       , market_global_industry_id  INTEGER
       , market_genaral_industry_id INTEGER
       , market_industry_segment_id INTEGER
       , client_market_id           INTEGER
       , template_id                INTEGER
       , mxns_entity_id             INTEGER
       , source_instance            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ                
   );

-- ################################################################################################
-- dim_customer_meanings

CREATE TABLE dim_customer_meanings
   (
       customer_id                  INTEGER NOT NULL
       , service_code               VARCHAR NOT NULL
       , meaning_id                 INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on	TIMESTAMP_NTZ  NOT NULL
   );

CREATE TABLE E$_dim_customer_meanings
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , customer_id                  INTEGER 
       , service_code               VARCHAR 
       , meaning_id                 INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on	TIMESTAMP_NTZ  

   );

-- ################################################################################################
-- dim_cust_hierarchies_trans

CREATE TABLE dim_cust_hierarchies_trans
   (
       hierarchy_id           INTEGER       NOT NULL
       , language_id          INTEGER       NOT NULL
       , description          VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_cust_hierarchies_trans
   ADD CONSTRAINT pk_dim_cust_hierarchies_trans
   PRIMARY KEY (hierarchy_id, language_id);

CREATE TABLE E$_dim_cust_hierarchies_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , hierarchy_id           INTEGER       
       , language_id          INTEGER       
       , description          VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           
   );

-- ################################################################################################
-- dim_cust_lims_services

CREATE TABLE dim_cust_lims_services
   (
       customer_id            INTEGER       NOT NULL
       , service_id           INTEGER       NOT NULL
       , hierarchy_id         INTEGER       NOT NULL
       , template_id          INTEGER
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_cust_lims_services
   ADD CONSTRAINT pk_dim_cust_lims_services
   PRIMARY KEY (customer_id, service_id, hierarchy_id);

CREATE TABLE E$_dim_cust_lims_services
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , customer_id            INTEGER       
       , service_id           INTEGER       
       , hierarchy_id         INTEGER       
       , template_id          INTEGER
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           
          
   );

-- ################################################################################################
-- dim_cust_services

CREATE TABLE dim_cust_services
   (
       cs_id                  INTEGER          NOT NULL
       , cs_name              VARCHAR
       , cs_email             VARCHAR
       , cs_phone_num         VARCHAR
       , cs_phone_cost        VARCHAR
       , cs_fax               VARCHAR
       , cs_address_line1     VARCHAR
       , cs_street_num        VARCHAR
       , cs_street_name       VARCHAR
       , cs_zip_code          INTEGER
       , cs_city              VARCHAR
       , cs_state             VARCHAR
       , cs_country_code      VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_cust_services
   ADD CONSTRAINT pk_dim_cust_services
   PRIMARY KEY (cs_id);

-- ################################################################################################
-- dim_entity_meanings

CREATE TABLE dim_entity_meanings
   (
       entity_id           INTEGER       NOT NULL
       , meaning_id        INTEGER       NOT NULL
       , is_active         VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_entity_meanings
   ADD CONSTRAINT pk_dim_entity_meanings
   PRIMARY KEY (entity_id , meaning_id );

CREATE TABLE E$_dim_entity_meanings
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , entity_id           INTEGER       
       , meaning_id        INTEGER       
       , is_active         VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ                   
   );

-- ################################################################################################
-- dim_file_types

CREATE TABLE dim_file_types
   (
       file_type_id           INTEGER       NOT NULL
       , file_desc            VARCHAR
       , file_mime            VARCHAR
       , file_extension       VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_file_types
   ADD CONSTRAINT pk_dim_file_types
   PRIMARY KEY (file_type_id);

-- ################################################################################################
-- dim_item_ca

CREATE TABLE dim_item_ca
   (
       audit_item_id          INTEGER    NOT NULL
       , ca_id                INTEGER    NOT NULL
       , item_issue_id        INTEGER
       , ca_desc              VARCHAR
       , ca_priority          VARCHAR
       , ca_deadline          VARCHAR
       , ca_responsible       VARCHAR
       , ca_date              TIMESTAMP_NTZ
        , updated_on           TIMESTAMP_NTZ           NOT NULL
       , updated_by	VARCHAR           NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_item_ca
   ADD CONSTRAINT pk_dim_item_ca
   PRIMARY KEY (audit_item_id, ca_id);

CREATE TABLE E$_dim_item_ca
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , audit_item_id          INTEGER    
       , ca_id                INTEGER    
       , item_issue_id        INTEGER
       , ca_desc              VARCHAR
       , ca_priority          VARCHAR
       , ca_deadline          VARCHAR
       , ca_responsible       VARCHAR
       , ca_date              TIMESTAMP_NTZ
	   , updated_on           TIMESTAMP_NTZ
       , updated_by	VARCHAR 
       , gdw_updated_on           TIMESTAMP_NTZ               
   );

-- ################################################################################################
-- dim_item_categories

CREATE TABLE dim_item_categories
   (
       audit_item_id          INTEGER    NOT NULL
       , category_id          INTEGER    NOT NULL
	   , updated_on TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_item_categories
   ADD CONSTRAINT pk_dim_item_categories
   PRIMARY KEY (audit_item_id, category_id);

CREATE TABLE E$_dim_item_categories
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , audit_item_id          INTEGER    
       , category_id          INTEGER    
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ                 
   );

-- ################################################################################################
-- dim_item_files

CREATE TABLE dim_item_files
   (
       audit_item_id          INTEGER    NOT NULL
       , order_number         INTEGER    NOT NULL
       , file_type_id         INTEGER
       , file_name            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_item_files
   ADD CONSTRAINT pk_dim_item_files
   PRIMARY KEY (audit_item_id, order_number);

CREATE TABLE E$_dim_item_files
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , audit_item_id          INTEGER    
       , order_number         INTEGER    
       , file_type_id         INTEGER
       , file_name            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ                
   );

-- ################################################################################################
-- dim_item_issues

CREATE TABLE dim_item_issues
   (
       audit_item_id          INTEGER    NOT NULL
       , issue_id             INTEGER    NOT NULL
       , issue_desc           VARCHAR
	   , updated_on           TIMESTAMP_NTZ          
       , updated_by	VARCHAR           
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_item_issues
   ADD CONSTRAINT pk_dim_item_issues
   PRIMARY KEY (audit_item_id, issue_id);

CREATE TABLE E$_dim_item_issues
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , audit_item_id          INTEGER    
       , issue_id             INTEGER    
       , issue_desc           VARCHAR
 	   , updated_on           TIMESTAMP_NTZ 
       , updated_by	VARCHAR       
       , gdw_updated_on           TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_item_options

CREATE TABLE dim_item_options
   (
       audit_item_id          INTEGER    NOT NULL
       , option_id            INTEGER    NOT NULL
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_item_options
   ADD CONSTRAINT pk_dim_item_options
   PRIMARY KEY (audit_item_id, option_id);

CREATE TABLE E$_dim_item_options
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , audit_item_id          INTEGER   
       , option_id            INTEGER   
	   , updated_on             TIMESTAMP_NTZ		
       , updated_by             VARCHAR 
       , gdw_updated_on           TIMESTAMP_NTZ           
   );

-- ################################################################################################
-- dim_item_trans

CREATE TABLE dim_item_trans
   (
       item_id                INTEGER    NOT NULL
       , language_id          INTEGER
       , item_title           VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_item_trans
   ADD CONSTRAINT pk_dim_item_trans
   PRIMARY KEY (item_id, language_id);

CREATE TABLE E$_dim_item_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , item_id                INTEGER    
       , language_id          INTEGER
       , item_title           VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_item_values_trans

CREATE TABLE dim_item_values_trans
   (
       audit_item_id          INTEGER    NOT NULL
       , language_id          INTEGER
       , text_short_result    VARCHAR
       , text_long_result     VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on           TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_item_values_trans
   ADD CONSTRAINT pk_dim_item_values_trans
   PRIMARY KEY (audit_item_id, language_id);

CREATE TABLE E$_dim_item_values_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , audit_item_id          INTEGER    
       , language_id          INTEGER
       , text_short_result    VARCHAR
       , text_long_result     VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on           TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_labs

CREATE TABLE dim_labs
   (
       lab_id                 INTEGER    NOT NULL
       , lab_desc             VARCHAR
       , country_code         VARCHAR
       , time_zone            VARCHAR
       , removed              VARCHAR
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , updated_by            VARCHAR    NOT NULL
       , internal             VARCHAR
       , is_reportable        VARCHAR                  DEFAULT 'F'    
       , source_instance      VARCHAR
       , mxns_entity_id       INTEGER
       , lims_lab_code        VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_labs
   ADD CONSTRAINT pk_dim_labs
   PRIMARY KEY (lab_id);

CREATE TABLE E$_dim_labs
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , lab_id                 INTEGER    
       , lab_desc             VARCHAR
       , country_code         VARCHAR
       , time_zone            VARCHAR
       , removed              VARCHAR
       , updated_on            TIMESTAMP_NTZ    
       , updated_by            VARCHAR    
       , internal             VARCHAR
       , is_reportable        VARCHAR                  DEFAULT 'F'    
       , source_instance      VARCHAR
       , mxns_entity_id       INTEGER
       , lims_lab_code        VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_lab_types

CREATE TABLE dim_lab_types
   (
       lab_type_id            INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , lab_type_desc        VARCHAR
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_lab_types
   ADD CONSTRAINT pk_dim_lab_types
   PRIMARY KEY (lab_type_id, language_id);

-- ################################################################################################
-- dim_languages

CREATE TABLE dim_languages
   (
       language_id            INTEGER    NOT NULL
       , language_desc        VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_languages
   ADD CONSTRAINT pk_dim_languages
   PRIMARY KEY (language_id);

-- ################################################################################################
-- dim_list_entries

CREATE TABLE dim_list_entries
   (
       source_instance        VARCHAR    NOT NULL
       , list_code            VARCHAR    NOT NULL
       , language_id          INTEGER    NOT NULL
       , order_no             INTEGER
       , entry_name           VARCHAR
       , entry_value          VARCHAR
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_list_entries
   ADD CONSTRAINT pk_dim_list_entries
   PRIMARY KEY (source_instance, list_code, entry_name, language_id);

CREATE TABLE E$_dim_list_entries
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , source_instance        VARCHAR    
       , list_code            VARCHAR    
       , language_id          INTEGER    
       , order_no             INTEGER
       , entry_name           VARCHAR
       , entry_value          VARCHAR
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ  
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_market_category

CREATE TABLE dim_market_category
   (
       market_category_id          INTEGER  NOT NULL
       , market_category_name      VARCHAR  NOT NULL
       , market_category_desc      VARCHAR
       , parent_market_category_id INTEGER  NOT NULL
       , is_active                 VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_market_category
   ADD CONSTRAINT pk_dim_market_category
   PRIMARY KEY (market_category_id, parent_market_category_id);

CREATE TABLE E$_dim_market_category
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , market_category_id          INTEGER  
       , market_category_name      VARCHAR  
       , market_category_desc      VARCHAR
       , parent_market_category_id INTEGER  
       , is_active                 VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_matrices

CREATE TABLE dim_matrices
   (
       matrice_id             INTEGER    NOT NULL
       , matrice_name         VARCHAR    NOT NULL
       , matrice_desc         VARCHAR
       , matrice_comment      VARCHAR
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_matrices
   ADD CONSTRAINT pk_dim_matrices
   PRIMARY KEY (matrice_id);

-- ################################################################################################
-- dim_meanings

CREATE TABLE dim_meanings
   (
       meaning_id             INTEGER    NOT NULL
       , data_type            VARCHAR
       , meaning_group        VARCHAR
       , target_table         VARCHAR
       , target_field         VARCHAR
       , target_sql           VARCHAR
       , is_always_displayed  VARCHAR
       , is_web_hidden        VARCHAR
       , is_active            VARCHAR
       , updated_on 	TIMESTAMP_NTZ	NOT NULL
       , updated_by 	VARCHAR	NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_meanings
   ADD CONSTRAINT pk_dim_meanings
  PRIMARY KEY (meaning_id);

CREATE TABLE E$_dim_meanings
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , meaning_id             INTEGER    
       , data_type            VARCHAR
       , meaning_group        VARCHAR
       , target_table         VARCHAR
       , target_field         VARCHAR
       , target_sql           VARCHAR
       , is_always_displayed  VARCHAR
       , is_web_hidden        VARCHAR
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_meanings_trans

CREATE TABLE dim_meanings_trans
   (
       meaning_id             INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , label                VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_meanings_trans
   ADD CONSTRAINT pk_dim_meanings_trans
   PRIMARY KEY (meaning_id, language_id);

CREATE TABLE E$_dim_meanings_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , meaning_id             INTEGER    
       , language_id          INTEGER    
       , label                VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_mxns_entity

CREATE TABLE dim_mxns_entity
   (
       mxns_entity_id           INTEGER  NOT NULL
       , mxns_entity_legal_desc VARCHAR NOT NULL
       , mxns_entity_desc       VARCHAR
       , mxns_cust_service_id   INTEGER
       , default_date_format    VARCHAR
       , default_language_id    INTEGER
       , is_active              VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_mxns_entity
   ADD CONSTRAINT pk_dim_mxns_entity
   PRIMARY KEY (mxns_entity_id);

-- ################################################################################################
-- dim_options

CREATE TABLE dim_options
   (
       option_id                INTEGER  NOT NULL
       , language_id            INTEGER  NOT NULL
       , option_name            VARCHAR
       , option_desc            VARCHAR
       , option_comment         VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_options
   ADD CONSTRAINT pk_dim_options
   PRIMARY KEY (option_id,language_id);
   
-- ################################################################################################
-- dim_packages

CREATE TABLE dim_packages
   (
       package_id             INTEGER    NOT NULL
       , source_instance      VARCHAR
       , package_type         VARCHAR
       , package_code         VARCHAR
       , package_version      INTEGER
       , is_active            VARCHAR
       , is_last_version      VARCHAR
       , mxns_entity_id       INTEGER
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_packages
   ADD CONSTRAINT pk_dim_packages
   PRIMARY KEY (source_instance, package_type, package_code, package_version);

ALTER TABLE dim_packages
   ADD CONSTRAINT dim_packages_uq1
   UNIQUE (package_id, package_version);

CREATE TABLE E$_dim_packages
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , package_id             INTEGER    
       , source_instance      VARCHAR
       , package_type         VARCHAR
       , package_code         VARCHAR
       , package_version      INTEGER
       , is_active            VARCHAR
       , is_last_version      VARCHAR
       , mxns_entity_id       INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_package_analysis

CREATE TABLE dim_package_analysis
   (
       package_id             INTEGER    NOT NULL
       , analysis_code        VARCHAR
       , analysis_variation   VARCHAR
       , order_number         INTEGER
       , method_code          VARCHAR
       , is_removable         VARCHAR
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_package_analysis
   ADD CONSTRAINT pk_dim_package_analysis
   PRIMARY KEY (package_id, analysis_code, analysis_variation, order_number)
;

CREATE TABLE E$_dim_package_analysis
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , package_id             INTEGER    
       , analysis_code        VARCHAR
       , analysis_variation   VARCHAR
       , order_number         INTEGER
       , method_code          VARCHAR
       , is_removable         VARCHAR
       , is_active            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_package_analysis_trans

CREATE TABLE dim_package_analysis_trans
   (
       package_id             INTEGER    NOT NULL
       , analysis_id          INTEGER    NOT NULL
       , order_number         INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , pack_ana_label       VARCHAR
       , pack_ana_desc        VARCHAR
       , method_desc          VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL         
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_package_analysis_trans
   ADD CONSTRAINT pk_dim_package_analysis_trans
   PRIMARY KEY (package_id, analysis_id, order_number, language_id)
;

CREATE TABLE E$_dim_package_analysis_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , package_id             INTEGER    
       , analysis_id          INTEGER    
       , order_number         INTEGER    
       , language_id          INTEGER    
       , pack_ana_label       VARCHAR
       , pack_ana_desc        VARCHAR
       , method_desc          VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ    
   );

-- ################################################################################################
-- dim_package_trans

CREATE TABLE dim_package_trans
   (
       package_id             INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , package_name         VARCHAR
       , package_desc         VARCHAR
       , package_comment      VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_package_trans
   ADD CONSTRAINT pk_dim_package_trans
   PRIMARY KEY (package_id, language_id)
;

CREATE TABLE E$_dim_package_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , package_id             INTEGER    
       , language_id          INTEGER    
       , package_name         VARCHAR
       , package_desc         VARCHAR
       , package_comment      VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_products

CREATE TABLE dim_products
   (
      source_instance         VARCHAR    NOT NULL
      , product_id            INTEGER    NOT NULL
      , service_id            INTEGER
      , mxns_entity_id        INTEGER
      , product_code          VARCHAR
      , product_type          VARCHAR
      , product_version       INTEGER
      , is_active             VARCHAR
      , is_last_version       VARCHAR
      , updated_on            TIMESTAMP_NTZ
      , updated_by             VARCHAR    NOT NULL
      , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_products
   ADD CONSTRAINT dim_products_uq1
   UNIQUE (source_instance,product_id, service_id, mxns_entity_id, product_version);

CREATE TABLE E$_dim_products
   (
      error_ts TIMESTAMP_NTZ NOT NULL
	  , error_description VARCHAR NOT NULL
	  , source_instance       VARCHAR    
      , product_id            INTEGER    
      , service_id            INTEGER
      , mxns_entity_id        INTEGER
      , product_code          VARCHAR
      , product_type          VARCHAR
      , product_version       INTEGER
      , is_active             VARCHAR
      , is_last_version       VARCHAR
      , updated_on            TIMESTAMP_NTZ
      , updated_by             VARCHAR   
      , gdw_updated_on            TIMESTAMP_NTZ             
   );

-- ################################################################################################
-- dim_products_packages

CREATE TABLE dim_products_packages
   (
       product_package_id     INTEGER    NOT NULL
       , product_id           INTEGER    NOT NULL
       , package_id           INTEGER    NOT NULL
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_products_packages
   ADD CONSTRAINT pk_dim_products_packages
   PRIMARY KEY (product_package_id);

CREATE TABLE E$_dim_products_packages
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , product_package_id     INTEGER    
       , product_id           INTEGER    
       , package_id           INTEGER    
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ 
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );
   
-- ################################################################################################
-- dim_product_trans

CREATE TABLE dim_product_trans
   (
       product_id             INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , product_label        VARCHAR
       , product_comment      VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_product_trans
   ADD CONSTRAINT pk_dim_product_trans
   PRIMARY KEY (product_id,language_id);

CREATE TABLE E$_dim_product_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , product_id             INTEGER    
       , language_id          INTEGER    
       , product_label        VARCHAR
       , product_comment      VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_prod_package_filters

CREATE TABLE dim_prod_package_filters
   (
       product_package_id     INTEGER    NOT NULL
       , filter_no            INTEGER    NOT NULL
       , filter_clause        VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_prod_package_filters
   ADD CONSTRAINT pk_dim_prod_package_filters
   PRIMARY KEY (product_package_id, filter_no);

CREATE TABLE E$_dim_prod_package_filters
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , product_package_id     INTEGER    
       , filter_no            INTEGER    
       , filter_clause        VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_reports

CREATE TABLE dim_reports
   (
       report_id              INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , file_type_id         INTEGER    NOT NULL
       , report_type          VARCHAR
       , source_report_code   VARCHAR
       , report_path          VARCHAR
       , generated_date       TIMESTAMP_NTZ
       , delivered_date      TIMESTAMP_NTZ
       , superseded_by        VARCHAR
       , source_instance      VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_reports
   ADD CONSTRAINT pk_dim_reports
   PRIMARY KEY (report_id, language_id, file_type_id);

CREATE TABLE E$_dim_reports
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , report_id              INTEGER    
       , language_id          INTEGER    
       , file_type_id         INTEGER    
       , report_type          VARCHAR
       , source_report_code   VARCHAR
       , report_path          VARCHAR
       , generated_date       TIMESTAMP_NTZ
       , delivered_date      TIMESTAMP_NTZ
       , superseded_by        VARCHAR
       , source_instance      VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_results_trans

CREATE TABLE dim_results_trans
   (
       result_id              INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , test_name            VARCHAR
       , result_name          VARCHAR
       , test_list_desc       VARCHAR
       , result_name_internal VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_results_trans
   ADD CONSTRAINT pk_dim_results_trans
   PRIMARY KEY (result_id, language_id);

CREATE TABLE E$_dim_results_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , result_id              INTEGER    
       , language_id          INTEGER    
       , test_name            VARCHAR
       , result_name          VARCHAR
       , test_list_desc       VARCHAR
       , result_name_internal VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_result_concl

CREATE TABLE dim_result_concl
   (
       result_concl_id        INTEGER    NOT NULL
       , result_id            INTEGER    NOT NULL
       , concl_level_id       INTEGER    NOT NULL
       , concl_wgt_id         INTEGER
       , target_value         VARCHAR
       , lims_axis_code       VARCHAR    NOT NULL
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_result_concl
   ADD CONSTRAINT pk_dim_result_concl
   PRIMARY KEY (result_concl_id);

CREATE TABLE E$_dim_result_concl
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , result_concl_id        INTEGER    
       , result_id            INTEGER    
       , concl_level_id       INTEGER    
       , concl_wgt_id         INTEGER
       , target_value         VARCHAR
       , lims_axis_code       VARCHAR   
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_result_concl_trans

CREATE TABLE dim_result_concl_trans
   (
       result_concl_id        INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , ref_value            VARCHAR
       , short_label          VARCHAR
       , long_label           VARCHAR
       , short_axis           VARCHAR
       , long_axis            VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_result_concl_trans
   ADD CONSTRAINT pk_dim_result_concl_trans
   PRIMARY KEY (result_concl_id, language_id);

CREATE TABLE E$_dim_result_concl_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , result_concl_id        INTEGER    
       , language_id          INTEGER    
       , ref_value            VARCHAR
       , short_label          VARCHAR
       , long_label           VARCHAR
       , short_axis           VARCHAR
       , long_axis            VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_sample_concl

CREATE TABLE dim_sample_concl
   (
       sample_concl_id        INTEGER    NOT NULL
       , sample_id            INTEGER    NOT NULL
       , concl_level_id       INTEGER    NOT NULL
       , concl_wgt_id         INTEGER    NOT NULL
       , lims_axis_code       VARCHAR    NOT NULL
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_sample_concl
   ADD CONSTRAINT pk_dim_sample_concl
   PRIMARY KEY (sample_concl_id);

ALTER TABLE dim_sample_concl
   ADD CONSTRAINT dim_sample_concl_uq1
   UNIQUE (sample_id, concl_level_id, concl_wgt_id);

CREATE TABLE E$_dim_sample_concl
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , sample_concl_id        INTEGER    
       , sample_id            INTEGER    
       , concl_level_id       INTEGER    
       , concl_wgt_id         INTEGER    
       , lims_axis_code       VARCHAR    
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_sample_concl_trans

CREATE TABLE dim_sample_concl_trans
   (
       sample_concl_id        INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , short_label          VARCHAR
       , long_label           VARCHAR
       , short_axis           VARCHAR
       , long_axis            VARCHAR
       , axis_variation       VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_sample_concl_trans
   ADD CONSTRAINT pk_dim_sample_concl_trans
   PRIMARY KEY (sample_concl_id, language_id);

CREATE TABLE E$_dim_sample_concl_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , sample_concl_id        INTEGER    
       , language_id          INTEGER    
       , short_label          VARCHAR
       , long_label           VARCHAR
       , short_axis           VARCHAR
       , long_axis            VARCHAR
       , axis_variation       VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_sample_details
	
CREATE TABLE dim_sample_details
   (
       sample_id              INTEGER    NOT NULL
       , meaning_id           INTEGER    NOT NULL
       , value                VARCHAR
       , value_d             TIMESTAMP_NTZ
       , value_i              INTEGER
       , coa_order_number     INTEGER    
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , data_type            VARCHAR
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_sample_details
   ADD CONSTRAINT pk_dim_sample_details
   PRIMARY KEY (sample_id, meaning_id);

CREATE TABLE E$_dim_sample_details
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , sample_id              INTEGER    
       , meaning_id           INTEGER    
       , value                VARCHAR
       , value_d             TIMESTAMP_NTZ
       , value_i              INTEGER
       , coa_order_number     INTEGER    
       , updated_on            TIMESTAMP_NTZ    
       , data_type            VARCHAR
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_sample_details_trans

CREATE TABLE dim_sample_details_trans
   (
       sample_id              INTEGER    NOT NULL
       , meaning_id           INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , label                VARCHAR
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_sample_details_trans
   ADD CONSTRAINT pk_dim_sample_details_trans
   PRIMARY KEY (sample_id, meaning_id, language_id);

CREATE TABLE E$_dim_sample_details_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , sample_id              INTEGER    
       , meaning_id           INTEGER    
       , language_id          INTEGER    
       , label                VARCHAR
       , updated_on            TIMESTAMP_NTZ  
       , updated_by             VARCHAR   
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_services

CREATE TABLE dim_services
   (
       service_id             INTEGER    NOT NULL
       , source_instance      VARCHAR    NOT NULL
       , service_code         VARCHAR
       , service_version      INTEGER
       , is_active            VARCHAR
       , is_last_version      VARCHAR
       , mxns_entity_id       INTEGER
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_services
   ADD CONSTRAINT pk_dim_services
   PRIMARY KEY (service_code, service_version, source_instance);

CREATE TABLE E$_dim_services
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , service_id             INTEGER    
       , source_instance      VARCHAR    
       , service_code         VARCHAR
       , service_version      INTEGER
       , is_active            VARCHAR
       , is_last_version      VARCHAR
       , mxns_entity_id       INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_services_family

CREATE TABLE dim_services_family
   (
       service_family_id      INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , service_family_desc  VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- ################################################################################################
-- dim_service_trans

CREATE TABLE dim_service_trans
   (
       service_id             INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , service_desc         VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_service_trans
   ADD CONSTRAINT pk_dim_service_trans
   PRIMARY KEY (service_id, language_id);

CREATE TABLE E$_dim_service_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , service_id             INTEGER    
       , language_id          INTEGER    
       , service_desc         VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_sites

CREATE TABLE dim_sites
   (
       site_id                      INTEGER    NOT NULL
       , site_desc                  VARCHAR
       , country_code               VARCHAR
       , zip                        VARCHAR
       , street_addr                VARCHAR
       , addr_nr                    VARCHAR
       , city                       VARCHAR
       , state                      VARCHAR
       , latitude                   INTEGER
       , longitude                  INTEGER
       , is_active                  VARCHAR
       , lims_site_code             VARCHAR
       , source_instance            VARCHAR    NOT NULL
       , updated_on 		TIMESTAMP_NTZ NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , street_addr2               VARCHAR
       , cust_site_code             VARCHAR
       , site_product_group         VARCHAR
       , site_region                VARCHAR
       , cust_site_code2            VARCHAR
       , market_global_industry_id  INTEGER
       , market_genaral_industry_id INTEGER
       , market_industry_segment_id INTEGER
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_sites
   ADD CONSTRAINT pk_dim_sites
   PRIMARY KEY (site_id);

CREATE TABLE E$_dim_sites
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , site_id                      INTEGER    
       , site_desc                  VARCHAR
       , country_code               VARCHAR
       , zip                        VARCHAR
       , street_addr                VARCHAR
       , addr_nr                    VARCHAR
       , city                       VARCHAR
       , state                      VARCHAR
       , latitude                   INTEGER
       , longitude                  INTEGER
       , is_active                  VARCHAR
       , lims_site_code             VARCHAR
       , source_instance            VARCHAR    
       , updated_on 		TIMESTAMP_NTZ 
       , updated_by             VARCHAR
       , street_addr2               VARCHAR
       , cust_site_code             VARCHAR
       , site_product_group         VARCHAR
       , site_region                VARCHAR
       , cust_site_code2            VARCHAR
       , market_global_industry_id  INTEGER
       , market_genaral_industry_id INTEGER
       , market_industry_segment_id INTEGER
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_site_hierarchy

CREATE TABLE dim_site_hierarchy
   (
       site_id                INTEGER    NOT NULL
       , hierarchy_id         INTEGER    NOT NULL
       , is_active            VARCHAR
       , sh_id                INTEGER
       , prev_sh_id           INTEGER
       , eff_start_date       TIMESTAMP_NTZ        
       , eff_end_date         TIMESTAMP_NTZ            
       , hierarchy_type       VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on	TIMESTAMP_NTZ           NOT NULL	
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_site_hierarchy
   ADD CONSTRAINT pk_dim_site_hierarchy
   PRIMARY KEY (sh_id);

CREATE TABLE E$_dim_site_hierarchy
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , site_id                INTEGER    
       , hierarchy_id         INTEGER    
       , is_active            VARCHAR
       , sh_id                INTEGER
       , prev_sh_id           INTEGER
       , eff_start_date       TIMESTAMP_NTZ        
       , eff_end_date         TIMESTAMP_NTZ            
       , hierarchy_type       VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on	TIMESTAMP_NTZ	
   );

-- ################################################################################################
-- dim_source_instances

CREATE TABLE dim_source_instances
   (
       source_instance        VARCHAR    NOT NULL
       , source_instance_desc VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_source_instances
   ADD CONSTRAINT pk_dim_source_instances
   PRIMARY KEY (source_instance);

-- ################################################################################################
-- dim_statuses

CREATE TABLE dim_statuses
   (
       status_id              INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , status_desc          VARCHAR
       , sample_filter        VARCHAR
       , audit_filter         VARCHAR
       , customer_status_id   INTEGER
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_statuses
   ADD CONSTRAINT pk_dim_statuses
   PRIMARY KEY (status_id, language_id);

-- ################################################################################################
-- dim_templates

CREATE TABLE dim_templates
   (
       source_instance        VARCHAR    NOT NULL
       , template_id          INTEGER    NOT NULL
       , template_type        VARCHAR    NOT NULL
       , template_code        VARCHAR    NOT NULL
       , template_version     INTEGER    NOT NULL
       , template_desc        VARCHAR
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ           NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_templates
   ADD CONSTRAINT pk_dim_templates
   PRIMARY KEY (source_instance, template_type, template_code, template_version);

CREATE TABLE E$_dim_templates
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , source_instance        VARCHAR    
       , template_id          INTEGER    
       , template_type        VARCHAR    
       , template_code        VARCHAR    
       , template_version     INTEGER    
       , template_desc        VARCHAR
       , is_active            VARCHAR
       , updated_on            TIMESTAMP_NTZ  
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_template_fields

CREATE TABLE dim_template_fields
   (
       template_id            INTEGER    NOT NULL
       , field_name           VARCHAR    NOT NULL
       , entry_mode           VARCHAR    
       , order_number         INTEGER
       , default_value        VARCHAR
       , allow_user_entry     VARCHAR
       , data_type            VARCHAR
       , group_name           VARCHAR
       , max_length           INTEGER
       , max_length_type      VARCHAR
       , list_code            VARCHAR
       , meaning_id           INTEGER
       , is_reportable        VARCHAR
       , is_downloadable      VARCHAR
       , is_login_visible     VARCHAR 
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_template_fields
   ADD CONSTRAINT pk_dim_template_fields
   PRIMARY KEY (template_id, field_name);

CREATE TABLE E$_dim_template_fields
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , template_id            INTEGER    
       , field_name           VARCHAR    
       , entry_mode           VARCHAR    
       , order_number         INTEGER
       , default_value        VARCHAR
       , allow_user_entry     VARCHAR
       , data_type            VARCHAR
       , group_name           VARCHAR
       , max_length           INTEGER
       , max_length_type      VARCHAR
       , list_code            VARCHAR
       , meaning_id           INTEGER
       , is_reportable        VARCHAR
       , is_downloadable      VARCHAR
       , is_login_visible     VARCHAR 
       , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_template_trans

CREATE TABLE dim_template_trans
   (
       template_id            INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , field_name           VARCHAR    NOT NULL
       , field_label          VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_template_trans
   ADD CONSTRAINT pk_dim_template_trans
   PRIMARY KEY (template_id, field_name, language_id);

CREATE TABLE E$_dim_template_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , template_id            INTEGER    
       , language_id          INTEGER    
       , field_name           VARCHAR    
       , field_label          VARCHAR
	   , updated_on             TIMESTAMP_NTZ	
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_units_trans

CREATE TABLE dim_units_trans
   (
       unit_id                INTEGER    NOT NULL
       , language_id          INTEGER    NOT NULL
       , unit_label           VARCHAR
       , unit_desc            VARCHAR
       , unit_comment         VARCHAR
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ			NOT NULL
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE dim_units_trans
   ADD CONSTRAINT pk_dim_units_trans
   PRIMARY KEY (unit_id, language_id);

CREATE TABLE E$_dim_units_trans
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , unit_id                INTEGER    
       , language_id          INTEGER    
       , unit_label           VARCHAR
       , unit_desc            VARCHAR
       , unit_comment         VARCHAR
       , removed              VARCHAR
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- dim_web_login

CREATE TABLE dim_web_login    
   (
       source_instance          VARCHAR     NOT NULL
       , web_order_tracking_id  VARCHAR    
       , web_order_status       INTEGER
       , web_sample_tracking_id INTEGER
       , sample_id              INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS 
ALTER TABLE dim_web_login
   ADD CONSTRAINT dim_web_login_uq1
   UNIQUE (source_instance, web_order_tracking_id,web_sample_tracking_id, sample_id);

CREATE TABLE E$_dim_web_login    
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , source_instance          VARCHAR     
       , web_order_tracking_id  VARCHAR    
       , web_order_status       INTEGER
       , web_sample_tracking_id INTEGER
       , sample_id              INTEGER
	   , updated_on             TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- fact_audits

CREATE TABLE fact_audits
   (
        audit_id                INTEGER    NOT NULL
      , source_audit_num      INTEGER    NOT NULL
      , checklist_id          INTEGER
      , source_checklist_num  INTEGER
      , source_variation_num  INTEGER
      , source_version_num    INTEGER
      , site_id               INTEGER
      , hierarchy_id          INTEGER
      , customer_id           INTEGER
      , source_visit_num      INTEGER
      , source_order_num      INTEGER
      , service_code          VARCHAR
      , service_desc          VARCHAR
      , status_id             INTEGER
      , audit_report_num      VARCHAR
      , report_id             INTEGER
      , ap_report_id          INTEGER
      , al_report_id          INTEGER
      , shipvia               VARCHAR
      , purchase_order        VARCHAR
      , audit_start_date      DATE
      , audit_end_date        DATE
      , visit_start_date      DATE
      , visit_end_date        DATE
      , expected_date         DATE
      , submit_date           TIMESTAMP_NTZ
      , reviewed_date          TIMESTAMP_NTZ
      , additional_title      VARCHAR
      , score                 VARCHAR
      , in_spec               VARCHAR
      , in_alert              VARCHAR
      , person_met            VARCHAR
      , audit_comment         VARCHAR
      , is_agreement_sent     VARCHAR
      , is_agreement_signed   VARCHAR
      , auditor_code          VARCHAR
      , auditor_full_name     VARCHAR
      , source_instance       VARCHAR    NOT NULL
      , mxns_entity_id        INTEGER
      , source_order_id       INTEGER
      , service_id            INTEGER
      , updated_on            TIMESTAMP_NTZ
      , updated_by             VARCHAR    NOT NULL
      , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
);

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE fact_audits
   ADD CONSTRAINT pk_fact_audits
   PRIMARY KEY (source_instance, source_audit_num);

ALTER TABLE fact_audits
   ADD CONSTRAINT fact_audits_uq1
   UNIQUE (audit_id);

CREATE TABLE E$_fact_audits
   (
        error_ts TIMESTAMP_NTZ NOT NULL
	  , error_description VARCHAR NOT NULL
	  , audit_id              INTEGER    
      , source_audit_num      INTEGER    
      , checklist_id          INTEGER
      , source_checklist_num  INTEGER
      , source_variation_num  INTEGER
      , source_version_num    INTEGER
      , site_id               INTEGER
      , hierarchy_id          INTEGER
      , customer_id           INTEGER
      , source_visit_num      INTEGER
      , source_order_num      INTEGER
      , service_code          VARCHAR
      , service_desc          VARCHAR
      , status_id             INTEGER
      , audit_report_num      VARCHAR
      , report_id             INTEGER
      , ap_report_id          INTEGER
      , al_report_id          INTEGER
      , shipvia               VARCHAR
      , purchase_order        VARCHAR
      , audit_start_date      DATE
      , audit_end_date        DATE
      , visit_start_date      DATE
      , visit_end_date        DATE
      , expected_date         DATE
      , submit_date           TIMESTAMP_NTZ
      , reviewed_date          TIMESTAMP_NTZ
      , additional_title      VARCHAR
      , score                 VARCHAR
      , in_spec               VARCHAR
      , in_alert              VARCHAR
      , person_met            VARCHAR
      , audit_comment         VARCHAR
      , is_agreement_sent     VARCHAR
      , is_agreement_signed   VARCHAR
      , auditor_code          VARCHAR
      , auditor_full_name     VARCHAR
      , source_instance       VARCHAR    
      , mxns_entity_id        INTEGER
      , source_order_id       INTEGER
      , service_id            INTEGER
      , updated_on            TIMESTAMP_NTZ
      , updated_by             VARCHAR
      , gdw_updated_on            TIMESTAMP_NTZ                  
);

-- ################################################################################################
-- fact_items_values

CREATE TABLE fact_items_values
   (
       audit_item_id           INTEGER   NOT NULL
       , audit_id              INTEGER   NOT NULL
       , checklist_item_id     INTEGER   NOT NULL
       , item_id               INTEGER
       , reportable_reference  VARCHAR
       , is_ne                 VARCHAR
       , is_na                 VARCHAR
       , result                VARCHAR
       , result_type           INTEGER
       , result_color          VARCHAR
       , is_bad                VARCHAR
       , score                 INTEGER
       , max_point             INTEGER
       , level_number          INTEGER
       , order_number          INTEGER
       , item_comment          VARCHAR
       , source_instance       VARCHAR   NOT NULL
       , updated_on            TIMESTAMP_NTZ
       , updated_by             VARCHAR    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE fact_items_values
   ADD CONSTRAINT pk_fact_items_values
   PRIMARY KEY (source_instance, audit_id, checklist_item_id);

ALTER TABLE fact_items_values
   ADD CONSTRAINT fact_items_values_uq1
   UNIQUE (audit_item_id);

CREATE TABLE E$_fact_items_values
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , audit_item_id           INTEGER   
       , audit_id              INTEGER   
       , checklist_item_id     INTEGER   
       , item_id               INTEGER
       , reportable_reference  VARCHAR
       , is_ne                 VARCHAR
       , is_na                 VARCHAR
       , result                VARCHAR
       , result_type           INTEGER
       , result_color          VARCHAR
       , is_bad                VARCHAR
       , score                 INTEGER
       , max_point             INTEGER
       , level_number          INTEGER
       , order_number          INTEGER
       , item_comment          VARCHAR
       , source_instance       VARCHAR   
       , updated_on            TIMESTAMP_NTZ
       , updated_by             VARCHAR
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- fact_results

CREATE TABLE fact_results
   (
         result_id             INTEGER    NOT NULL
       , sample_id             INTEGER    NOT NULL
       , source_instance       VARCHAR    NOT NULL
       , lims_result_num       INTEGER    NOT NULL
       , lims_test_num         INTEGER    NOT NULL
       , lims_analysis_code    VARCHAR
       , lims_analysis_version VARCHAR
       , analysis_id           INTEGER
       , lab_type_id           INTEGER
       , cust_analysis_code    VARCHAR
       , started_date          TIMESTAMP_NTZ
       , reviewed_date         TIMESTAMP_NTZ
       , expected_date         TIMESTAMP_NTZ
       , test_list_code        VARCHAR
       , method                VARCHAR
       , testing_lab_id        INTEGER
       , coa_order_number      INTEGER
       , status_id             INTEGER
       , accredited            VARCHAR
       , price                 INTEGER
       , currency_id           INTEGER
       , result                VARCHAR
       , uncertainty           VARCHAR
       , unit_id               INTEGER
       , in_alert              VARCHAR
       , in_spec               VARCHAR
       , cust_alert_code       VARCHAR
       , min_limit             VARCHAR
       , max_limit             VARCHAR
       , is_invoiced           VARCHAR
       , invoice_date          TIMESTAMP_NTZ
       , worst_concl_level_id  INTEGER
       , retest                VARCHAR
       , is_reportable         VARCHAR
       , package_id            INTEGER
       , report_id             INTEGER
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , gdw_updated_on        TIMESTAMP_NTZ    NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS
ALTER TABLE fact_results
   ADD CONSTRAINT pk_fact_results
   PRIMARY KEY (source_instance, lims_result_num);

ALTER TABLE fact_results
   ADD CONSTRAINT fact_results_uq1
   UNIQUE (result_id);

CREATE TABLE E$_fact_results
   (
         error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , result_id             INTEGER    
       , sample_id             INTEGER    
       , source_instance       VARCHAR    
       , lims_result_num       INTEGER    
       , lims_test_num         INTEGER    
       , lims_analysis_code    VARCHAR
       , lims_analysis_version VARCHAR
       , analysis_id           INTEGER
       , lab_type_id           INTEGER
       , cust_analysis_code    VARCHAR
       , started_date          TIMESTAMP_NTZ
       , reviewed_date         TIMESTAMP_NTZ
       , expected_date         TIMESTAMP_NTZ
       , test_list_code        VARCHAR
       , method                VARCHAR
       , testing_lab_id        INTEGER
       , coa_order_number      INTEGER
       , status_id             INTEGER
       , accredited            VARCHAR
       , price                 INTEGER
       , currency_id           INTEGER
       , result                VARCHAR
       , uncertainty           VARCHAR
       , unit_id               INTEGER
       , in_alert              VARCHAR
       , in_spec               VARCHAR
       , cust_alert_code       VARCHAR
       , min_limit             VARCHAR
       , max_limit             VARCHAR
       , is_invoiced           VARCHAR
       , invoice_date          TIMESTAMP_NTZ
       , worst_concl_level_id  INTEGER
       , retest                VARCHAR
       , is_reportable         VARCHAR
       , package_id            INTEGER
       , report_id             INTEGER
       , updated_on            TIMESTAMP_NTZ  
       , gdw_updated_on            TIMESTAMP_NTZ
   );

-- ################################################################################################
-- fact_samples

CREATE TABLE fact_samples
   (
       sample_id              INTEGER    NOT NULL
       , source_instance      VARCHAR    NOT NULL
       , lims_sample_num      INTEGER    NOT NULL
       , site_id              INTEGER    NOT NULL
       , hierarchy_id         INTEGER    NOT NULL
       , customer_id          INTEGER    NOT NULL
       , project_name         VARCHAR
       , lims_service_code    VARCHAR
       , lims_service_desc    VARCHAR
       , category_id          INTEGER
       , cust_category_code   VARCHAR
       , sample_type_id       INTEGER
       , shipvia              VARCHAR
       , purchase_order       VARCHAR
       , login_date           TIMESTAMP_NTZ
       , received_date        TIMESTAMP_NTZ
       , reviewed_date       TIMESTAMP_NTZ
       , sampled_date         TIMESTAMP_NTZ
       , started_date         TIMESTAMP_NTZ
       , status_id            INTEGER
       , in_alert             VARCHAR
       , in_spec              VARCHAR
       , worst_concl_level_id INTEGER
       , accredited           VARCHAR
       , source_visit_num     INTEGER
       , lab_id               INTEGER
       , mxns_entity_id       INTEGER
       , product_id           INTEGER
       , service_family_id    INTEGER
       , template_id          INTEGER
       , service_id           INTEGER
       , updated_on            TIMESTAMP_NTZ    NOT NULL
       , gdw_updated_on            TIMESTAMP_NTZ           NOT NULL
   );

-- CREATE/RECREATE PRIMARY AND UNIQUE CONSTRAINTS           
ALTER TABLE fact_samples
   ADD CONSTRAINT pk_fact_samples
   PRIMARY KEY (source_instance, lims_sample_num);

ALTER TABLE fact_samples
   ADD CONSTRAINT fact_samples_uq1
   UNIQUE (sample_id);

CREATE TABLE E$_fact_samples
   (
       error_ts TIMESTAMP_NTZ NOT NULL
	   , error_description VARCHAR NOT NULL
	   , sample_id            INTEGER    
       , source_instance      VARCHAR    
       , lims_sample_num      INTEGER    
       , site_id              INTEGER    
       , hierarchy_id         INTEGER    
       , customer_id          INTEGER    
       , project_name         VARCHAR
       , lims_service_code    VARCHAR
       , lims_service_desc    VARCHAR
       , category_id          INTEGER
       , cust_category_code   VARCHAR
       , sample_type_id       INTEGER
       , shipvia              VARCHAR
       , purchase_order       VARCHAR
       , login_date           TIMESTAMP_NTZ
       , received_date        TIMESTAMP_NTZ
       , reviewed_date       TIMESTAMP_NTZ
       , sampled_date         TIMESTAMP_NTZ
       , started_date         TIMESTAMP_NTZ
       , status_id            INTEGER
       , in_alert             VARCHAR
       , in_spec              VARCHAR
       , worst_concl_level_id INTEGER
       , accredited           VARCHAR
       , source_visit_num     INTEGER
       , lab_id               INTEGER
       , mxns_entity_id       INTEGER
       , product_id           INTEGER
       , service_family_id    INTEGER
       , template_id          INTEGER
       , service_id           INTEGER
       , updated_on            TIMESTAMP_NTZ 
       , gdw_updated_on            TIMESTAMP_NTZ
   );

--#########################################################################################################
-- GDW SEQUENCES 
--#########################################################################################################

CREATE SEQUENCE DIM_RESULT_CONCL_SEQ
     START WITH 1
   , INCREMENT BY 1;

CREATE SEQUENCE DIM_SAMPLE_CONCL_SEQ
     START WITH 1
   , INCREMENT BY 1;

CREATE SEQUENCE DIM_SITE_HIERARCHY_SEQ
     START WITH 1
   , INCREMENT BY 1;
   
CREATE SEQUENCE FACT_AUDITS_SEQ
     START WITH 1
   , INCREMENT BY 1;

CREATE SEQUENCE FACT_ITEM_VALUES_SEQ
     START WITH 1
   , INCREMENT BY 1;

CREATE SEQUENCE FACT_RESULTS_SEQ
     START WITH 1
   , INCREMENT BY 1;

CREATE SEQUENCE FACT_SAMPLES_SEQ
     START WITH 1
   , INCREMENT BY 1;