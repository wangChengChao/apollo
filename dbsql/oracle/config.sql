-- Create table
create table "App"
(
  "Id"                        NUMBER primary key not null,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "Name"                      VARCHAR2(500) default 'default' not null,
  "OrgId"                     VARCHAR2(32) default 'default' not null,
  "OrgName"                   VARCHAR2(64) default 'default' not null,
  "OwnerName"                 VARCHAR2(500) default 'default' not null,
  "OwnerEmail"                VARCHAR2(500) default 'default' not null,
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "App"
  is '应用表';
-- Add comments to the columns 
comment on column "App"."Id"
  is '主键';
comment on column "App"."AppId"
  is 'AppID';
comment on column "App"."Name"
  is '应用名';
comment on column "App"."OrgId"
  is '部门Id';
comment on column "App"."OrgName"
  is '部门名字';
comment on column "App"."OwnerName"
  is 'ownerName';
comment on column "App"."OwnerEmail"
  is 'ownerEmail';
comment on column "App"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "App"."DataChange_CreatedTime"
  is '创建时间';
comment on column "App"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "App"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index AppId on "App" ("AppId");
create index DataChange_LastTime on "App" ("DataChange_LastTime");
create index IX_Name on "App" ("Name");


-- Create table
create table "AppNamespace"
(
  "Id"                        NUMBER primary key not null,
  "Name"                      VARCHAR2(32) not null,
  "AppId"                     VARCHAR2(32) not null,
  "Format"                    VARCHAR2(32) default 'properties' not null,
  "IsPublic"                  NUMBER(3) default 1 not null,
  "Comment"                   VARCHAR2(64),
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "AppNamespace"
  is '应用namespace定义';
-- Add comments to the columns 
comment on column "AppNamespace"."Id"
  is '主键';
comment on column "AppNamespace"."Name"
  is 'namespace名字，注意，需要全局唯一';
comment on column "AppNamespace"."AppId"
  is 'app id';
comment on column "AppNamespace"."Format"
  is 'namespace的format类型';
comment on column "AppNamespace"."Comment"
  is '注释';
comment on column "AppNamespace"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "AppNamespace"."DataChange_CreatedTime"
  is '创建时间';
comment on column "AppNamespace"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "AppNamespace"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00000 on "AppNamespace" ("DataChange_LastTime");
create index IX_AppId on "AppNamespace" ("AppId");
create index Name_AppId on "AppNamespace" ("Name", "AppId");
  

-- Create table
create table "Audit"
(
  "Id"                        NUMBER primary key not null,
  "EntityName"                VARCHAR2(50) default 'default' not null,
  "EntityId"                  NUMBER,
  "OpName"                    VARCHAR2(50) default 'default' not null,
  "Comment"                   VARCHAR2(500),
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "Audit"
  is '日志审计表';
-- Add comments to the columns 
comment on column "Audit"."Id"
  is '主键';
comment on column "Audit"."EntityName"
  is '表名';
comment on column "Audit"."EntityId"
  is '记录ID';
comment on column "Audit"."OpName"
  is '操作类型';
comment on column "Audit"."Comment"
  is '备注';
comment on column "Audit"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Audit"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Audit"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Audit"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00001 on "Audit" ("DataChange_LastTime");


-- Create table
create table "Cluster"
(
  "Id"                        NUMBER primary key not null,
  "Name"                      VARCHAR2(32) not null,
  "AppId"                     VARCHAR2(32) not null,
  "ParentClusterId"           NUMBER default 0 not null,
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "Cluster"
  is '集群';
-- Add comments to the columns 
comment on column "Cluster"."Id"
  is '主键';
comment on column "Cluster"."Name"
  is '集群名字';
comment on column "Cluster"."AppId"
  is 'App id';
comment on column "Cluster"."ParentClusterId"
  is '父cluster';
comment on column "Cluster"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Cluster"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Cluster"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Cluster"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00002 on "Cluster" ("DataChange_LastTime");
create index IX_AppId_Name on "Cluster" ("AppId", "Name");
create index IX_ParentClusterId on "Cluster" ("ParentClusterId");


-- Create table
create table "Commit"
(
  "Id"                        NUMBER primary key not null,
  "ChangeSets"                CLOB,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "ClusterName"               VARCHAR2(500) default 'default' not null,
  "NamespaceName"             VARCHAR2(500) default 'default' not null,
  "Comment"                   VARCHAR2(500),
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "Commit"
  is 'commit 历史表';
-- Add comments to the columns 
comment on column "Commit"."Id"
  is '主键';
comment on column "Commit"."ChangeSets"
  is '修改变更集';
comment on column "Commit"."AppId"
  is 'AppID';
comment on column "Commit"."ClusterName"
  is 'ClusterName';
comment on column "Commit"."NamespaceName"
  is 'namespaceName';
comment on column "Commit"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Commit"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Commit"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Commit"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index AppId00000 on "Commit" ("AppId");
create index ClusterName on "Commit" ("ClusterName");
create index DataChange_LastTime00003 on "Commit" ("DataChange_LastTime");
create index NamespaceName on "Commit" ("NamespaceName");


-- Create table
create table "GrayReleaseRule"
(
  "Id"                        NUMBER primary key not null,
  "AppId"                     VARCHAR2(32) default 'default' not null,
  "ClusterName"               VARCHAR2(32) default 'default' not null,
  "NamespaceName"             VARCHAR2(32) default 'default' not null,
  "BranchName"                VARCHAR2(32) default 'default' not null,
  "Rules"                     VARCHAR2(1600),
  "ReleaseId"                 NUMBER default 0 not null,
  "BranchStatus"              NUMBER(3) default 1,
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32) default 'default' not null,
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "GrayReleaseRule"
  is '应用表';
-- Add comments to the columns 
comment on column "GrayReleaseRule"."Id"
  is '主键';
comment on column "GrayReleaseRule"."AppId"
  is 'AppID';
comment on column "GrayReleaseRule"."ClusterName"
  is 'Cluster Name';
comment on column "GrayReleaseRule"."NamespaceName"
  is 'Namespace Name';
comment on column "GrayReleaseRule"."BranchName"
  is 'branch name';
comment on column "GrayReleaseRule"."Rules"
  is '灰度规则';
comment on column "GrayReleaseRule"."ReleaseId"
  is '灰度对应的release';
comment on column "GrayReleaseRule"."BranchStatus"
  is '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布';
comment on column "GrayReleaseRule"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "GrayReleaseRule"."DataChange_CreatedTime"
  is '创建时间';
comment on column "GrayReleaseRule"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "GrayReleaseRule"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00004 on "GrayReleaseRule" ("DataChange_LastTime");
create index IX_Namespace on "GrayReleaseRule" ("AppId", "ClusterName", "NamespaceName");
  
  
-- Create table
create table "Instance"
(
  "Id"                     NUMBER primary key not null,
  "AppId"                  VARCHAR2(32) default 'default' not null,
  "ClusterName"            VARCHAR2(32) default 'default' not null,
  "DataCenter"             VARCHAR2(64) default 'default',
  "Ip"                     VARCHAR2(32) not null,
  "DataChange_CreatedTime" DATE not null,
  "DataChange_LastTime"    DATE not null
);
-- Add comments to the table 
comment on table "Instance"
  is '使用配置的应用实例';
-- Add comments to the columns 
comment on column "Instance"."Id"
  is '主键';
comment on column "Instance"."AppId"
  is 'AppID';
comment on column "Instance"."ClusterName"
  is 'ClusterName';
comment on column "Instance"."DataCenter"
  is 'Data Center Name';
comment on column "Instance"."Ip"
  is 'instance ip';
comment on column "Instance"."DataChange_CreatedTime"
  is '创建时间'; 
comment on column "Instance"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index IX_DataChange_LastTime on "Instance" ("DataChange_LastTime");
create index IX_IP on "Instance" ("Ip");
create unique index IX_UNIQUE_KEY on "Instance" (CASE  WHEN ("AppId" IS NOT NULL AND "ClusterName" IS NOT NULL AND "Ip" IS NOT NULL AND "DataCenter" IS NOT NULL) THEN "AppId"||U', '||"ClusterName"||U', '||"Ip"||U', '||"DataCenter" END);


-- Create table
create table "InstanceConfig"
(
  "Id"                     NUMBER primary key not null,
  "InstanceId"             NUMBER,
  "ConfigAppId"            VARCHAR2(32) default 'default' not null,
  "ConfigClusterName"      VARCHAR2(32) default 'default' not null,
  "ConfigNamespaceName"    VARCHAR2(32) default 'default' not null,
  "ReleaseKey"             VARCHAR2(64) not null,
  "ReleaseDeliveryTime"    DATE,
  "DataChange_CreatedTime" DATE not null,
  "DataChange_LastTime"    DATE not null
);
-- Add comments to the table 
comment on table "InstanceConfig"
  is '应用实例的配置信息';
-- Add comments to the columns 
comment on column "InstanceConfig"."Id"
  is '主键';
comment on column "InstanceConfig"."InstanceId"
  is 'Instance Id';
comment on column "InstanceConfig"."ConfigAppId"
  is 'Config App Id';
comment on column "InstanceConfig"."ConfigClusterName"
  is 'Config Cluster Name';
comment on column "InstanceConfig"."ConfigNamespaceName"
  is 'Config Namespace Name';
comment on column "InstanceConfig"."ReleaseKey"
  is '发布的Key';
comment on column "InstanceConfig"."ReleaseDeliveryTime"
  is '配置获取时间';
comment on column "InstanceConfig"."DataChange_CreatedTime"
  is '创建时间';
comment on column "InstanceConfig"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index IX_DataChange_LastTime00000 on "InstanceConfig" ("DataChange_LastTime");
create index IX_ReleaseKey on "InstanceConfig" ("ReleaseKey");
create unique index IX_UNIQUE_KEY00000 on "InstanceConfig" (CASE  WHEN ("InstanceId" IS NOT NULL AND "ConfigAppId" IS NOT NULL AND "ConfigNamespaceName" IS NOT NULL) THEN SYS_OP_C2C(TO_CHAR("InstanceId")||',')||"ConfigAppId"||U', '||"ConfigNamespaceName" END);
create index IX_Valid_Namespace on "InstanceConfig" ("ConfigAppId", "ConfigClusterName", "ConfigNamespaceName", "DataChange_LastTime");


-- Create table
create table "Item"
(
  "Id"                        NUMBER primary key not null,
  "NamespaceId"               NUMBER default 0 not null,
  "Key"                       VARCHAR2(128) default 'default' not null,
  "Value"                     CLOB,
  "Comment"                   VARCHAR2(1024),
  "LineNum"                   NUMBER default 0,
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "Item"
  is '配置项目';
-- Add comments to the columns 
comment on column "Item"."Id"
  is '主键';
comment on column "Item"."NamespaceId"
  is '集群NamespaceId';
comment on column "Item"."Key"
  is '配置项Key';
comment on column "Item"."Value"
  is '配置项值';
comment on column "Item"."Comment"
  is '注释';
comment on column "Item"."LineNum"
  is '行号';
comment on column "Item"."IsDeleted"
  is 'IsDeleted';
comment on column "Item"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Item"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Item"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Item"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00005 on "Item" ("DataChange_LastTime");
create index IX_GroupId on "Item" ("NamespaceId");


-- Create table
create table "Namespace"
(
  "Id"                        NUMBER primary key not null,
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "ClusterName"               VARCHAR2(500) default 'default' not null,
  "NamespaceName"             VARCHAR2(500) default 'default' not null,
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "Namespace"
  is '命名空间';
-- Add comments to the columns 
comment on column "Namespace"."Id"
  is '主键';
comment on column "Namespace"."AppId"
  is 'AppID';
comment on column "Namespace"."ClusterName"
  is 'Cluster Name';
comment on column "Namespace"."NamespaceName"
  is 'Namespace Name';
comment on column "Namespace"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Namespace"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Namespace"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Namespace"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index AppId_ClusterName_NamespaceNa on "Namespace" ("AppId", "ClusterName", "NamespaceName");
create index DataChange_LastTime00006 on "Namespace" ("DataChange_LastTime");
create index IX_NamespaceName on "Namespace" ("NamespaceName");


-- Create table
create table "NamespaceLock"
(
  "Id"                        NUMBER primary key not null,
  "NamespaceId"               NUMBER default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE,
  "IsDeleted"                 NUMBER(3) default 0 not null
);
-- Add comments to the table 
comment on table "NamespaceLock"
  is 'namespace的编辑锁';
-- Add comments to the columns 
comment on column "NamespaceLock"."Id"
  is '主键';
comment on column "NamespaceLock"."NamespaceId"
  is 'AppID';
comment on column "NamespaceLock"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "NamespaceLock"."DataChange_CreatedTime"
  is '创建时间';
comment on column "NamespaceLock"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "NamespaceLock"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00007 on "NamespaceLock" ("DataChange_LastTime");
create unique index IX_NamespaceId on "NamespaceLock" (CASE  WHEN "NamespaceId" IS NOT NULL THEN "NamespaceId" END);

  
-- Create table
create table "Release"
(
  "Id"                        NUMBER primary key not null,
  "ReleaseKey"                VARCHAR2(64) not null,
  "Name"                      VARCHAR2(64) default 'default' not null,
  "Comment"                   VARCHAR2(256),
  "AppId"                     VARCHAR2(500) default 'default' not null,
  "ClusterName"               VARCHAR2(500) default 'default' not null,
  "NamespaceName"             VARCHAR2(500) default 'default' not null,
  "Configurations"            CLOB,
  "IsAbandoned"               NUMBER(3) default 0 not null,
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "Release"
  is '发布';
-- Add comments to the columns 
comment on column "Release"."Id"
  is '主键';
comment on column "Release"."ReleaseKey"
  is '发布的Key';
comment on column "Release"."Name"
  is '发布名字';
comment on column "Release"."Comment"
  is '发布说明';
comment on column "Release"."AppId"
  is 'AppID';
comment on column "Release"."ClusterName"
  is 'ClusterName';
comment on column "Release"."NamespaceName"
  is 'namespaceName';
comment on column "Release"."Configurations"
  is '发布配置';
comment on column "Release"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "Release"."DataChange_CreatedTime"
  is '创建时间';
comment on column "Release"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "Release"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index AppId_ClusterName_GroupName on "Release" ("AppId", "ClusterName", "NamespaceName");
create index DataChange_LastTime00008 on "Release" ("DataChange_LastTime");
create index IX_ReleaseKey00000 on "Release" ("ReleaseKey");


-- Create table
create table "ReleaseMessage"
(
  "Id"                  NUMBER primary key not null,
  "Message"             VARCHAR2(1024) not null,
  "DataChange_LastTime" DATE not null
);
-- Add comments to the table 
comment on table "ReleaseMessage"
  is '发布消息';
-- Add comments to the columns 
comment on column "ReleaseMessage"."Id"
  is '自增主键';
comment on column "ReleaseMessage"."Message"
  is '发布的消息内容';
comment on column "ReleaseMessage"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00009 on "ReleaseMessage" ("DataChange_LastTime");
create index IX_Message on "ReleaseMessage" ("Message");


-- Create table
create table  "ReleaseHistory"
(
  "Id"                        NUMBER primary key not null,
  "AppId"                     VARCHAR2(32) default 'default' not null,
  "ClusterName"               VARCHAR2(32) default 'default' not null,
  "NamespaceName"             VARCHAR2(32) default 'default' not null,
  "BranchName"                VARCHAR2(32) default 'default' not null,
  "ReleaseId"                 NUMBER default 0 not null,
  "PreviousReleaseId"         NUMBER default 0 not null,
  "Operation"                 NUMBER(5) default 0 not null,
  "OperationContext"          CLOB,
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "ReleaseHistory"
  is '发布历史';
-- Add comments to the columns 
comment on column "ReleaseHistory"."Id"
  is '主键';
comment on column "ReleaseHistory"."AppId"
  is 'AppID';
comment on column "ReleaseHistory"."ClusterName"
  is 'ClusterName';
comment on column "ReleaseHistory"."NamespaceName"
  is 'namespaceName';
comment on column "ReleaseHistory"."BranchName"
  is '发布分支名';
comment on column "ReleaseHistory"."ReleaseId"
  is '关联的Release Id';
comment on column "ReleaseHistory"."PreviousReleaseId"
  is '前一次发布的ReleaseId';
comment on column "ReleaseHistory"."Operation"
  is '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度';
comment on column "ReleaseHistory"."OperationContext"
  is '发布上下文信息';
comment on column "ReleaseHistory"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "ReleaseHistory"."DataChange_CreatedTime"
  is '创建时间';
comment on column "ReleaseHistory"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "ReleaseHistory"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index IX_DataChange_LastTime00001 on  "ReleaseHistory" ("DataChange_LastTime");
create index IX_Namespace00000 on  "ReleaseHistory" ("AppId", "ClusterName", "NamespaceName", "BranchName");
create index IX_ReleaseId on  "ReleaseHistory" ("ReleaseId");


-- Create table
create table "ServerConfig"
(
  "Id"                        NUMBER primary key not null,
  "Key"                       VARCHAR2(64) default 'default' not null,
  "Cluster"                   VARCHAR2(32) default 'default' not null,
  "Value"                     VARCHAR2(500),
  "Comment"                   VARCHAR2(1024),
  "IsDeleted"                 NUMBER(3) default 0 not null,
  "DataChange_CreatedBy"      VARCHAR2(32),
  "DataChange_CreatedTime"    DATE not null,
  "DataChange_LastModifiedBy" VARCHAR2(32),
  "DataChange_LastTime"       DATE
);
-- Add comments to the table 
comment on table "ServerConfig"
  is '配置服务自身配置';
-- Add comments to the columns 
comment on column "ServerConfig"."Id"
  is '主键';
comment on column "ServerConfig"."Key"
  is '配置项Key';
comment on column "ServerConfig"."Cluster"
  is '配置对应的集群，default为不针对特定的集群';
comment on column "ServerConfig"."Value"
  is '配置项值';
comment on column "ServerConfig"."Comment"
  is '注释';
comment on column "ServerConfig"."DataChange_CreatedBy"
  is '创建人邮箱前缀';
comment on column "ServerConfig"."DataChange_CreatedTime"
  is '创建时间';
comment on column "ServerConfig"."DataChange_LastModifiedBy"
  is '最后修改人邮箱前缀';
comment on column "ServerConfig"."DataChange_LastTime"
  is '最后修改时间';
-- Create/Recreate indexes 
create index DataChange_LastTime00010 on "ServerConfig" ("DataChange_LastTime");
create index IX_Key on "ServerConfig" ("Key");

insert into "ServerConfig" values (1, 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('12-09-2017 14:41:58', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (3, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (4, 'appnamespace.private.enable', 'default', 'false', '是否开启private namespace', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));

insert into "ServerConfig" values (5, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', 0, 'default', to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'), null, to_date('11-09-2017 15:41:26', 'dd-mm-yyyy hh24:mi:ss'));


-- Sample Data
-- ------------------------------------------------------------
insert into "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "DataChange_CreatedTime")
values (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', sysdate);

insert into "AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "DataChange_CreatedTime")
values (1, 'application', 'SampleApp', 'properties', 0, 'default app namespace', sysdate);

insert into "Cluster" ("Id", "Name", "AppId", "DataChange_CreatedTime")
values (1, 'default', 'SampleApp', sysdate);

insert into "Namespace" ("Id", "AppId", "ClusterName", "NamespaceName", "DataChange_CreatedTime")
values (1, 'SampleApp', 'default', 'application', sysdate);


insert into "Item" ("Id", "NamespaceId", "Key", "Value", "Comment", "LineNum", "DataChange_CreatedTime")
values (1, 1, 'timeout', '100', 'sample timeout配置', 1, sysdate);

insert into "Release" ("Id", "ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations", "DataChange_CreatedTime")
values (1, '20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{"timeout":"100"}', sysdate);

insert into "ReleaseHistory" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "DataChange_CreatedBy", "DataChange_LastModifiedBy", "DataChange_CreatedTime", "DataChange_LastTime")
values (1, 'SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', 'apollo', 'apollo', sysdate, sysdate);


-- Create sequence 
create sequence ID_SEQ
minvalue 1
maxvalue 9223372036854775807
start with 10
increment by 1
cache 20
cycle
order;