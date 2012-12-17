using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;


public class QuoteNumber
{
    private string id;
    public string Id
    {
        get 
        {
            return this.id;
        } 
        set 
        {
            this.id = value;
            UpdateProperties(this.id);
        }
        
    }
    public string Number { get; private set; }
    public string Revision { get; private set; }
    public QuoteNumber(string id)
    {
        this.Id = id;
    }

    public void UpdateProperties(string idString)
    {
        
        this.Number = idString;
        this.Revision = "";
        
        // if file name is given parse off the extension
        int dotPos = idString.LastIndexOf('.');
        if ( dotPos > 0)
        {
            idString = idString.Substring(0, dotPos);
        }


        Match match = new Regex(@"^[0-9][0-9]*", RegexOptions.IgnoreCase).Match(idString);
        if (match != null)
        {
            Number = match.Value;
        }

        match = new Regex(@"^[0-9][0-9]*([a-zA-Z][a-zA-Z0-9-]*)", RegexOptions.IgnoreCase).Match(idString);
        if (match != null && match.Groups.Count>1)
        {
            Revision = match.Groups[1].Value;
        }

    }
}

public class QuoteNumber1
{
    private string id;
    public string Id
    {
        get
        {
            return this.id;
        }
        set
        {
            this.id = value;
            UpdateProperties(this.id);
        }

    }
    public string Number { get; private set; }
    public string Revision { get; private set; }
    public string QuoteFileName { get; private set; }
    public QuoteNumber1(string id)
    {
        this.Id = id;
    }

    public void UpdateProperties(string idString)
    {

        this.Number = idString;
        this.Revision = "";

        // if file name is given it will have extension
        string extension = ".xls";
        int dotPos = idString.LastIndexOf('.');
        if (dotPos > 0)
        {
            extension = idString.Substring(dotPos);
            idString = idString.Substring(0, dotPos);
        }


        Match match = new Regex(@"^[0-9][0-9]*", RegexOptions.IgnoreCase).Match(idString);
        if (match != null)
        {
            Number = match.Value;
        }

        match = new Regex(@"^[0-9][0-9]*([a-zA-Z][a-zA-Z0-9-]*)", RegexOptions.IgnoreCase).Match(idString);
        if (match != null && match.Groups.Count > 1)
        {
            Revision = match.Groups[1].Value;
        }

        //filename
        QuoteFileName = this.Number + this.Revision + extension;

    }
}