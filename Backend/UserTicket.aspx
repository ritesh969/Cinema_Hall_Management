<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTicket.aspx.cs" Inherits="WebApplication2.Backend.UserTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="USERID,BOOKINGID,TICKETID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="BOOKINGID" HeaderText="BOOKINGID" ReadOnly="True" SortExpression="BOOKINGID" />
                <asp:BoundField DataField="BOOKINGDATE" HeaderText="BOOKINGDATE" SortExpression="BOOKINGDATE" />
                <asp:BoundField DataField="MOVIETITLE" HeaderText="MOVIETITLE" SortExpression="MOVIETITLE" />
                <asp:BoundField DataField="TICKETID" HeaderText="TICKETID" ReadOnly="True" SortExpression="TICKETID" />
                <asp:BoundField DataField="TICKETNUMBER" HeaderText="TICKETNUMBER" SortExpression="TICKETNUMBER" />
                <asp:BoundField DataField="ISSUEDATE" HeaderText="ISSUEDATE" SortExpression="ISSUEDATE" />
                <asp:BoundField DataField="TICKETSTATUS" HeaderText="TICKETSTATUS" SortExpression="TICKETSTATUS" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
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
WHERE B.BookingDate &gt;= ADD_MONTHS(SYSDATE, -6)
ORDER BY U.UserID"></asp:SqlDataSource>
    </form>
</body>
</html>
