using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {
    }

    BAL bal;

    [WebMethod]
    public string InsertEmployee(string empNum, DateTime empDate, DateTime termDate, string firstName, string lastName, DateTime birthDate)
    {
        CommonNoId(empNum, empDate, termDate, firstName, lastName, birthDate);
        string status = bal.Insert();

        if (status == "PASS")
            return "Employee details inserted.";
        else
            return "Employee details not inserted.";
    }

    [WebMethod]
    public string UpdateEmployee(int perId, string empNum, DateTime empDate, DateTime termDate, string firstName, string lastName, DateTime birthDate)
    {
        CommonUpdate(perId, empNum, empDate, termDate, firstName, lastName, birthDate);
        string status = bal.Update();

        if (status == "PASS")
            return "Employee details Updated.";
        else
            return "Employee details not Updated.";
    }

    [WebMethod]
    public string DeleteEmployee(int persId)
    {
        bal = new BAL();
        string status = bal.Delete(persId);

        if (status == "PASS")
            return "Employee details deleted.";
        else
            return "Employee details not deleted.";
    }

    [WebMethod]
    public List<BAL> SelectEmployee(int persId)
    {
        bal = new BAL();
        List<BAL> lstbal = bal.Select(persId);

        if (lstbal != null)
            return lstbal;
        else
            return lstbal;
    }

    [WebMethod]
    public List<BAL> SelectAllEmployee()
    {
        bal = new BAL();
        List<BAL> lstbal = bal.SelectAll();

        if (lstbal != null)
            return lstbal;
        else
            return lstbal;
    }

    private void Common(int empId, int persId, string empNum, DateTime empDate, DateTime termDate, string firstName, string lastName, DateTime birthDate)
    {
        bal = new BAL
        {
            EmpId = empId,
            PersonId = persId,
            EmpNum = empNum,
            EmployedDate = empDate,
            EmpTermDate = termDate,
            FirstName = firstName,
            LastName =lastName,
            BirthDate =birthDate
        };
    }
    private void CommonNoId(string empNum, DateTime empDate, DateTime termDate, string firstName, string lastName, DateTime birthDate)
    {
        bal = new BAL
        {
            EmpNum = empNum,
            EmployedDate = empDate,
            EmpTermDate = termDate,
            FirstName = firstName,
            LastName = lastName,
            BirthDate = birthDate
        };
    }
    private void CommonUpdate( int persId, string empNum, DateTime empDate, DateTime termDate, string firstName, string lastName, DateTime birthDate)
    {
        bal = new BAL
        {
            PersonId = persId,
            EmpNum = empNum,
            EmployedDate = empDate,
            EmpTermDate = termDate,
            FirstName = firstName,
            LastName = lastName,
            BirthDate = birthDate
        };
    }
}
