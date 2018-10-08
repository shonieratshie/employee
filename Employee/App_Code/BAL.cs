using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class BAL
{
    //Employee
    private int _empId;
    private string _empNum;
    private DateTime _employedDate;
    private DateTime _empTermDate;

    //Person
    private int _perId;
    private string _firstName;
    private string _lastName;
    private DateTime _birthDate;

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
    public int PersonId
    {
        get { return _perId; }
        set { _perId = value; }
    }
    public string FirstName
    {
        get { return _firstName; }
        set { _firstName = value; }
    }
    public string LastName
    {
        get { return _lastName; }
        set { _lastName = value; }
    }
    public DateTime BirthDate
    {
        get { return _birthDate; }
        set { _birthDate = value; }
    }

    
	public BAL()
	{
	}

    string conStr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

    public string Insert()
    {
        using (SqlConnection sqlcon = new SqlConnection(conStr))
        {
            SqlCommand sqlcmd = new SqlCommand("spInsertEmp", sqlcon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@EmployeeNum", EmpNum);
            sqlcmd.Parameters.AddWithValue("@EmployedDate", EmployedDate);
            sqlcmd.Parameters.AddWithValue("@TerminatedDate", EmpTermDate);
            sqlcmd.Parameters.AddWithValue("@FirstName", FirstName);
            sqlcmd.Parameters.AddWithValue("@LastName", LastName);
            sqlcmd.Parameters.AddWithValue("@BirthDate", BirthDate);

            sqlcon.Open();
            int count = sqlcmd.ExecuteNonQuery();

            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
    }

    public string Update()
    {
        using (SqlConnection sqlcon = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("spUpdateEmp", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PersonId", PersonId);
            cmd.Parameters.AddWithValue("@EmployeeNum", EmpNum);
            cmd.Parameters.AddWithValue("@EmployedDate", EmployedDate);
            cmd.Parameters.AddWithValue("@TerminatedDate", EmpTermDate);
            cmd.Parameters.AddWithValue("@FirstName", FirstName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@BirthDate", BirthDate);

            sqlcon.Open();
            int count = cmd.ExecuteNonQuery();
            sqlcon.Close();

            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
    }

    public List<BAL> Select(int persId)
    {
        using (SqlConnection sqlcon = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("spSelectEmp", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PersonId", persId);

            sqlcon.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            List<BAL> lstbal = new List<BAL>();
            while (dr.Read())
            {
                BAL bal = new BAL
                {
                    EmpId = Convert.ToInt32(dr["EmployeeId"]),
                    PersonId = Convert.ToInt32(dr["PersonId"]),
                    EmpNum = dr["EmployeeNum"].ToString(),
                    EmployedDate = Convert.ToDateTime(dr["EmployedDate"]),
                    EmpTermDate = Convert.ToDateTime(dr["TerminatedDate"]),
                    FirstName = dr["FirstName"].ToString(),
                    LastName = dr["LastName"].ToString(),
                    BirthDate = Convert.ToDateTime(dr["BirthDate"])
                };

                lstbal.Add(bal);
            }

            return lstbal;
        }
    }

    public string Delete( int persId)
    {
        using (SqlConnection sqlcon = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("spDeleteEmp", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PersonId", persId);

            sqlcon.Open();
            int count = cmd.ExecuteNonQuery();
            sqlcon.Close();

            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
    }

    public List<BAL> SelectAll()
    {
        using (SqlConnection sqlcon = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("spSelectAllEmp", sqlcon);
            cmd.CommandType = CommandType.StoredProcedure;

            sqlcon.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            List<BAL> lstbal = new List<BAL>();
            while (dr.Read())
            {
                BAL bal = new BAL
                {
                    EmpId = Convert.ToInt32(dr["EmployeeId"]),
                    PersonId = Convert.ToInt32(dr["PersonId"]),
                    EmpNum = dr["EmployeeNum"].ToString(),
                    EmployedDate = Convert.ToDateTime(dr["EmployedDate"]),
                    EmpTermDate = Convert.ToDateTime(dr["TerminatedDate"]),
                    FirstName = dr["FirstName"].ToString(),
                    LastName = dr["LastName"].ToString(),
                    BirthDate = Convert.ToDateTime(dr["BirthDate"])
                };

                lstbal.Add(bal);
            }

            return lstbal;
        }
    }
}