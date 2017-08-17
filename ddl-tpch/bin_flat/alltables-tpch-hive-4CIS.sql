create database if not exists ${DB};
use ${DB};

drop table if exists lineitem;
create external table lineitem 
(L_ORDERKEY BIGINT,
 L_PARTKEY INT,
 L_SUPPKEY INT,
 L_LINENUMBER INT,
 L_QUANTITY DOUBLE,
 L_EXTENDEDPRICE DOUBLE,
 L_DISCOUNT DOUBLE,
 L_TAX DOUBLE,
 L_RETURNFLAG CHAR(1),
 L_LINESTATUS CHAR(1),
 L_SHIPDATE DATE,
 L_COMMITDATE DATE,
 L_RECEIPTDATE DATE,
 L_SHIPINSTRUCT CHAR(25),
 L_SHIPMODE CHAR(10),
 L_COMMENT VARCHAR(44))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/lineitem';

drop table if exists part;
create external table part 
(P_PARTKEY INT,
 P_NAME VARCHAR(55),
 P_MFGR CHAR(20),
 P_BRAND CHAR(10),
 P_TYPE VARCHAR(25),
 P_SIZE INT,
 P_CONTAINER CHAR(10),
 P_RETAILPRICE DOUBLE,
 P_COMMENT VARCHAR(23))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/part/';

drop table if exists supplier;
create external table supplier 
(S_SUPPKEY INT,
 S_NAME CHAR(25),
 S_ADDRESS VARCHAR(40),
 S_NATIONKEY INT,
 S_PHONE CHAR(15),
 S_ACCTBAL DOUBLE,
 S_COMMENT VARCHAR(101))  
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${LOCATION}/supplier/';

drop table if exists partsupp;
create external table partsupp 
(PS_PARTKEY BIGINT,
 PS_SUPPKEY BIGINT,
 PS_AVAILQTY INT,
 PS_SUPPLYCOST DOUBLE,
 PS_COMMENT VARCHAR(199))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION'${LOCATION}/partsupp';

drop table if exists nation;
create external table nation 
 N_NATIONKEY INT,
 N_NAME CHAR(25),
 N_REGIONKEY INT,
 N_COMMENT VARCHAR(152))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${LOCATION}/nation';

drop table if exists region;
create external table region 
(R_REGIONKEY INT,
 R_NAME CHAR(25),
 R_COMMENT VARCHAR(152))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${LOCATION}/region';

drop table if exists customer;
create external table customer 
(C_CUSTKEY INT,
 C_NAME VARCHAR(25),
 C_ADDRESS VARCHAR(40),
 C_NATIONKEY INT,
 C_PHONE CHAR(15),
 C_ACCTBAL DOUBLE,
 C_MKTSEGMENT CHAR(10),
 C_COMMENT VARCHAR(117))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${LOCATION}/customer';

drop table if exists orders;
create external table orders 
(O_ORDERKEY INT,
 O_CUSTKEY INT,
 O_ORDERSTATUS CHAR(1),
 O_TOTALPRICE DOUBLE,
 O_ORDERDATE DATE,
 O_ORDERPRIORITY CHAR(15),
 O_CLERK CHAR(15),
 O_SHIPPRIORITY INT,
 O_COMMENT VARCHAR(79))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${LOCATION}/orders';
