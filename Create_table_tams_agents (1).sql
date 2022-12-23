-- Create table
create table AMS.TAMS_AGENTS
(
  agt_code              VARCHAR2(8) not null,
  can_num               VARCHAR2(10) not null,
  agt_nm                VARCHAR2(80) not null,
  comp_prvd_num         VARCHAR2(3) not null,
  addr_typ              NUMBER(2),
  bank_ac_num           VARCHAR2(20),
  bank_ac_nm            VARCHAR2(100),
  rpt_to_grp            VARCHAR2(7) not null,
  rpt_to_grp_eff_dt     DATE not null,
  mailbox_num           VARCHAR2(10),
  recrut_by             VARCHAR2(8),
  recrut_bns_to         VARCHAR2(8),
  loc_code              VARCHAR2(5),
  rank_cd               VARCHAR2(5) not null,
  rank_eff_dt           DATE not null,
  lst_prom_evl_dt       DATE,
  lst_demo_evl_dt       DATE,
  nxt_prom_evl_dt       DATE,
  nxt_demo_evl_dt       DATE,
  con_evl_fail_cnt      NUMBER(3),
  stat_cd               VARCHAR2(3) not null,
  agt_stat_code         VARCHAR2(2) not null,
  cntrct_eff_dt         DATE not null,
  trmn_dt               DATE,
  clb_mbr_cd            VARCHAR2(5),
  pmt_mthd              VARCHAR2(2),
  trmn_hld_ind          VARCHAR2(1) not null,
  pay_slp_ind           VARCHAR2(1) not null,
  tax_num               VARCHAR2(40),
  agt_typ               VARCHAR2(5) not null,
  pend_cd               VARCHAR2(5),
  pend_flwup_dt         DATE,
  lst_rpt_to_grp        VARCHAR2(5),
  br_code               VARCHAR2(7) not null,
  cntrct_sign_dt        DATE,
  trmn_reasn            VARCHAR2(15),
  lic_num               VARCHAR2(15),
  bus_phone             VARCHAR2(40),
  team_code             VARCHAR2(10),
  unit_code             VARCHAR2(7),
  agt_addr              VARCHAR2(180),
  agt_join_dt           DATE,
  agt_term_dt           DATE,
  zip_code              VARCHAR2(6),
  uwg_lvl               VARCHAR2(10),
  agt_sup               VARCHAR2(5),
  agt_rmk               VARCHAR2(100),
  prom_clas_typ         VARCHAR2(5),
  prom_clas_dt          DATE,
  bank_cd               VARCHAR2(5),
  class_num             VARCHAR2(20),
  course_allw           NUMBER(10),
  train_days            NUMBER(2),
  tax_typ               VARCHAR2(1),
  rcpt_grp_cd           VARCHAR2(1),
  typ_eff_dt            DATE,
  mgr_eff_dt            DATE,
  terr_cd               VARCHAR2(5) default 'VN' not null,
  cat_cd                VARCHAR2(2) default '01' not null,
  grp_prof_eff_dt       DATE,
  mobl_phon_num         VARCHAR2(40),
  grp_prd               VARCHAR2(5),
  agt_sup_eff_dt        DATE,
  bck_to_agt_eff_dt     DATE,
  agt_sup_cnt           NUMBER(1),
  sub_loc               VARCHAR2(5),
  trainee_to_agt_eff_dt DATE,
  mdrt_ind              VARCHAR2(1),
  chnl_cd               VARCHAR2(2),
  fc_ind                VARCHAR2(1),
  mba_ind               VARCHAR2(1),
  iqa_ind               VARCHAR2(1),
  bank_office           VARCHAR2(20),
  gtf_prom_ind          VARCHAR2(1),
  restrict_logon_ind    VARCHAR2(1),
  mdrt_desc             VARCHAR2(5),
  fc_desc               VARCHAR2(5),
  mba_desc              VARCHAR2(5),
  iqa_desc              VARCHAR2(5),
  create_dt             DATE,
  update_by             VARCHAR2(15),
  last_re_open_dt       DATE,
  re_open_by            VARCHAR2(15),
  cms_ind               VARCHAR2(1),
  cms_desc              VARCHAR2(5),
  pol_deliv_to_bnk      VARCHAR2(150),
  epos_ind              VARCHAR2(1) default 'N',
  cmp_ind               VARCHAR2(1),
  lms_up                VARCHAR2(1),
  dtk_ind               VARCHAR2(1)  
)
tablespace TB_MEDIUM
  pctfree 20
  pctused 70
  initrans 30
  maxtrans 255
  storage
  (
    initial 15M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
-- Add comments to the columns 
comment on column AMS.TAMS_AGENTS.prom_clas_typ
  is 'Promotion Class Indicator: UM/SUM/ADM/SADM/DM';
comment on column AMS.TAMS_AGENTS.prom_clas_dt
  is 'Promotion Class Start Date';
comment on column AMS.TAMS_AGENTS.course_allw
  is 'Allowance for training course';
comment on column AMS.TAMS_AGENTS.train_days
  is 'Number of attended days';
comment on column AMS.TAMS_AGENTS.tax_typ
  is 'Fulltime or Parttime';
-- Create/Recreate indexes 
create index AMS.AGENTS_CLASS_NUM_IDX on AMS.TAMS_AGENTS (CLASS_NUM)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.AGT_PRVD_IND on AMS.TAMS_AGENTS (COMP_PRVD_NUM)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.AGT_STAT_LOC on AMS.TAMS_AGENTS (STAT_CD, LOC_CODE)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_AGT_BCH_FK on AMS.TAMS_AGENTS (BR_CODE)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 30
  maxtrans 255
  storage
  (
    initial 1M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_AGT_CMP_IND on AMS.TAMS_AGENTS (CMP_IND)
  tablespace TB_SMALL
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_AGT_COMP_LOC on AMS.TAMS_AGENTS (COMP_PRVD_NUM, LOC_CODE)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_AGT_EPOS_IND on AMS.TAMS_AGENTS (EPOS_IND)
  tablespace TB_SMALL
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_AGT_JOIN_DT on AMS.TAMS_AGENTS (AGT_JOIN_DT)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_AGT_POL_DELIV_TO_BNK on AMS.TAMS_AGENTS (POL_DELIV_TO_BNK)
  tablespace TB_SMALL
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_AGT_RPT176 on AMS.TAMS_AGENTS (AGT_CODE, AGT_STAT_CODE, RANK_CD, RANK_EFF_DT)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 30
  maxtrans 255
  storage
  (
    initial 1360K
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  )
  nologging;
create index AMS.I_LMS_UP on AMS.TAMS_AGENTS (LMS_UP)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_LOC_CD on AMS.TAMS_AGENTS (LOC_CODE)
  tablespace IX_SMALL
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_STAT_CD on AMS.TAMS_AGENTS (AGT_CODE, STAT_CD)
  tablespace IX_MEDIUM
  pctfree 5
  initrans 30
  maxtrans 255
  storage
  (
    initial 1M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_TAMS_AGT_RPT_TO_GRP on AMS.TAMS_AGENTS (RPT_TO_GRP)
  tablespace TB_SMALL
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.I_UNIT_CD on AMS.TAMS_AGENTS (UNIT_CODE, AGT_JOIN_DT)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 30
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.RECRUT_BY_IDX on AMS.TAMS_AGENTS (RECRUT_BY)
  tablespace TB_SMALL
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.TAMS_AGENTS_IDX on AMS.TAMS_AGENTS (AGT_CODE, RPT_TO_GRP)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.TAMS_AGENTS_IX on AMS.TAMS_AGENTS (CAN_NUM)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
create index AMS.TAMS_AGENTS_TEAM_CODE_IDX on AMS.TAMS_AGENTS (TEAM_CODE)
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table AMS.TAMS_AGENTS
  add constraint AGT_MASTER_PK primary key (AGT_CODE)
  using index 
  tablespace IX_MEDIUM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

