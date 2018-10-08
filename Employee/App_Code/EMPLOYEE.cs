using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EMPLOYEE
/// </summary>
public class EMPLOYEE
{
    //Employee
    private int _empId;
    private string _empNum;
    private DateTime _employedDate;
    private DateTime _empTermDate;
    public EMPLOYEE()
    {
        //
        // TODO: Add constructor logic here
        //

        this.EmpId = _empId;
        this.EmpNum = _empNum;
        this.EmployedDate = _employedDate;
        this.EmpTermDate = _empTermDate;

    }

    public int EmpId
    {
        get { return _empId; }
        set { _empId = value; }
    }
    public string EmpNum
    {
        get { return _empNum; }
        set { _empNum = value; }
    }
    public DateTime EmployedDate
    {
        get { return _employedDate; }
        set { _employedDate = value; }
    }
    public DateTime EmpTermDate
    {
        get { return _empTermDate; }
        set { _empTermDate = value; }
    }

   
}