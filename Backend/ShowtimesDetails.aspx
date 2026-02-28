<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowtimesDetails.aspx.cs" Inherits="WebApplication2.Backend.ShowtimesDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="SHOWID" HeaderText="SHOWID" ReadOnly="True" SortExpression="SHOWID" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SHOWTABLE&quot; WHERE &quot;SHOWID&quot; = :SHOWID" InsertCommand="INSERT INTO &quot;SHOWTABLE&quot; (&quot;SHOWID&quot;, &quot;SHOWDATE&quot;, &quot;STARTTIME&quot;, &quot;ENDTIME&quot;) VALUES (:SHOWID, :SHOWDATE, :STARTTIME, :ENDTIME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SHOWTABLE&quot;" UpdateCommand="UPDATE &quot;SHOWTABLE&quot; SET &quot;SHOWDATE&quot; = :SHOWDATE, &quot;STARTTIME&quot; = :STARTTIME, &quot;ENDTIME&quot; = :ENDTIME WHERE &quot;SHOWID&quot; = :SHOWID">
            <DeleteParameters>
                <asp:Parameter Name="SHOWID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SHOWID" Type="Decimal" />
                <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                <asp:Parameter Name="STARTTIME" Type="DateTime" />
                <asp:Parameter Name="ENDTIME" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                <asp:Parameter Name="STARTTIME" Type="DateTime" />
                <asp:Parameter Name="ENDTIME" Type="DateTime" />
                <asp:Parameter Name="SHOWID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                SHOWID:
                <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' />
                <br />
                SHOWDATE:
                <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                <br />
                STARTTIME:
                <asp:TextBox ID="STARTTIMETextBox" runat="server" Text='<%# Bind("STARTTIME") %>' />
                <br />
                ENDTIME:
                <asp:TextBox ID="ENDTIMETextBox" runat="server" Text='<%# Bind("ENDTIME") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                SHOWID:
                <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                <br />
                SHOWDATE:
                <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                <br />
                STARTTIME:
                <asp:TextBox ID="STARTTIMETextBox" runat="server" Text='<%# Bind("STARTTIME") %>' />
                <br />
                ENDTIME:
                <asp:TextBox ID="ENDTIMETextBox" runat="server" Text='<%# Bind("ENDTIME") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                SHOWID:
                <asp:Label ID="SHOWIDLabel" runat="server" Text='<%# Eval("SHOWID") %>' />
                <br />
                SHOWDATE:
                <asp:Label ID="SHOWDATELabel" runat="server" Text='<%# Bind("SHOWDATE") %>' />
                <br />
                STARTTIME:
                <asp:Label ID="STARTTIMELabel" runat="server" Text='<%# Bind("STARTTIME") %>' />
                <br />
                ENDTIME:
                <asp:Label ID="ENDTIMELabel" runat="server" Text='<%# Bind("ENDTIME") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series Name="Series1" XValueMember="SHOWID" YValueMembers="SHOWID">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </form>
</body>
</html>
