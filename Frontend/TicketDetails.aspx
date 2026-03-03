<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="WebApplication2.Backend.TicketDetails" UnobtrusiveValidationMode="None" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Registry | Ultra Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    
    <style>
        /* 1. THE MASSIVE BACKGROUND COLOR-SHIFTING ENGINE */
        @keyframes dynamicBG {
            0% { background-color: #ffffff; }
            25% { background-color: #fff1f1; } 
            50% { background-color: #fff0f6; } 
            75% { background-color: #f8fafc; } 
            100% { background-color: #ffffff; }
        }

        @keyframes floatingEffect {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-15px) rotate(1deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }

        @keyframes glowAction {
            0% { box-shadow: 0 0 5px rgba(245, 87, 108, 0.4); }
            50% { box-shadow: 0 0 25px rgba(245, 87, 108, 0.8); }
            100% { box-shadow: 0 0 5px rgba(245, 87, 108, 0.4); }
        }

        body {
            margin: 0;
            padding: 0 0 60px 0; /* Adjusted for sticky navbar */
            font-family: 'Segoe UI', Roboto, sans-serif;
            animation: dynamicBG 15s ease-in-out infinite;
            min-height: 100vh;
        }

        /* --- THE ULTIMATE NAVBAR DESIGN --- */
        .navbar {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            padding: 10px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 3px solid #ff4d4d;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 15px 35px rgba(255, 77, 77, 0.1);
        }

        .nav-brand {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 2.2rem;
            font-weight: 900;
            color: #0f172a;
        }

        .nav-brand i {
            color: #ff4d4d;
            font-size: 2.8rem;
            animation: rotateAndPulse 4s infinite ease-in-out;
            filter: drop-shadow(0 0 10px rgba(255, 77, 77, 0.5));
        }

        @keyframes rotateAndPulse {
            0% { transform: scale(1) rotate(0deg); }
            50% { transform: scale(1.2) rotate(15deg); }
            100% { transform: scale(1) rotate(0deg); }
        }

        .nav-links {
            display: flex;
            gap: 10px;
            perspective: 1000px;
        }

        .nav-links a {
            position: relative;
            color: #475569;
            text-decoration: none;
            padding: 15px 22px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 800;
            text-transform: uppercase;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 2px solid transparent;
            overflow: hidden;
        }

        .nav-links a:hover {
            color: #fff;
            background: #ff4d4d;
            transform: translateY(-10px) rotateX(10deg) scale(1.1);
            box-shadow: 0 20px 40px rgba(255, 77, 77, 0.4);
            border-color: #ff944d;
        }

        /* ACTIVE STATE WITH RED LINE AND ARROW */
        .nav-links a.active-link {
            background: #0f172a;
            color: white !important;
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .nav-links a.active-link::after {
            content: '';
            position: absolute;
            bottom: 5px;
            left: 20%;
            width: 60%;
            height: 4px;
            background: #ff4d4d;
            border-radius: 10px;
            box-shadow: 0 0 10px #ff4d4d;
        }

        .nav-links a:hover::before {
            content: '➔';
            position: absolute;
            left: 5px;
            opacity: 0.5;
            animation: animate__backInLeft 0.3s;
        }

        /* 2. MAIN GLASS CONTAINER */
        .glass-container {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            border-radius: 60px;
            padding: 60px;
            box-shadow: 0 50px 120px rgba(0,0,0,0.08);
            max-width: 1400px;
            margin: 40px auto;
            border: 2px solid rgba(255,255,255,0.9);
            animation: animate__zoomIn 0.8s;
        }

        /* 3. ULTRA STYLISH BUTTONS */
        .btn-universal {
            padding: 18px 45px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 800;
            display: inline-flex;
            align-items: center;
            gap: 15px;
            border: none;
            cursor: pointer;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            font-size: 1rem;
        }

        .btn-back-elite {
            background: #1e293b;
            color: white !important;
        }
        .btn-back-elite:hover {
            background: #ef4444; 
            transform: translateX(-15px) scale(1.1);
            box-shadow: 0 15px 40px rgba(239, 68, 68, 0.4);
        }

        .btn-add-elite {
            background: linear-gradient(135deg, #f5576c 0%, #f093fb 100%);
            color: white !important;
            animation: glowAction 3s infinite;
        }
        .btn-add-elite:hover {
            transform: translateY(-8px) scale(1.05);
            filter: brightness(1.1);
        }

        /* 4. MASSIVE GRIDVIEW HOVER SYSTEM */
        .ultra-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 20px;
            margin: 40px 0;
        }
        .ultra-grid th {
            padding: 20px;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 4px;
            font-size: 0.8rem;
        }
        .ultra-grid tr { transition: all 0.5s ease; cursor: pointer; }
        .ultra-grid td {
            background: #ffffff;
            padding: 30px;
            border: none;
            font-size: 1.1rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
        }
        .ultra-grid td:first-child { border-radius: 30px 0 0 30px; border-left: 10px solid #f5576c; }
        .ultra-grid td:last-child { border-radius: 0 30px 30px 0; text-align: right; }

        .ultra-grid tr:hover {
            transform: scale(1.04) translateY(-10px) rotateX(2deg);
            z-index: 50;
        }
        .ultra-grid tr:hover td {
            background: #fff8f9;
            box-shadow: 0 40px 80px rgba(245, 87, 108, 0.15);
            color: #f5576c;
        }

        /* 5. ICON ANIMATIONS (NEW BETTER EDIT LOGO) */
        .icon-link {
            font-size: 1.7rem;
            margin: 0 15px;
            transition: 0.4s;
            display: inline-block;
            background: transparent;
            border: none;
            cursor: pointer;
        }
        .icon-edit { color: #3b82f6; }
        .icon-edit:hover { transform: rotate(360deg) scale(1.4); color: #2563eb; }
        .icon-del { color: #ef4444; }
        .icon-del:hover { transform: translateY(-5px) scale(1.4); filter: drop-shadow(0 0 15px #ef4444); }

        /* 6. FORM SECTION */
        .editor-wrapper {
            background: white;
            border-radius: 40px;
            padding: 50px;
            margin-top: 50px;
            border: 3px dashed #fecaca;
            animation: animate__fadeInUp 1s;
        }
        .input-premium {
            width: 95%;
            padding: 20px;
            margin: 10px 0;
            border: 2px solid #f1f5f9;
            border-radius: 20px;
            font-size: 1.1rem;
            background: #f8fafc;
            transition: 0.4s;
        }
        .input-premium:focus {
            border-color: #f5576c;
            background: white;
            box-shadow: 0 15px 35px rgba(245, 87, 108, 0.1);
            outline: none;
            transform: scale(1.01);
        }

        .btn-save-master {
            background: #10b981;
            color: white !important;
            padding: 20px 60px;
            border-radius: 20px;
            font-weight: 900;
            font-size: 1.2rem;
            border: none;
            cursor: pointer;
            transition: all 0.4s;
            box-shadow: 0 10px 20px rgba(16, 185, 129, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        .btn-save-master:hover {
            background: #059669;
            transform: scale(1.1) translateY(-5px);
            box-shadow: 0 20px 40px rgba(16, 185, 129, 0.5);
        }
    </style>
</head>
<body>
    <form id="formTicketSystem" runat="server">
        <nav class="navbar animate__animated animate__fadeInDown">
            <div class="nav-brand">
                <i class="fas fa-ticket-alt"></i>
                <span>SMART <span style="color:#ff4d4d">CINEMA</span></span>
            </div>
            <div class="nav-links" id="mainNav">
                <a href="Dashboard.aspx">Dashboard</a>
                <a href="MovieDetails.aspx">Movies</a>
                <a href="MovieTheaterOccupancy.aspx">Occupancy Report</a>
                <a href="ShowtimesDetails.aspx">Showtimes</a>
                <a href="TheaterCityHallDetails.aspx">Theater/Hall Details</a>
                <a href="TheaterCityHallMovie.aspx">Theater-Movie Report</a>
                <a href="TicketDetails.aspx">Tickets</a>
                <a href="UserDetails.aspx">User Details</a>
                <a href="UserTicket.aspx">User Ticket Report</a>
            </div>
        </nav>

        <div class="glass-container">
            <%-- EXCEPTION MESSAGE AREA --%>
            <asp:Panel ID="pnlException" runat="server"
                Visible="false"
                Style="background:#fee2e2; padding:20px; border-radius:15px; margin-bottom:20px;">

                <div style="display:flex; justify-content:space-between; align-items:center;">
                    <div>
                        <strong style="color:#b91c1c;">ERROR:</strong>
                        <asp:Label ID="lblExceptionMsg" runat="server" />
                    </div>

                    <asp:Button ID="btnCloseError"
                        runat="server"
                        Text="OK"
                        OnClick="btnCloseError_Click"
                        Style="background:#b91c1c; color:white; border:none; padding:8px 20px; border-radius:8px;" />
                </div>
            </asp:Panel>
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <a href="Dashboard.aspx" class="btn-universal btn-back-elite">
                    <i class="fas fa-chevron-left"></i> BACK TO PORTAL
                </a>
                <div style="text-align: center; animation: floatingEffect 5s ease-in-out infinite;">
                    <i class="fas fa-receipt" style="font-size: 5rem; color: #f5576c;"></i>
                    <h1 style="font-weight: 900; font-size: 3rem; margin: 10px 0; color: #1e293b; letter-spacing: -2px;">TICKET MANAGEMENT</h1>
                </div>
                <asp:LinkButton ID="btnOpenAdd" runat="server" OnLoad="btnOpenAdd_Load" CssClass="btn-universal btn-add-elite">
                    <i class="fas fa-plus-circle"></i> ADD NEW TICKET
                </asp:LinkButton>
            </div>

            <hr style="border: 0; height: 1px; background: #f1f5f9; margin: 50px 0;" />

            <asp:GridView ID="gvTickets" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="TICKETID" DataSourceID="sqlTicketData" 
                CssClass="ultra-grid" GridLines="None" OnRowCommand="gvTickets_RowCommand">
                <Columns>
                    <asp:BoundField DataField="TICKETID" HeaderText="Ref ID" ReadOnly="True" SortExpression="TICKETID" />
                    <asp:BoundField DataField="TICKETNUMBER" HeaderText="Serial Number" SortExpression="TICKETNUMBER" />
                    <asp:BoundField DataField="ISSUEDATE" HeaderText="Issue Date" SortExpression="ISSUEDATE" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:BoundField DataField="TICKETSTATUS" HeaderText="Status" SortExpression="TICKETSTATUS" />
                    <asp:TemplateField HeaderText="Operations">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditTicket" CommandArgument='<%# Container.DataItemIndex %>' CssClass="icon-link icon-edit">
                                <i class="fas fa-file-pen"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="icon-link icon-del" 
                                OnClientClick="return confirm('VOID TICKET: Proceed?');">
                                <i class="fas fa-trash-can"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="editor-wrapper">
                <asp:FormView ID="fvTicketControl" runat="server" DataKeyNames="TICKETID" DataSourceID="sqlTicketData" OnItemInserted="fvTicketControl_ItemInserted" OnItemUpdated="fvTicketControl_ItemUpdated" Width="100%">
                    <ItemTemplate>
                        <div style="text-align: center; color: #cbd5e1; padding: 40px; border: 2px dashed #f1f5f9; border-radius: 30px;">
                            <i class="fas fa-arrow-pointer fa-4x animate__animated animate__bounce animate__infinite"></i>
                            <p style="font-weight: 800; margin-top: 20px; font-size: 1.2rem; color: #94a3b8;">SYSTEM READY: SELECT A TICKET OR CLICK ADD NEW</p>
                        </div>
                    </ItemTemplate>
                    
                    <EditItemTemplate>
                        <div class="animate__animated animate__fadeIn">
                            <h2 style="color: #3b82f6; font-weight: 900; font-size: 2rem; margin-bottom: 30px;">
                                <i class="fas fa-pen-nib"></i> UPDATING TICKET ID: <%# Eval("TICKETID") %>
                            </h2>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">
                                <div>
                                    <label>Ticket Number</label>
                                    <asp:TextBox ID="TICKETNUMBERTextBox" runat="server"
                                        Text='<%# Bind("TICKETNUMBER") %>'
                                        CssClass="input-premium" />
                                    <asp:RequiredFieldValidator
                                        ControlToValidate="TICKETNUMBERTextBox"
                                        ErrorMessage="Ticket Number is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>

                                <div>
                                    <label>Issue Date</label>
                                    <asp:TextBox ID="ISSUEDATETextBox" runat="server"
                                        Text='<%# Bind("ISSUEDATE","{0:yyyy-MM-dd}") %>'
                                        TextMode="Date"
                                        CssClass="input-premium" />
                                    <asp:RequiredFieldValidator
                                        ControlToValidate="ISSUEDATETextBox"
                                        ErrorMessage="Issue Date is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>

                                <div>
                                    <label>Status</label>
                                    <asp:TextBox ID="TICKETSTATUSTextBox" runat="server"
                                        Text='<%# Bind("TICKETSTATUS") %>'
                                        CssClass="input-premium" />
                                    <asp:RequiredFieldValidator
                                        ControlToValidate="TICKETSTATUSTextBox"
                                        ErrorMessage="Status is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>
                            </div>
                            <div style="margin-top: 40px; display: flex; gap: 20px;">
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CausesValidation="true" CssClass="btn-save-master">
                                    <i class="fas fa-cloud-arrow-up"></i> SAVE TICKET
                                </asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Cancel" CssClass="btn-universal btn-back-elite" Text="DISCARD" />
                            </div>
                        </div>
                    </EditItemTemplate>

                    <InsertItemTemplate>
                        <div class="animate__animated animate__slideInDown">
                            <h2 style="color: #f5576c; font-weight: 900; font-size: 2rem; margin-bottom: 30px;">
                                <i class="fas fa-receipt"></i> GENERATE NEW TICKET
                            </h2>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

                                <div>
                                    <asp:TextBox ID="TICKETIDTextBox" runat="server"
                                        Text='<%# Bind("TICKETID") %>'
                                        placeholder="Assign ID"
                                        CssClass="input-premium" />
                                </div>

                                <div>
                                    <asp:TextBox ID="TICKETNUMBERTextBox" runat="server"
                                        Text='<%# Bind("TICKETNUMBER") %>'
                                        placeholder="Serial Number"
                                        CssClass="input-premium" />
                                    <asp:RequiredFieldValidator
                                        ControlToValidate="TICKETNUMBERTextBox"
                                        ErrorMessage="Ticket Number is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>

                                <div>
                                    <asp:TextBox ID="ISSUEDATETextBox" runat="server"
                                        Text='<%# Bind("ISSUEDATE","{0:yyyy-MM-dd}") %>'
                                        TextMode="Date"
                                        CssClass="input-premium" />
                                    <asp:RequiredFieldValidator
                                        ControlToValidate="ISSUEDATETextBox"
                                        ErrorMessage="Issue Date is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>

                                <div>
                                    <asp:TextBox ID="TICKETSTATUSTextBox" runat="server"
                                        Text='<%# Bind("TICKETSTATUS") %>'
                                        placeholder="Status (Active)"
                                        CssClass="input-premium" />
                                    <asp:RequiredFieldValidator
                                        ControlToValidate="TICKETSTATUSTextBox"
                                        ErrorMessage="Status is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        runat="server" />
                                </div>

                            </div>
                            <div style="margin-top: 40px; display: flex; gap: 20px;">
                                <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" CausesValidation="true" CssClass="btn-save-master" style="background:#f5576c;">
                                    <i class="fas fa-check-double"></i> CONFIRM TICKET
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" CssClass="btn-universal btn-back-elite" Text="CANCEL" />
                            </div>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>

            <div style="margin-top: 80px; text-align: center; background: white; border-radius: 40px; padding: 40px; box-shadow: 0 20px 50px rgba(0,0,0,0.05);">
                <h2 style="font-weight: 900; color: #1e293b; margin-bottom: 30px;">TICKET ISSUANCE CHART</h2>
                <asp:Chart ID="ChartTickets" runat="server" DataSourceID="sqlTicketData" Width="1100px" Height="400px" Palette="BrightPastel">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="TICKETNUMBER" YValueMembers="TICKETID" ChartType="SplineArea" Color="#fecaca" BorderWidth="4" BorderColor="#f5576c"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>

            <asp:SqlDataSource ID="sqlTicketData" runat="server"
                
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;TICKET&quot;"
                DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID"
                InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;TICKETNUMBER&quot;, &quot;ISSUEDATE&quot;, &quot;TICKETSTATUS&quot;) VALUES (:TICKETID, :TICKETNUMBER, :ISSUEDATE, :TICKETSTATUS)"
                UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;TICKETNUMBER&quot; = :TICKETNUMBER, &quot;ISSUEDATE&quot; = :ISSUEDATE, &quot;TICKETSTATUS&quot; = :TICKETSTATUS WHERE &quot;TICKETID&quot; = :TICKETID">
                <DeleteParameters><asp:Parameter Name="TICKETID" Type="Decimal" /></DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TICKETID" Type="Decimal" /><asp:Parameter Name="TICKETNUMBER" Type="String" />
                    <asp:Parameter Name="ISSUEDATE" Type="DateTime" /><asp:Parameter Name="TICKETSTATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TICKETNUMBER" Type="String" /><asp:Parameter Name="ISSUEDATE" Type="DateTime" />
                    <asp:Parameter Name="TICKETSTATUS" Type="String" /><asp:Parameter Name="TICKETID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var path = window.location.pathname;
            var page = path.split("/").pop();
            if (page === "" || page === "default.aspx") page = "Dashboard.aspx";
            var navLinks = document.querySelectorAll('#mainNav a');
            navLinks.forEach(function (link) {
                if (link.getAttribute('href') === page) {
                    link.classList.add('active-link');
                    link.classList.add('animate__animated', 'animate__pulse');
                }
            });
        });
    </script>

    <script runat="server">
        protected void btnOpenAdd_Load(object sender, EventArgs e) {
            LinkButton btn = (LinkButton)sender;
            btn.Click += (s, args) => { 
                fvTicketControl.ChangeMode(FormViewMode.Insert); 
            };
        }

        protected void gvTickets_RowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "EditTicket") {
                int index = Convert.ToInt32(e.CommandArgument);
                gvTickets.SelectedIndex = index;
                fvTicketControl.PageIndex = index;
                fvTicketControl.ChangeMode(FormViewMode.Edit);
            }
        }

        // --- EXCEPTION HANDLING LOGIC ---
        
        protected void fvTicketControl_ItemInserted(object sender, FormViewInsertedEventArgs e) {
            if (e.Exception != null) {
                pnlException.Visible = true;
                lblExceptionMsg.Text = "Could not save: " + e.Exception.Message;
                e.ExceptionHandled = true; // Stops the crash
                e.KeepInInsertMode = true; // Keeps data in textboxes so user doesn't lose work
            }
        }

        protected void fvTicketControl_ItemUpdated(object sender, FormViewUpdatedEventArgs e) {
            if (e.Exception != null) {
                pnlException.Visible = true;
                lblExceptionMsg.Text = "Update failed: " + e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }

        

        protected void btnCloseError_Click(object sender, EventArgs e)
            {
                pnlException.Visible = false;
            }
    </script>
</body>
</html>