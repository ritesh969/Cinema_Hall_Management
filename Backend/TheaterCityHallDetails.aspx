<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheaterCityHallDetails.aspx.cs" Inherits="WebApplication2.Backend.TheaterCityHallDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="THEATERID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="THEATERID" HeaderText="THEATERID" ReadOnly="True" SortExpression="THEATERID" />
                <asp:BoundField DataField="THEATERNAME" HeaderText="THEATERNAME" SortExpression="THEATERNAME" />
                <asp:BoundField DataField="THEATERADDRESS" HeaderText="THEATERADDRESS" SortExpression="THEATERADDRESS" />
                <asp:BoundField DataField="CONTACTNUMBER" HeaderText="CONTACTNUMBER" SortExpression="CONTACTNUMBER" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;THEATER&quot; WHERE &quot;THEATERID&quot; = :THEATERID" InsertCommand="INSERT INTO &quot;THEATER&quot; (&quot;THEATERID&quot;, &quot;THEATERNAME&quot;, &quot;THEATERADDRESS&quot;, &quot;CONTACTNUMBER&quot;) VALUES (:THEATERID, :THEATERNAME, :THEATERADDRESS, :CONTACTNUMBER)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;THEATER&quot;" UpdateCommand="UPDATE &quot;THEATER&quot; SET &quot;THEATERNAME&quot; = :THEATERNAME, &quot;THEATERADDRESS&quot; = :THEATERADDRESS, &quot;CONTACTNUMBER&quot; = :CONTACTNUMBER WHERE &quot;THEATERID&quot; = :THEATERID">
            <DeleteParameters>
                <asp:Parameter Name="THEATERID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="THEATERID" Type="Decimal" />
                <asp:Parameter Name="THEATERNAME" Type="String" />
                <asp:Parameter Name="THEATERADDRESS" Type="String" />
                <asp:Parameter Name="CONTACTNUMBER" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="THEATERNAME" Type="String" />
                <asp:Parameter Name="THEATERADDRESS" Type="String" />
                <asp:Parameter Name="CONTACTNUMBER" Type="String" />
                <asp:Parameter Name="THEATERID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="THEATERID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                THEATERID:
                <asp:Label ID="THEATERIDLabel1" runat="server" Text='<%# Eval("THEATERID") %>' />
                <br />
                THEATERNAME:
                <asp:TextBox ID="THEATERNAMETextBox" runat="server" Text='<%# Bind("THEATERNAME") %>' />
                <br />
                THEATERADDRESS:
                <asp:TextBox ID="THEATERADDRESSTextBox" runat="server" Text='<%# Bind("THEATERADDRESS") %>' />
                <br />
                CONTACTNUMBER:
                <asp:TextBox ID="CONTACTNUMBERTextBox" runat="server" Text='<%# Bind("CONTACTNUMBER") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                THEATERID:
                <asp:TextBox ID="THEATERIDTextBox" runat="server" Text='<%# Bind("THEATERID") %>' />
                <br />
                THEATERNAME:
                <asp:TextBox ID="THEATERNAMETextBox" runat="server" Text='<%# Bind("THEATERNAME") %>' />
                <br />
                THEATERADDRESS:
                <asp:TextBox ID="THEATERADDRESSTextBox" runat="server" Text='<%# Bind("THEATERADDRESS") %>' />
                <br />
                CONTACTNUMBER:
                <asp:TextBox ID="CONTACTNUMBERTextBox" runat="server" Text='<%# Bind("CONTACTNUMBER") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                THEATERID:
                <asp:Label ID="THEATERIDLabel" runat="server" Text='<%# Eval("THEATERID") %>' />
                <br />
                THEATERNAME:
                <asp:Label ID="THEATERNAMELabel" runat="server" Text='<%# Bind("THEATERNAME") %>' />
                <br />
                THEATERADDRESS:
                <asp:Label ID="THEATERADDRESSLabel" runat="server" Text='<%# Bind("THEATERADDRESS") %>' />
                <br />
                CONTACTNUMBER:
                <asp:Label ID="CONTACTNUMBERLabel" runat="server" Text='<%# Bind("CONTACTNUMBER") %>' />
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
                <asp:Series Name="Series1" XValueMember="THEATERID" YValueMembers="THEATERID">
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
