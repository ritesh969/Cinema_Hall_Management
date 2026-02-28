<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieTheatherCityHallOccupancyPerformer.aspx.cs" Inherits="WebApplication2.Backend.MovieTheatherCityHallOccupancyPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MOVIETITLE" HeaderText="MOVIETITLE" SortExpression="MOVIETITLE" />
                <asp:BoundField DataField="THEATERNAME" HeaderText="THEATERNAME" SortExpression="THEATERNAME" />
                <asp:BoundField DataField="THEATERADDRESS" HeaderText="THEATERADDRESS" SortExpression="THEATERADDRESS" />
                <asp:BoundField DataField="HALLNAME" HeaderText="HALLNAME" SortExpression="HALLNAME" />
                <asp:BoundField DataField="CAPACITY" HeaderText="CAPACITY" SortExpression="CAPACITY" />
                <asp:BoundField DataField="PAIDSEATS" HeaderText="PAIDSEATS" SortExpression="PAIDSEATS" />
                <asp:BoundField DataField="OCCUPANCYPERCENTAGE" HeaderText="OCCUPANCYPERCENTAGE" SortExpression="OCCUPANCYPERCENTAGE" />
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
    M.MovieTitle,
    TH.TheaterName,
    TH.TheaterAddress,
    H.HallName,
    H.Capacity,
    COUNT(T.TicketID) AS PaidSeats,
    ROUND((COUNT(T.TicketID) * 100) / H.Capacity, 2) AS OccupancyPercentage
FROM Movie M,
     Booking B,
     Theater TH,
     Hall H,
     BookingSeat BS,
     Seat S,
     Ticket T,
     Payment P
WHERE M.MovieID = B.MovieID
AND TH.TheaterID = B.TheaterID
AND H.HallID = B.HallID
AND BS.BookingID = B.BookingID
AND S.SeatID = BS.SeatID
AND T.TicketID = S.TicketID
AND P.PaymentID = B.PaymentID
AND P.PaymentStatus = 'Paid'
GROUP BY
    M.MovieTitle,
    TH.TheaterName,
    TH.TheaterAddress,
    H.HallName,
    H.Capacity
ORDER BY OccupancyPercentage DESC"></asp:SqlDataSource>
    </form>
</body>
</html>
