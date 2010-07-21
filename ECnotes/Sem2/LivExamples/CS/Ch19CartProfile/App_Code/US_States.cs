using System;
using System.Collections.Generic;

/// <summary>
/// Summary description for US_States
/// </summary>
public class US_States : List<US_States.State>
{
	public US_States()
	{
        string[] codes = {"AL", "AK", "AZ", "AR", "CA",
            "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", 
            "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", 
            "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", 
            "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", 
            "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", 
            "VT", "VA", "WA", "WV", "WI", "WY" };
        string[] names = {"Alabama", "Alaska", "Arizona ", 
            "Arkansas", "California ", "Colorado ", "Connecticut", 
            "Delaware", "District of Columbia", "Florida", "Georgia", 
            "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", 
            "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", 
            "Massachusetts", "Michigan", "Minnesota", "Mississippi", 
            "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
            "New Jersey", "New Mexico", "New York", "North Carolina", 
            "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", 
            "Rhode Island", "South Carolina", "South Dakota", "Tennessee", 
            "Texas", "Utah", "Vermont", "Virginia ", "Washington", 
            "West Virginia", "Wisconsin", "Wyoming" };

        for (int i = 0; i < names.Length; i++)
            this.Add(new State(names[i], codes[i]));
    }

    public class State
    {
        private string _Name;
        private string _Abbreviation;

        public string Name
        {
            get
            {
                return this._Name;
            }
        }

        public string Abbreviation
        {
            get
            {
                return this._Abbreviation;
            }
        }

        public State(string Name, string Abbreviation)
        {
            this._Name = Name;
            this._Abbreviation = Abbreviation;
        }
    }
}
