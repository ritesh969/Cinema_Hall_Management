<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTicket.aspx.cs" Inherits="WebApplication2.Frontend.UserTicket" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>User Ticket Report</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

<style>

body{
    margin:0;
    font-family:'Segoe UI';
    background:linear-gradient(120deg,#ffffff,#f2f9ff,#ffffff,#eaf6ff);
    background-size:400% 400%;
    animation:gradientMove 18s ease infinite;
    color:#222;
}

@keyframes gradientMove{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
}

.navbar{
    height:70px;
    background:white;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 40px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.navbar a{
    text-decoration:none;
    margin-left:25px;
    font-weight:600;
    color:#333;
    transition:0.3s;
}

.navbar a:hover{
    color:#007bff;
    transform:scale(1.1);
}

.container{
    max-width:1400px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:20px;
    box-shadow:0 15px 40px rgba(0,0,0,0.1);
}

h2{
    text-align:center;
    margin-bottom:30px;
}

.btn-back{
    background:#6c757d;
    color:white;
    padding:8px 15px;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
    transition:0.3s;
}

.btn-back:hover{
    transform:scale(1.1);
    box-shadow:0 5px 20px rgba(0,0,0,0.2);
}

.gridview{
    width:100%;
    border-collapse:collapse;
}

.gridview th{
    background:#007bff;
    color:white;
    padding:12px;
}

.gridview td{
    padding:12px;
    border-bottom:1px solid #eee;
}

.gridview tr:hover{
    background:#f0f8ff;
    transform:scale(1.01);
    transition:0.3s;
}

.top-area{
    display:flex;
    justify-content:space-between;
    margin-bottom:20px;
}

</style>
</head>

<body>
<form runat="server">

<div class="navbar">
    <h3>User Ticket Report</h3>
    <div>
        <a href="Dashboard.aspx"><i class="fas fa-home"></i> Dashboard</a>
        <a href="UserDetails.aspx">Users</a>
    </div>
</div>

<div class="container">

<div class="top-area">
<h2>Tickets Bought In Last 6 Months</h2>

<a href="Dashboard.aspx" class="btn-back">
<i class="fas fa-arrow-left"></i> Back
</a>
</div>

<asp:GridView ID="GridView1"
    runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="USERID,BOOKINGID,TICKETID"
    DataSourceID="SqlDataSource1"
    CssClass="gridview">

    <Columns>
        <asp:BoundField DataField="USERID" HeaderText="User ID"/>
        <asp:BoundField DataField="USERNAME" HeaderText="User Name"/>
        <asp:BoundField DataField="EMAIL" HeaderText="Email"/>
        <asp:BoundField DataField="BOOKINGID" HeaderText="Booking ID"/>
        <asp:BoundField DataField="BOOKINGDATE" HeaderText="Booking Date"/>
        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie"/>
        <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID"/>
        <asp:BoundField DataField="TICKETNUMBER" HeaderText="Ticket Number"/>
        <asp:BoundField DataField="ISSUEDATE" HeaderText="Issue Date"/>
        <asp:BoundField DataField="TICKETSTATUS" HeaderText="Status"/>
    </Columns>

</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1"
runat="server"
ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
SelectCommand="
SELECT 
U.UserID,
U.UserName,
U.Email,
B.BookingID,
B.BookingDate,
M.MovieTitle,
T.TicketID,
T.TicketNumber,
T.IssueDate,
T.TicketStatus
FROM UserTable U
JOIN UserBooking UB ON U.UserID = UB.UserID
JOIN Booking B ON UB.BookingID = B.BookingID
JOIN Movie M ON B.MovieID = M.MovieID
JOIN BookingSeat BS ON B.BookingID = BS.BookingID
JOIN Seat S ON BS.SeatID = S.SeatID
JOIN Ticket T ON S.TicketID = T.TicketID
WHERE B.BookingDate >= ADD_MONTHS(SYSDATE, -6)
ORDER BY U.UserID">
</asp:SqlDataSource>

</div>
</form>
</body>
</html>