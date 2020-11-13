package kr.happyjob.chainmaker.system.model;

public class UsrMgrModel {
	// 사용자 번호
	private int row_num;
	
	// 사용자 시스템 ID * 형식 : [접두어,1][년,2][월,2][일련번호,4] 예) U17100001
	private String usr_sst_id;
	
	// 오피스 시스템 ID
	private String ofc_id;
  
	// 사용자 성명
	private String usr_nm;

	// 로그인 ID
	private String lgn_id;

	// 비밀번호
	private String pwd;

	// 사용 유무
	private String use_poa;

	// 삭제 유무
	private String dlt_poa;

	// 최초 등록 일시
	private String fst_enlm_dtt;

	// 최초 등록자 시스템 ID
	private String fst_rgst_sst_id;

	// 최종 수정 일시
	private String fnl_mdfd_dtt;

	// 최종 수정자 시스템 ID
	private String fnl_mdfr_sst_id;

	// 부서 코드
	private String dept_cod;

	// 직위 코드
	private String ppst_cod;

	// 직책 코드
	private String pst_cod;
  
	// 부서 명
	private String dept_nm;

	// 직위 명
	private String ppst_nm;

	// 직책 명
	private String pst_nm;

	// 전화번호_국가
	private String pnn_ctr;

	//통합 전화번호 	
	private String pnn;	
	//통합 핸폰 	
    private String cpn;
    
	// 이메일
	private String eml;

	//공통코드
	private String DTL_COD;
	private String DTL_COD_NM;
	
    //권한 부여
	private String mempvg;
	private String memsecpvg;
	private String memtelpgv;
	private String memphnpgn;
	private String mememlpgv;
/*	private String EMAILTYPE;
	private String ADMTYPE;
	*/
	
    //-------------------ADMINFO----------------------
     private String ADMID;
     private String ADMPW;
     private String ADMNAME;
     private String ADMTEL;
     private String ADMHP;
     private String ADMFAX;
     private String ADMEMAIL;
     private String ADMZIPCODE;
     private String ADMADDRS;
     private String ADMADDRD;
     private String MEMTYPE;
     private String MEMJUMIN;
     private String MEMTEL;
     private String MEMHP;
     private String MEMEMAIL;
     private String EMAILTYPE;
     private String ADMTYPE;
     private String ADMWRITEDATE;
     private String ADMMODIFYDATE;
     private String ADMDELETEDATE;
     private String ADMSTATUS;
     private String ADMMEMO;

	
	 //-------------------ADMINFO----------------------
	

     private String pnn_1;
     private String pnn_2;
     private String pnn_3;
     
     private String cpn_1;
     private String cpn_2;
     private String cpn_3;
     
     
     
     
	/**
	 * @return the cpn_1
	 */
	public String getCpn_1() {
		return cpn_1;
	}

	/**
	 * @param cpn_1 the cpn_1 to set
	 */
	public void setCpn_1(String cpn_1) {
		this.cpn_1 = cpn_1;
	}

	/**
	 * @return the cpn_2
	 */
	public String getCpn_2() {
		return cpn_2;
	}

	/**
	 * @param cpn_2 the cpn_2 to set
	 */
	public void setCpn_2(String cpn_2) {
		this.cpn_2 = cpn_2;
	}

	/**
	 * @return the cpn_3
	 */
	public String getCpn_3() {
		return cpn_3;
	}

	/**
	 * @param cpn_3 the cpn_3 to set
	 */
	public void setCpn_3(String cpn_3) {
		this.cpn_3 = cpn_3;
	}

	/**
	 * @return the pnn_1
	 */
	public String getPnn_1() {
		return pnn_1;
	}

	/**
	 * @param pnn_1 the pnn_1 to set
	 */
	public void setPnn_1(String pnn_1) {
		this.pnn_1 = pnn_1;
	}

	/**
	 * @return the pnn_2
	 */
	public String getPnn_2() {
		return pnn_2;
	}

	/**
	 * @param pnn_2 the pnn_2 to set
	 */
	public void setPnn_2(String pnn_2) {
		this.pnn_2 = pnn_2;
	}

	/**
	 * @return the pnn_3
	 */
	public String getPnn_3() {
		return pnn_3;
	}

	/**
	 * @param pnn_3 the pnn_3 to set
	 */
	public void setPnn_3(String pnn_3) {
		this.pnn_3 = pnn_3;
	}

	/**
	 * @return the mempvg
	 */
	public String getMempvg() {
		return mempvg;
	}

	/**
	 * @return the aDMID
	 */
	public String getADMID() {
		return ADMID;
	}

	/**
	 * @param aDMID the aDMID to set
	 */
	public void setADMID(String aDMID) {
		ADMID = aDMID;
	}

	/**
	 * @return the aDMPW
	 */
	public String getADMPW() {
		return ADMPW;
	}

	/**
	 * @param aDMPW the aDMPW to set
	 */
	public void setADMPW(String aDMPW) {
		ADMPW = aDMPW;
	}

	/**
	 * @return the aDMNAME
	 */
	public String getADMNAME() {
		return ADMNAME;
	}

	/**
	 * @param aDMNAME the aDMNAME to set
	 */
	public void setADMNAME(String aDMNAME) {
		ADMNAME = aDMNAME;
	}

	/**
	 * @return the aDMTEL
	 */
	public String getADMTEL() { // 전화번호 	
		return ADMTEL;
	}

	/**
	 * @param aDMTEL the aDMTEL to set
	 */
	public void setADMTEL(String aDMTEL) {
		ADMTEL = aDMTEL;
	}

	/**
	 * @return the aDMHP
	 */
	public String getADMHP() {		
		return ADMHP;
	}

	/**
	 * @param aDMHP the aDMHP to set
	 */
	public void setADMHP(String aDMHP) {
		ADMHP = aDMHP;
	}

	/**
	 * @return the aDMFAX
	 */
	public String getADMFAX() {
		return ADMFAX;
	}

	/**
	 * @param aDMFAX the aDMFAX to set
	 */
	public void setADMFAX(String aDMFAX) {
		ADMFAX = aDMFAX;
	}

	/**
	 * @return the aDMEMAIL
	 */
	public String getADMEMAIL() {
		return ADMEMAIL;
	}

	/**
	 * @param aDMEMAIL the aDMEMAIL to set
	 */
	public void setADMEMAIL(String aDMEMAIL) {
		ADMEMAIL = aDMEMAIL;
	}

	/**
	 * @return the aDMZIPCODE
	 */
	public String getADMZIPCODE() {
		return ADMZIPCODE;
	}

	/**
	 * @param aDMZIPCODE the aDMZIPCODE to set
	 */
	public void setADMZIPCODE(String aDMZIPCODE) {
		ADMZIPCODE = aDMZIPCODE;
	}

	/**
	 * @return the aDMADDRS
	 */
	public String getADMADDRS() {
		return ADMADDRS;
	}

	/**
	 * @param aDMADDRS the aDMADDRS to set
	 */
	public void setADMADDRS(String aDMADDRS) {
		ADMADDRS = aDMADDRS;
	}

	/**
	 * @return the aDMADDRD
	 */
	public String getADMADDRD() {
		return ADMADDRD;
	}

	/**
	 * @param aDMADDRD the aDMADDRD to set
	 */
	public void setADMADDRD(String aDMADDRD) {
		ADMADDRD = aDMADDRD;
	}

	/**
	 * @return the mEMTYPE
	 */
	public String getMEMTYPE() {
		return MEMTYPE;
	}

	/**
	 * @param mEMTYPE the mEMTYPE to set
	 */
	public void setMEMTYPE(String mEMTYPE) {
		MEMTYPE = mEMTYPE;
	}

	/**
	 * @return the mEMJUMIN
	 */
	public String getMEMJUMIN() {
		return MEMJUMIN;
	}

	/**
	 * @param mEMJUMIN the mEMJUMIN to set
	 */
	public void setMEMJUMIN(String mEMJUMIN) {
		MEMJUMIN = mEMJUMIN;
	}

	/**
	 * @return the mEMTEL
	 */
	public String getMEMTEL() {
		return MEMTEL;
	}

	/**
	 * @param mEMTEL the mEMTEL to set
	 */
	public void setMEMTEL(String mEMTEL) {
		MEMTEL = mEMTEL;
	}

	/**
	 * @return the mEMHP
	 */
	public String getMEMHP() {
		return MEMHP;
	}

	/**
	 * @param mEMHP the mEMHP to set
	 */
	public void setMEMHP(String mEMHP) {
		MEMHP = mEMHP;
	}

	/**
	 * @return the mEMEMAIL
	 */
	public String getMEMEMAIL() {
		return MEMEMAIL;
	}

	/**
	 * @param mEMEMAIL the mEMEMAIL to set
	 */
	public void setMEMEMAIL(String mEMEMAIL) {
		MEMEMAIL = mEMEMAIL;
	}

	/**
	 * @return the eMAILTYPE
	 */
	public String getEMAILTYPE() {
		return EMAILTYPE;
	}

	/**
	 * @param eMAILTYPE the eMAILTYPE to set
	 */
	public void setEMAILTYPE(String eMAILTYPE) {
		EMAILTYPE = eMAILTYPE;
	}

	/**
	 * @return the aDMTYPE
	 */
	public String getADMTYPE() {
		return ADMTYPE;
	}

	/**
	 * @param aDMTYPE the aDMTYPE to set
	 */
	public void setADMTYPE(String aDMTYPE) {
		ADMTYPE = aDMTYPE;
	}

	/**
	 * @return the aDMWRITEDATE
	 */
	public String getADMWRITEDATE() {
		return ADMWRITEDATE;
	}

	/**
	 * @param aDMWRITEDATE the aDMWRITEDATE to set
	 */
	public void setADMWRITEDATE(String aDMWRITEDATE) {
		ADMWRITEDATE = aDMWRITEDATE;
	}

	/**
	 * @return the aDMMODIFYDATE
	 */
	public String getADMMODIFYDATE() {
		return ADMMODIFYDATE;
	}

	/**
	 * @param aDMMODIFYDATE the aDMMODIFYDATE to set
	 */
	public void setADMMODIFYDATE(String aDMMODIFYDATE) {
		ADMMODIFYDATE = aDMMODIFYDATE;
	}

	/**
	 * @return the aDMDELETEDATE
	 */
	public String getADMDELETEDATE() {
		return ADMDELETEDATE;
	}

	/**
	 * @param aDMDELETEDATE the aDMDELETEDATE to set
	 */
	public void setADMDELETEDATE(String aDMDELETEDATE) {
		ADMDELETEDATE = aDMDELETEDATE;
	}

	/**
	 * @return the aDMSTATUS
	 */
	public String getADMSTATUS() {
		return ADMSTATUS;
	}

	/**
	 * @param aDMSTATUS the aDMSTATUS to set
	 */
	public void setADMSTATUS(String aDMSTATUS) {
		ADMSTATUS = aDMSTATUS;
	}

	/**
	 * @return the aDMMEMO
	 */
	public String getADMMEMO() {
		return ADMMEMO;
	}

	/**
	 * @param aDMMEMO the aDMMEMO to set
	 */
	public void setADMMEMO(String aDMMEMO) {
		ADMMEMO = aDMMEMO;
	}

	/**
	 * @param mempvg the mempvg to set
	 */
	public void setMempvg(String mempvg) {
		this.mempvg = mempvg;
	}

	/**
	 * @return the memsecpvg
	 */
	public String getMemsecpvg() {
		return memsecpvg;
	}

	/**
	 * @param memsecpvg the memsecpvg to set
	 */
	public void setMemsecpvg(String memsecpvg) {
		this.memsecpvg = memsecpvg;
	}

	/**
	 * @return the memtelpgv
	 */
	public String getMemtelpgv() {
		return memtelpgv;
	}

	/**
	 * @param memtelpgv the memtelpgv to set
	 */
	public void setMemtelpgv(String memtelpgv) {
		this.memtelpgv = memtelpgv;
	}

	/**
	 * @return the memphnpgn
	 */
	public String getMemphnpgn() {
		return memphnpgn;
	}

	/**
	 * @param memphnpgn the memphnpgn to set
	 */
	public void setMemphnpgn(String memphnpgn) {
		this.memphnpgn = memphnpgn;
	}

	/**
	 * @return the mememlpgv
	 */
	public String getMememlpgv() {
		return mememlpgv;
	}

	/**
	 * @param mememlpgv the mememlpgv to set
	 */
	public void setMememlpgv(String mememlpgv) {
		this.mememlpgv = mememlpgv;
	}

	
	//통합 핸폰
	/**
	 * @return the cpn
	 */
	public String getCpn() {
		return cpn;
	}

	/**
	 * @param cpn the cpn to set
	 */
	public void setCpn(String cpn) {
		this.cpn = cpn;
	}
	
	//통합 전화번호 
	
	/**
	 * @return the pnn
	 */
	public String getPnn() {
		return pnn;
	}

	/**
	 * @param pnn the pnn to set
	 */
	public void setPnn(String pnn) {
		this.pnn = pnn;
	}
	
	/**
	 * @return the dTL_COD
	 */
	public String getDTL_COD() {
		return DTL_COD;
	}

	/**
	 * @param dTL_COD the dTL_COD to set
	 */
	public void setDTL_COD(String dTL_COD) {
		DTL_COD = dTL_COD;
	}

	/**
	 * @return the dTL_COD_NM
	 */
	public String getDTL_COD_NM() {
		return DTL_COD_NM;
	}

	/**
	 * @param dTL_COD_NM the dTL_COD_NM to set
	 */
	public void setDTL_COD_NM(String dTL_COD_NM) {
		DTL_COD_NM = dTL_COD_NM;
	}

	
	/**
	 * @return the mem_author
	 */
	public String getMem_author() {
		return mem_author;
	}

	/**
	 * @param mem_author the mem_author to set
	 */
	public void setMem_author(String mem_author) {
		this.mem_author = mem_author;
	}

	private String mem_author;
	
	/**
	 * @return the row_num
	 */
	public int getRow_num() {
		return row_num;
	}

	/**
	 * @param row_num the row_num to set
	 */
	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	/**
	 * @return the usr_sst_id
	 */
	public String getUsr_sst_id() {
		return usr_sst_id;
	}

	/**
	 * @param usr_sst_id the usr_sst_id to set
	 */
	public void setUsr_sst_id(String usr_sst_id) {
		this.usr_sst_id = usr_sst_id;
	}

	/**
	 * @return the ofc_id
	 */
	public String getOfc_id() {
		return ofc_id;
	}

	/**
	 * @param ofc_id the ofc_id to set
	 */
	public void setOfc_id(String ofc_id) {
		this.ofc_id = ofc_id;
	}

	/**
	 * @return the usr_nm
	 */
	public String getUsr_nm() {
		return usr_nm;
	}

	/**
	 * @param usr_nm the usr_nm to set
	 */
	public void setUsr_nm(String usr_nm) {
		this.usr_nm = usr_nm;
	}

	/**
	 * @return the lgn_id
	 */
	public String getLgn_id() {
		return lgn_id;
	}

	/**
	 * @param lgn_id the lgn_id to set
	 */
	public void setLgn_id(String lgn_id) {
		this.lgn_id = lgn_id;
	}

	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}

	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * @return the use_poa
	 */
	public String getUse_poa() {
		return use_poa;
	}

	/**
	 * @param use_poa the use_poa to set
	 */
	public void setUse_poa(String use_poa) {
		this.use_poa = use_poa;
	}

	/**
	 * @return the dlt_poa
	 */
	public String getDlt_poa() {
		return dlt_poa;
	}

	/**
	 * @param dlt_poa the dlt_poa to set
	 */
	public void setDlt_poa(String dlt_poa) {
		this.dlt_poa = dlt_poa;
	}

	/**
	 * @return the fst_enlm_dtt
	 */
	public String getFst_enlm_dtt() {
		return fst_enlm_dtt;
	}

	/**
	 * @return the dept_nm
	 */
	public String getDept_nm() {
		return dept_nm;
	}

	/**
	 * @param dept_nm the dept_nm to set
	 */
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	/**
	 * @return the ppst_nm
	 */
	public String getPpst_nm() {
		return ppst_nm;
	}

	/**
	 * @param ppst_nm the ppst_nm to set
	 */
	public void setPpst_nm(String ppst_nm) {
		this.ppst_nm = ppst_nm;
	}

	/**
	 * @return the pst_nm
	 */
	public String getPst_nm() {
		return pst_nm;
	}

	/**
	 * @param pst_nm the pst_nm to set
	 */
	public void setPst_nm(String pst_nm) {
		this.pst_nm = pst_nm;
	}

	/**
	 * @param fst_enlm_dtt the fst_enlm_dtt to set
	 */
	public void setFst_enlm_dtt(String fst_enlm_dtt) {
		this.fst_enlm_dtt = fst_enlm_dtt;
	}

	/**
	 * @return the fst_rgst_sst_id
	 */
	public String getFst_rgst_sst_id() {
		return fst_rgst_sst_id;
	}

	/**
	 * @param fst_rgst_sst_id the fst_rgst_sst_id to set
	 */
	public void setFst_rgst_sst_id(String fst_rgst_sst_id) {
		this.fst_rgst_sst_id = fst_rgst_sst_id;
	}

	/**
	 * @return the fnl_mdfd_dtt
	 */
	public String getFnl_mdfd_dtt() {
		return fnl_mdfd_dtt;
	}

	/**
	 * @param fnl_mdfd_dtt the fnl_mdfd_dtt to set
	 */
	public void setFnl_mdfd_dtt(String fnl_mdfd_dtt) {
		this.fnl_mdfd_dtt = fnl_mdfd_dtt;
	}

	/**
	 * @return the fnl_mdfr_sst_id
	 */
	public String getFnl_mdfr_sst_id() {
		return fnl_mdfr_sst_id;
	}

	/**
	 * @param fnl_mdfr_sst_id the fnl_mdfr_sst_id to set
	 */
	public void setFnl_mdfr_sst_id(String fnl_mdfr_sst_id) {
		this.fnl_mdfr_sst_id = fnl_mdfr_sst_id;
	}

	/**
	 * @return the dept_cod
	 */
	public String getDept_cod() {
		return dept_cod;
	}

	/**
	 * @param dept_cod the dept_cod to set
	 */
	public void setDept_cod(String dept_cod) {
		this.dept_cod = dept_cod;
	}

	/**
	 * @return the ppst_cod
	 */
	public String getPpst_cod() {
		return ppst_cod;
	}

	/**
	 * @param ppst_cod the ppst_cod to set
	 */
	public void setPpst_cod(String ppst_cod) {
		this.ppst_cod = ppst_cod;
	}

	/**
	 * @return the pst_cod
	 */
	public String getPst_cod() {
		return pst_cod;
	}

	/**
	 * @param pst_cod the pst_cod to set
	 */
	public void setPst_cod(String pst_cod) {
		this.pst_cod = pst_cod;
	}

	/**
	 * @return the pnn_ctr
	 */
	public String getPnn_ctr() {
		return pnn_ctr;
	}

	/**
	 * @param pnn_ctr the pnn_ctr to set
	 */
	public void setPnn_ctr(String pnn_ctr) {
		this.pnn_ctr = pnn_ctr;
	}



	/**
	 * @return the eml
	 */
	public String getEml() {
		return eml;
	}

	/**
	 * @param eml the eml to set
	 */
	public void setEml(String eml) {
		this.eml = eml;
	}
	
	
}
