package org.amerp.amnmodel;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Properties;

import org.adempiere.util.IProcessUI;
import org.amerp.amnutilities.LoanPeriods;
import org.compiere.util.CCache;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.Trx;

public class MAMN_Payroll_Deferred extends X_AMN_Payroll_Deferred {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5757997611959319285L;
	
	static CLogger log = CLogger.getCLogger(MAMN_Payroll_Deferred.class);
	
	/**	Cache							*/
	private static CCache<Integer,MAMN_Payroll_Deferred> s_cache = new CCache<Integer,MAMN_Payroll_Deferred>(Table_Name, 10);

	public MAMN_Payroll_Deferred(Properties ctx, int AMN_Payroll_Deferred_ID,
			String trxName) {
		super(ctx, AMN_Payroll_Deferred_ID, trxName);
		// TODO Auto-generated constructor stub
	}
	public MAMN_Payroll_Deferred(Properties ctx, ResultSet rs, String trxName) {
		super(ctx, rs, trxName);
		// TODO Auto-generated constructor stub
	}

	/**
	 * createAmnPayrollDeferred
	 * @param ctx
	 * @param locale
	 * @param int p_AD_Client_ID
	 * @param int p_AD_Org_ID
	 * @param int p_AMN_Process_ID	Payroll Process
	 * @param int p_AMN_Contract_ID	Payroll Contract
	 * @param int p_AMN_Payroll_ID
	 * @param int p_AMN_Concept_Types_Proc_ID
	 * @param BigDecimal p_AmountQuota
	 * @return boolean
	 */
	public boolean createAmnPayrollDeferred(Properties ctx, MAMN_Payroll amnpayroll, MAMN_Process amnprocessde, 		
			MAMN_Concept_Types_Proc amnconcepttypesCR, MAMN_Period amnperiod, 
			LoanPeriods loanPeriodData, BigDecimal p_LoanAmount, String trxName) {
		
  		// Employee
		MAMN_Employee amnemployee = new MAMN_Employee(ctx, amnpayroll.getAMN_Employee_ID(), trxName);
		// Crear un formateador con el patrón deseado
        DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Formato YYYY-MM-DD
        
		IProcessUI processMonitor = Env.getProcessUI(ctx);
		MAMN_Payroll_Deferred amnpayrolldeferred = new MAMN_Payroll_Deferred(getCtx(), getAMN_Payroll_Deferred_ID(), get_TrxName());
		amnpayrolldeferred.setAD_Client_ID(amnpayroll.getAD_Client_ID());
		amnpayrolldeferred.setAD_Org_ID(amnpayroll.getAD_Org_ID());
		amnpayrolldeferred.setAMN_Payroll_ID(amnpayroll.getAMN_Payroll_ID());
		amnpayrolldeferred.setAMN_Concept_Types_Proc_ID(amnconcepttypesCR.getAMN_Concept_Types_Proc_ID());
		amnpayrolldeferred.setAMN_Period_ID(amnperiod.getAMN_Period_ID());
		amnpayrolldeferred.setDueDate(amnperiod.getAMNDateEnd());
		amnpayrolldeferred.setAMN_Process_ID(amnprocessde.getAMN_Process_ID());
		amnpayrolldeferred.setAMN_Employee_ID(amnpayroll.getAMN_Employee_ID());
		amnpayrolldeferred.setValue(loanPeriodData.getPeriodValue()+" "+sdf.format(amnperiod.getAMNDateEnd()));
		amnpayrolldeferred.setName(amnemployee.getValue().trim()+" "+sdf.format(amnperiod.getAMNDateEnd())+" ("+decimalFormat.format(p_LoanAmount)+") "+loanPeriodData.getPeriodValue().trim()+" "+amnconcepttypesCR.getName());
		amnpayrolldeferred.setDescription(amnconcepttypesCR.getDescription());
		amnpayrolldeferred.setQtyValue(loanPeriodData.getCuotaAmount());
		amnpayrolldeferred.setAmountCalculated(loanPeriodData.getCuotaAmount());
		amnpayrolldeferred.setAmountCalculated(loanPeriodData.getCuotaAmount());
		amnpayrolldeferred.setAmountDeducted(loanPeriodData.getCuotaAmount());
		amnpayrolldeferred.setAmountBalance(loanPeriodData.getBalanceAmount());
		// SAVES NEW
		amnpayrolldeferred.save(get_TrxName());
		if (processMonitor != null)
		{
			//processMonitor.statusUpdate(Msg.getMsg(Env.getCtx(), "Payroll")+": "+amnemployee.getName());
			processMonitor.statusUpdate(Msg.getElement(Env.getCtx(), "AMN_Payroll_Deferred_ID")+": "+
					amnpayrolldeferred.getValue()+"-"+amnpayrolldeferred.getName());
		}
		//amnpayroll.saveEx(get_TrxName());	//	Creates AMNPayroll Control

		return true;
		
	}	//	createAmnPayrollDetail
	
	/**************************************************************************
	 * 	Before Save
	 *	@param newRecord
	 *	@return true if it can be saved
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		//	Get Line No
		if (getLine() == 0)
		{
			String sql = "SELECT COALESCE(MAX(Line),0)+10 FROM AMN_Payroll_Deferred WHERE AMN_Payroll_ID=?";
			int ii = DB.getSQLValue (get_TrxName(), sql, getAMN_Payroll_ID());
			setLine (ii);
		}
		return true;
	} //	beforeSave
	
	/**
	 * afterSave
	 */
	protected boolean afterSave(boolean p_newRecord, boolean p_success) {

		if (!p_success) {
	        return false;
	    }
	    // Asegurar que el registro actual se haya guardado completamente
       	// Confirmar la transacción global al final del proceso
      	Trx trx = Trx.get(get_TrxName(), false);
      	if (trx != null) {
              trx.commit();
      	}
      	
	    // Obtener el contexto y la transacción actual
	    Properties ctx = getCtx();
	    String trxName = get_TrxName();
	    
		int AMN_Payroll_Detail_ID = 0;
		int AMN_Payroll_ID = getAMN_Payroll_ID();
		if ( AMN_Payroll_ID !=0) {
			// Get AMN_Payroll_Detail_ID
			AMN_Payroll_Detail_ID = MAMN_Payroll_Deferred.getFirstPayrollDetailID(AMN_Payroll_ID,  null);
			if (AMN_Payroll_Detail_ID != 0) {
				// Updates Header Amounts
				MAMN_Payroll_Deferred.updatePayrollDeferredSums(ctx, AMN_Payroll_ID, trxName);
				trx.commit();
				// Recalc Lines Balances
				recalculateCumulativeAmountBalance( ctx, AMN_Payroll_ID,  trxName);
				trx.commit();

			}
		}
		return super.afterSave(p_newRecord, p_success);

	}

    /**
     * Obtiene la suma de un campo específico de AMN_Payroll_Deferred basado en AMN_Payroll_ID.
     * 
     * @param AMN_Payroll_ID ID de la nómina
     * @param fieldName Nombre del campo a sumar (AmountDeducted, QtyValue, AmountCalculated)
     * @param trxName Transacción de la BD
     * @return Suma del campo especificado o BigDecimal.ZERO si no hay datos
     */
    public static BigDecimal getSumByPayroll(int AMN_Payroll_ID, String fieldName, String trxName) {
        if (!fieldName.equals("AmountDeducted") && !fieldName.equals("QtyValue") && !fieldName.equals("AmountCalculated")) {
            throw new IllegalArgumentException("Campo inválido: " + fieldName);
        }

        String sql = "SELECT COALESCE(SUM(" + fieldName + "), 0) FROM AMN_Payroll_Deferred WHERE AMN_Payroll_ID = ?";
        BigDecimal result = DB.getSQLValueBD(trxName, sql, AMN_Payroll_ID);

        return result != null ? result : Env.ZERO;
    }
    
    /**
     * Obtiene la suma de QtyValue, AmountAllocated, AmountDeducted y AmountCalculated
     * de AMN_Payroll_Deferred basado en AMN_Payroll_ID y los asigna a variables globales.
     * Hace el Update a AMN_Payroll_Detail
     *
     * @param AMN_Payroll_ID ID de la nómina
     * @param trxName Nombre de la transacción
     */
    public static void updatePayrollDeferredSums(Properties ctx, int AMN_Payroll_ID, String trxName) {
        if (AMN_Payroll_ID <= 0) {
            log.warning("ID de AMN_Payroll no válido: " + AMN_Payroll_ID);
            return;
        }

        BigDecimal totalQtyValue = Env.ZERO;
        BigDecimal totalAmountAllocated = Env.ZERO;
        BigDecimal totalAmountDeducted = Env.ZERO;
        BigDecimal totalAmountCalculated = Env.ZERO;

        String sql = "SELECT COALESCE(SUM(QtyValue), 0), " +
                     "COALESCE(SUM(AmountAllocated), 0), " +
                     "COALESCE(SUM(AmountDeducted), 0), " +
                     "COALESCE(SUM(AmountCalculated), 0) " +
                     "FROM AMN_Payroll_Deferred WHERE AMN_Payroll_ID = ?";

        try (PreparedStatement pstmt = DB.prepareStatement(sql, trxName);
             ResultSet rs = pstmt.executeQuery()) {
            pstmt.setInt(1, AMN_Payroll_ID);
            if (rs.next()) {
                totalQtyValue = rs.getBigDecimal(1);
                totalAmountAllocated = rs.getBigDecimal(2);
                totalAmountDeducted = rs.getBigDecimal(3);
                totalAmountCalculated = rs.getBigDecimal(4);
            }
        } catch (Exception e) {
            log.severe("Error al calcular los totales de AMN_Payroll_Deferred: " + e.getMessage());
            return;
        }

        // Obtener el primer registro de AMN_Payroll_Detail asociado
        int AMN_Payroll_Detail_ID = getFirstPayrollDetailID(AMN_Payroll_ID, trxName);
        if (AMN_Payroll_Detail_ID > 0) {
            MAMN_Payroll_Detail amnpd = new MAMN_Payroll_Detail(ctx, AMN_Payroll_Detail_ID, trxName);
            amnpd.setQtyValue(totalQtyValue);
            amnpd.setAmountAllocated(totalAmountAllocated);
            amnpd.setAmountDeducted(totalAmountDeducted);
            amnpd.setAmountCalculated(totalAmountCalculated);
            amnpd.saveEx(trxName); // Guardar con la transacción actual
            log.info("AMN_Payroll_Detail actualizado correctamente: " + AMN_Payroll_Detail_ID);
        } else {
            log.warning("No se encontró un AMN_Payroll_Detail para actualizar.");
        }

        // Actualizar la cabecera de AMN_Payroll
        MAMN_Payroll amnPayroll = new MAMN_Payroll(ctx, AMN_Payroll_ID, trxName);
        if (amnPayroll.get_ID() > 0) {
            amnPayroll.setAmountNetpaid(totalAmountCalculated);
            amnPayroll.setAmountAllocated(totalAmountAllocated);
            amnPayroll.setAmountDeducted(totalAmountDeducted);
            amnPayroll.setAmountCalculated(totalAmountCalculated);
            amnPayroll.saveEx(trxName); // Guardar con la transacción actual
            log.info("AMN_Payroll actualizado correctamente: " + AMN_Payroll_ID);
        } else {
            log.warning("No se encontró un AMN_Payroll con ID: " + AMN_Payroll_ID);
        }
    }



    /**
     * Obtiene el ID de AMN_Payroll_Detail basado en AMN_Payroll_ID y AMN_Concept_Types_Proc_ID.
     * 
     * @param AMN_Payroll_ID ID de la nómina
     * @param AMN_Concept_Types_Proc_ID ID del concepto de nómina
     * @param trxName Transacción de la BD
     * @return ID de AMN_Payroll_Detail o 0 si no se encuentra
     */
    public static int getPayrollDetailID(int AMN_Payroll_ID, int AMN_Concept_Types_Proc_ID, String trxName) {
        String sql = "SELECT AMN_Payroll_Detail_ID FROM AMN_Payroll_Detail " +
                     "WHERE AMN_Payroll_ID = ? AND AMN_Concept_Types_Proc_ID = ?";

        int payrollDetailID = DB.getSQLValue(trxName, sql, AMN_Payroll_ID, AMN_Concept_Types_Proc_ID);

        return payrollDetailID > 0 ? payrollDetailID : 0;
    }
    
    /**
     * Obtiene el primer ID de AMN_Payroll_Detail basado en AMN_Payroll_ID.
     * 
     * @param AMN_Payroll_ID ID de la nómina
     * @param trxName Transacción de la BD
     * @return Primer ID de AMN_Payroll_Detail o 0 si no se encuentra
     */
    public static int getFirstPayrollDetailID(int AMN_Payroll_ID, String trxName) {
        String sql = "SELECT AMN_Payroll_Detail_ID FROM AMN_Payroll_Detail " +
                     "WHERE AMN_Payroll_ID = ? ORDER BY AMN_Payroll_Detail_ID ASC FETCH FIRST 1 ROW ONLY";

        int payrollDetailID = DB.getSQLValue(trxName, sql, AMN_Payroll_ID);

        return payrollDetailID > 0 ? payrollDetailID : 0;
    }

    /**
     * recalculateCumulativeAmountBalance
     * @param AMN_Payroll_ID
     * @param trxName
     */
    public static void recalculateCumulativeAmountBalance(Properties ctx, int AMN_Payroll_ID, String trxName) {
        String sql = "SELECT AMN_Payroll_Deferred_ID, AmountAllocated, AmountDeducted, duedate " +
                     "FROM AMN_Payroll_Deferred " +
                     "WHERE AMN_Payroll_ID = ? " +
                     "ORDER BY duedate ASC";  // Ordenar por fecha de vencimiento

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BigDecimal cumulativeBalance = BigDecimal.ZERO;  // Inicia el saldo acumulado

        // UBICA EL SALDO INICIAL
        MAMN_Payroll amnpayroll = new MAMN_Payroll( ctx, AMN_Payroll_ID,  trxName);
        if (amnpayroll != null && amnpayroll.getAmountNetpaid().compareTo(BigDecimal.ZERO) > 0) {
        	// Initial Balance
        	cumulativeBalance =  amnpayroll.getAmountNetpaid();
	        try {
	            pstmt = DB.prepareStatement(sql, trxName);
	            pstmt.setInt(1, AMN_Payroll_ID);
	            rs = pstmt.executeQuery();
	
	            while (rs.next()) {
	                int deferredID = rs.getInt("AMN_Payroll_Deferred_ID");
	                BigDecimal amountAllocated = rs.getBigDecimal("AmountAllocated");
	                if (amountAllocated== null) 
	                	amountAllocated = BigDecimal.ZERO;
	                BigDecimal amountDeducted = rs.getBigDecimal("AmountDeducted");
	                if (amountDeducted== null) 
	                	amountDeducted = BigDecimal.ZERO;
	
	                // Calcular el nuevo balance acumulativo
	                BigDecimal newBalance = cumulativeBalance.add(amountAllocated).subtract(amountDeducted);
	
	                // Actualizar el saldo en la BD
	                String updateSQL = "UPDATE AMN_Payroll_Deferred SET AmountBalance = ? WHERE AMN_Payroll_Deferred_ID = ?";
	                DB.executeUpdate(updateSQL, new Object[]{newBalance, deferredID}, false, trxName);
	
	                // Actualizar el saldo acumulado para la siguiente línea
	                cumulativeBalance = newBalance;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            DB.close(rs, pstmt);
	        }
        }
    }


}
