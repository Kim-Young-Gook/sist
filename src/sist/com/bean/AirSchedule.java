package sist.com.bean;

public class AirSchedule {
	private String S_NO; /* ���׹�ȣ */
	private String P_NO;/* ������ڵ� */
	private String AL_NO; /* �װ����ڵ� */
	private String AP_NO; /* ��߰����ڵ� */
	private String AP_NO2; /* ���������ڵ� */
	private String DEPARTTIME; /* ��߽ð� */
	private String ARRIVALTIME; /* �����ð� */
	private String LEAD; /* �ҿ�ð� */
	private String COST;/* ���� */
	private String SEAT; /* �¼��� */
	
	public String getS_NO() {
		return S_NO;
	}
	public void setS_NO(String s_NO) {
		S_NO = s_NO;
	}
	public String getP_NO() {
		return P_NO;
	}
	public void setP_NO(String p_NO) {
		P_NO = p_NO;
	}
	public String getAL_NO() {
		return AL_NO;
	}
	public void setAL_NO(String aL_NO) {
		AL_NO = aL_NO;
	}
	public String getAP_NO() {
		return AP_NO;
	}
	public void setAP_NO(String aP_NO) {
		AP_NO = aP_NO;
	}
	public String getAP_NO2() {
		return AP_NO2;
	}
	public void setAP_NO2(String aP_NO2) {
		AP_NO2 = aP_NO2;
	}
	public String getDEPARTTIME() {
		return DEPARTTIME;
	}
	public void setDEPARTTIME(String dEPARTTIME) {
		DEPARTTIME = dEPARTTIME;
	}
	public String getARRIVALTIME() {
		return ARRIVALTIME;
	}
	public void setARRIVALTIME(String aRRIVALTIME) {
		ARRIVALTIME = aRRIVALTIME;
	}
	public String getLEAD() {
		return LEAD;
	}
	public void setLEAD(String lEAD) {
		LEAD = lEAD;
	}
	public String getCOST() {
		return COST;
	}
	public void setCOST(String cOST) {
		COST = cOST;
	}
	public String getSEAT() {
		return SEAT;
	}
	public void setSEAT(String sEAT) {
		SEAT = sEAT;
	}
	
	@Override
	public String toString() {
		return "Line [S_NO=" + S_NO + ", P_NO=" + P_NO + ", AL_NO=" + AL_NO + ", AP_NO=" + AP_NO + ", AP_NO2=" + AP_NO2
				+ ", DEPARTTIME=" + DEPARTTIME + ", ARRIVALTIME=" + ARRIVALTIME + ", LEAD=" + LEAD + ", COST=" + COST
				+ ", SEAT=" + SEAT + "]";
	}
}
