<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="WebApplication2.Backend.TicketDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID" InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;TICKETNUMBER&quot;, &quot;ISSUEDATE&quot;, &quot;TICKETSTATUS&quot;) VALUES (:TICKETID, :TICKETNUMBER, :ISSUEDATE, :TICKETSTATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TICKET&quot;" UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;TICKETNUMBER&quot; = :TICKETNUMBER, &quot;ISSUEDATE&quot; = :ISSUEDATE, &quot;TICKETSTATUS&quot; = :TICKETSTATUS WHERE &quot;TICKETID&quot; = :TICKETID">
            <DeleteParameters>
                <asp:Parameter Name="TICKETID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TICKETID" Type="Decimal" />
                <asp:Parameter Name="TICKETNUMBER" Type="String" />
                <asp:Parameter Name="ISSUEDATE" Type="DateTime" />
                <asp:Parameter Name="TICKETSTATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TICKETNUMBER" Type="String" />
                <asp:Parameter Name="ISSUEDATE" Type="DateTime" />
                <asp:Parameter Name="TICKETSTATUS" Type="String" />
                <asp:Parameter Name="TICKETID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                TICKETID:
                <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' />
                <br />
                TICKETNUMBER:
                <asp:TextBox ID="TICKETNUMBERTextBox" runat="server" Text='<%# Bind("TICKETNUMBER") %>' />
                <br />
                ISSUEDATE:
                <asp:TextBox ID="ISSUEDATETextBox" runat="server" Text='<%# Bind("ISSUEDATE") %>' />
                <br />
                TICKETSTATUS:
                <asp:TextBox ID="TICKETSTATUSTextBox" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                TICKETID:
                <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' />
                <br />
                TICKETNUMBER:
                <asp:TextBox ID="TICKETNUMBERTextBox" runat="server" Text='<%# Bind("TICKETNUMBER") %>' />
                <br />
                ISSUEDATE:
                <asp:TextBox ID="ISSUEDATETextBox" runat="server" Text='<%# Bind("ISSUEDATE") %>' />
                <br />
                TICKETSTATUS:
                <asp:TextBox ID="TICKETSTATUSTextBox" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                TICKETID:
                <asp:Label ID="TICKETIDLabel" runat="server" Text='<%# Eval("TICKETID") %>' />
                <br />
                TICKETNUMBER:
                <asp:Label ID="TICKETNUMBERLabel" runat="server" Text='<%# Bind("TICKETNUMBER") %>' />
                <br />
                ISSUEDATE:
                <asp:Label ID="ISSUEDATELabel" runat="server" Text='<%# Bind("ISSUEDATE") %>' />
                <br />
                TICKETSTATUS:
                <asp:Label ID="TICKETSTATUSLabel" runat="server" Text='<%# Bind("TICKETSTATUS") %>' />
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
                <asp:Series Name="Series1" XValueMember="TICKETID" YValueMembers="ISSUEDATE">
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
