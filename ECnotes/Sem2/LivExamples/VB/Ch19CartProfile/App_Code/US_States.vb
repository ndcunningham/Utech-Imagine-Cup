Imports Microsoft.VisualBasic

Public Class US_States
    Inherits Collections.Generic.List(Of US_States.State)

    Public Sub New()
        Dim codes() As String = {"AL", "AK", "AZ", "AR", "CA", _
            "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", _
            "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", _
            "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", _
            "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", _
            "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", _
            "VT", "VA", "WA", "WV", "WI", "WY"}
        Dim names() As String = {"Alabama", "Alaska", "Arizona ", _
            "Arkansas", "California ", "Colorado ", "Connecticut", _
            "Delaware", "District of Columbia", "Florida", "Georgia", _
            "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", _
            "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", _
            "Massachusetts", "Michigan", "Minnesota", "Mississippi", _
            "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", _
            "New Jersey", "New Mexico", "New York", "North Carolina", _
            "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", _
            "Rhode Island", "South Carolina", "South Dakota", "Tennessee", _
            "Texas", "Utah", "Vermont", "Virginia ", "Washington", _
            "West Virginia", "Wisconsin", "Wyoming"}
        Dim i As Integer
        For i = 0 To names.Length - 1
            Dim s As State = New State(names(i), codes(i))
            Me.Add(s)
        Next
    End Sub

    Public Class State
        Dim _Name As String
        Dim _Abbreviation As String

        Public ReadOnly Property Name() As String
            Get
                Return Me._Name
            End Get
        End Property

        Public ReadOnly Property Abbreviation() As String
            Get
                Return Me._Abbreviation
            End Get
        End Property

        Public Sub New(ByVal Name As String, ByVal Abbreviation As String)
            Me._Name = Name
            Me._Abbreviation = Abbreviation
        End Sub

    End Class
End Class