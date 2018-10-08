using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PERSON
/// </summary>
public class PERSON
{ //Person
    private int _perId;
    private string _firstName;
    private string _lastName;
    private DateTime _birthDate;

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

    public PERSON()
    {
        //
        // TODO: Add constructor logic here
        //
        this.BirthDate = _birthDate;
        this.LastName = _lastName;
        this.FirstName = _firstName;
        this.BirthDate = _birthDate;
    }
}