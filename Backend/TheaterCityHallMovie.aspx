<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheaterCityHallMovie.aspx.cs" Inherits="WebApplication2.Backend.TheaterCityHallMovie" %>

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
                <asp:BoundField DataField="THEATERNAME" HeaderText="THEATERNAME" SortExpression="THEATERNAME" />
                <asp:BoundField DataField="THEATERADDRESS" HeaderText="THEATERADDRESS" SortExpression="THEATERADDRESS" />
                <asp:BoundField DataField="HALLNAME" HeaderText="HALLNAME" SortExpression="HALLNAME" />
                <asp:BoundField DataField="CAPACITY" HeaderText="CAPACITY" SortExpression="CAPACITY" />
                <asp:BoundField DataField="MOVIETITLE" HeaderText="MOVIETITLE" SortExpression="MOVIETITLE" />
                <asp:BoundField DataField="SHOWDATE" HeaderText="SHOWDATE" SortExpression="SHOWDATE" />
                <asp:BoundField DataField="STARTTIME" HeaderText="STARTTIME" SortExpression="STARTTIME" />
                <asp:BoundField DataField="ENDTIME" HeaderText="ENDTIME" SortExpression="ENDTIME" />
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
    TH.TheaterName,
    TH.TheaterAddress,
    H.HallName,
    H.Capacity,
    M.MovieTitle,
    S.ShowDate,
    S.StartTime,
    S.EndTime
FROM Theater TH
JOIN Booking B ON TH.TheaterID = B.TheaterID
JOIN Hall H ON B.HallID = H.HallID
JOIN Movie M ON B.MovieID = M.MovieID
JOIN ShowTable S ON B.ShowID = S.ShowID
ORDER BY TH.TheaterName"></asp:SqlDataSource>
    </form>
</body>
</html>
