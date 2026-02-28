<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="WebApplication2.Backend.MovieDetails" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" ReadOnly="True" SortExpression="MOVIEID" />
                <asp:BoundField DataField="MOVIETITLE" HeaderText="MOVIETITLE" SortExpression="MOVIETITLE" />
                <asp:BoundField DataField="GENRE" HeaderText="GENRE" SortExpression="GENRE" />
                <asp:BoundField DataField="DURATION" HeaderText="DURATION" SortExpression="DURATION" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIEID&quot; = :MOVIEID" InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIEID&quot;, &quot;MOVIETITLE&quot;, &quot;GENRE&quot;, &quot;DURATION&quot;) VALUES (:MOVIEID, :MOVIETITLE, :GENRE, :DURATION)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MOVIE&quot;" UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIETITLE&quot; = :MOVIETITLE, &quot;GENRE&quot; = :GENRE, &quot;DURATION&quot; = :DURATION WHERE &quot;MOVIEID&quot; = :MOVIEID">
            <DeleteParameters>
                <asp:Parameter Name="MOVIEID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MOVIEID" Type="Decimal" />
                <asp:Parameter Name="MOVIETITLE" Type="String" />
                <asp:Parameter Name="GENRE" Type="String" />
                <asp:Parameter Name="DURATION" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MOVIETITLE" Type="String" />
                <asp:Parameter Name="GENRE" Type="String" />
                <asp:Parameter Name="DURATION" Type="Decimal" />
                <asp:Parameter Name="MOVIEID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                MOVIEID:
                <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' />
                <br />
                MOVIETITLE:
                <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                <br />
                GENRE:
                <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                <br />
                DURATION:
                <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                MOVIEID:
                <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                MOVIETITLE:
                <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                <br />
                GENRE:
                <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' />
                <br />
                DURATION:
                <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                MOVIEID:
                <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' />
                <br />
                MOVIETITLE:
                <asp:Label ID="MOVIETITLELabel" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                <br />
                GENRE:
                <asp:Label ID="GENRELabel" runat="server" Text='<%# Bind("GENRE") %>' />
                <br />
                DURATION:
                <asp:Label ID="DURATIONLabel" runat="server" Text='<%# Bind("DURATION") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <series>
                <asp:Series Name="Series1" XValueMember="MOVIEID" YValueMembers="DURATION">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
    </form>
</body>
</html>
