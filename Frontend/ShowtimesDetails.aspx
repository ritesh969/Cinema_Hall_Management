<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowtimesDetails.aspx.cs" Inherits="WebApplication2.Backend.ShowtimesDetails" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Showtime Management | Ultra Management</title>
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
            margin: 0; padding: 40px;
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
            border-radius: 60px; padding: 60px;
            box-shadow: 0 50px 120px rgba(0,0,0,0.08);
            max-width: 1400px; margin: auto;
            border: 2px solid rgba(255,255,255,0.9);
            animation: animate__zoomIn 0.8s;
        }

        /* 3. ULTRA STYLISH BUTTONS */
        .btn-universal {
            padding: 18px 45px; border-radius: 50px;
            text-decoration: none; font-weight: 800;
            display: inline-flex; align-items: center; gap: 15px;
            border: none; cursor: pointer; transition: all 0.5s;
        }

        .btn-back-elite { background: #1e293b; color: white !important; }
        .btn-back-elite:hover { background: #ef4444; transform: translateX(-15px) scale(1.1); }

        .btn-add-elite {
            background: linear-gradient(135deg, #f5576c 0%, #f093fb 100%);
            color: white !important; animation: glowAction 3s infinite;
        }
        
        /* THE MASSIVE HOVER YOU ASKED FOR */
        .btn-add-elite:hover {
            transform: translateY(-15px) scale(1.2) rotate(-3deg);
            filter: brightness(1.2) drop-shadow(0 25px 40px rgba(245, 87, 108, 0.6));
        }

        /* 4. GRIDVIEW HOVER SYSTEM */
        .ultra-grid { width: 100%; border-collapse: separate; border-spacing: 0 20px; margin: 40px 0; }
        .ultra-grid th { padding: 20px; color: #94a3b8; text-transform: uppercase; letter-spacing: 4px; font-size: 1.2rem; }
        .ultra-grid td { background: #ffffff; padding: 30px; border: none; font-size: 1.5rem; font-weight: 600; box-shadow: 0 10px 30px rgba(0,0,0,0.02); }
        .ultra-grid td:first-child { border-radius: 30px 0 0 30px; border-left: 10px solid #f5576c; }
        .ultra-grid td:last-child { border-radius: 0 30px 30px 0; text-align: right; }
        .ultra-grid tr:hover { transform: scale(1.04) translateY(-10px); z-index: 50; }
        .ultra-grid tr:hover td { background: #fff8f9; color: #f5576c; box-shadow: 0 40px 80px rgba(245, 87, 108, 0.15); }

        /* 5. ICON ANIMATIONS (CUSTOMIZED) */
        .icon-link { font-size: 1.7rem; margin: 0 15px; transition: 0.4s; display: inline-block; cursor: pointer; background: transparent; border: none; }
        .icon-edit { color: #3b82f6; }
        .icon-edit:hover { transform: rotate(360deg) scale(1.4); }
        .icon-del { color: #ef4444; }
        .icon-del:hover { transform: translateY(-5px) scale(1.4); filter: drop-shadow(0 0 15px #ef4444); }

        /* 6. FORM SECTION */
        .editor-wrapper { background: white; border-radius: 40px; padding: 50px; margin-top: 50px; border: 3px dashed #fecaca; }
        .editor-wrapper label {
            font-size: 1.3rem;
            font-weight: 800;
            color: #475569;
            margin-bottom: 10px;
            display: block;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .input-premium { width: 95%; padding: 25px; margin: 10px 0; border: 2px solid #f1f5f9; border-radius: 20px; background: #f8fafc; transition: 0.4s; font-size: 1.4rem; font-weight: 600; color: #1e293b; }
        .input-premium:focus { border-color: #f5576c; background: white; outline: none; transform: scale(1.02); box-shadow: 0 10px 30px rgba(245, 87, 108, 0.1); }
        .btn-save-master { background: #10b981; color: white !important; padding: 25px 80px; border-radius: 25px; font-weight: 900; font-size: 1.3rem; border: none; cursor: pointer; transition: 0.4s; }
        .btn-save-master:hover { background: #059669; transform: scale(1.1); }

        /* 7. CHART */
        .chart-container { margin-top: 80px; text-align: center; background: #ffffff; border-radius: 40px; padding: 40px; box-shadow: 0 20px 50px rgba(0,0,0,0.05); }
    </style>
</head>
<body>
    <form id="formUltraShowtimes" runat="server">
        <nav class="navbar animate__animated animate__fadeInDown">
            <div class="nav-brand">
                <i class="fas fa-ticket"></i>
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
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <a href="Dashboard.aspx" class="btn-universal btn-back-elite">
                    <i class="fas fa-chevron-left"></i> BACK TO PORTAL
                </a>
                <div style="text-align: center; animation: floatingEffect 5s ease-in-out infinite;">
                    <i class="fas fa-calendar-check" style="font-size: 5rem; color: #f5576c;"></i>
                    <h1 style="font-weight: 900; font-size: 3rem; margin: 10px 0; color: #1e293b;">SHOWTIME HUB</h1>
                </div>
                <asp:LinkButton ID="btnTriggerAdd" runat="server" OnLoad="btnTriggerAdd_Load" CssClass="btn-universal btn-add-elite">
                    <i class="fas fa-calendar-plus"></i> ADD NEW SHOW
                </asp:LinkButton>
            </div>

            <hr style="border: 0; height: 1px; background: #f1f5f9; margin: 50px 0;" />

            <asp:GridView ID="gvMainDisplay" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="SHOWID" DataSourceID="sqlCoreSource" 
                CssClass="ultra-grid" GridLines="None" OnRowCommand="gvMainDisplay_RowCommand">
                <Columns>
                    <asp:BoundField DataField="SHOWID" HeaderText="Show ID" ReadOnly="True" />
                    <asp:BoundField DataField="SHOWDATE" HeaderText="Screening Date" DataFormatString="{0:MMM dd, yyyy}" />
                    <asp:BoundField DataField="STARTTIME" HeaderText="Start Time" />
                    <asp:BoundField DataField="ENDTIME" HeaderText="End Time" />
                    <asp:TemplateField HeaderText="Operations">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditShow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="icon-link icon-edit">
                                <i class="fas fa-pen-to-square"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="icon-link icon-del" 
                                OnClientClick="return confirm('ERASE THIS SHOWTIME PERMANENTLY?');">
                                <i class="fas fa-calendar-xmark"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="editor-wrapper">
                <asp:FormView ID="fvShowInterface" runat="server" DataKeyNames="SHOWID" DataSourceID="sqlCoreSource" Width="100%">
                    <ItemTemplate>
                        <div style="text-align: center; color: #cbd5e1; padding: 40px; border: 2px dashed #f1f5f9; border-radius: 30px;">
                            <i class="fas fa-arrow-pointer fa-4x animate__animated animate__bounce animate__infinite"></i>
                            <p style="font-weight: 800; margin-top: 20px; font-size: 1.2rem; color: #94a3b8;">SELECT A SHOW TO EDIT OR CLICK ADD NEW</p>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="animate__animated animate__fadeIn">
                            <h2 style="color: #3b82f6; font-weight: 900; font-size: 2rem; margin-bottom: 30px;"><i class="fas fa-clock"></i> EDITING SHOW: <%# Eval("SHOWID") %></h2>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">
                                <div><label>Show ID (Locked)</label><asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' CssClass="input-premium" ReadOnly="true" BackColor="#f1f5f9" /></div>
                                <div><label>Show Date</label><asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' CssClass="input-premium" /></div>
                                <div><label>Start Time</label><asp:TextBox ID="STARTTIMETextBox" runat="server" Text='<%# Bind("STARTTIME") %>' CssClass="input-premium" /></div>
                                <div><label>End Time</label><asp:TextBox ID="ENDTIMETextBox" runat="server" Text='<%# Bind("ENDTIME") %>' CssClass="input-premium" /></div>
                            </div>
                            <div style="margin-top: 40px; display: flex; gap: 20px;">
                                <asp:LinkButton runat="server" CommandName="Update" CssClass="btn-save-master">SAVE CHANGES</asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Cancel" CssClass="btn-universal btn-back-elite" Text="DISCARD" />
                            </div>
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="animate__animated animate__slideInDown">
                            <h2 style="color: #f5576c; font-weight: 900; font-size: 2rem; margin-bottom: 30px;"><i class="fas fa-plus"></i> NEW SHOW REGISTRATION</h2>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">
                                <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' CssClass="input-premium" placeholder="Assign Show ID" />
                                <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE") %>' CssClass="input-premium" placeholder="Date (YYYY-MM-DD)" />
                                <asp:TextBox ID="STARTTIMETextBox" runat="server" Text='<%# Bind("STARTTIME") %>' CssClass="input-premium" placeholder="Start Time (HH:MM)" />
                                <asp:TextBox ID="ENDTIMETextBox" runat="server" Text='<%# Bind("ENDTIME") %>' CssClass="input-premium" placeholder="End Time (HH:MM)" />
                            </div>
                            <div style="margin-top: 40px; display: flex; gap: 20px;">
                                <asp:LinkButton runat="server" CommandName="Insert" CssClass="btn-save-master" style="background:#f5576c;">COMMIT SHOW</asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Cancel" CssClass="btn-universal btn-back-elite" Text="CANCEL" />
                            </div>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>

            <div class="chart-container">
                <h2 style="font-weight: 900; color: #1e293b; margin-bottom: 30px;">SHOW DISTRIBUTION</h2>
                <asp:Chart ID="ChartShows" runat="server" DataSourceID="sqlCoreSource" Width="1100px" Height="400px" Palette="BrightPastel">
                    <Series><asp:Series Name="Series1" XValueMember="SHOWID" YValueMembers="SHOWID" ChartType="SplineArea" Color="#fecaca" BorderWidth="4" BorderColor="#f5576c"></asp:Series></Series>
                    <ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas>
                </asp:Chart>
            </div>

            <asp:SqlDataSource ID="sqlCoreSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;SHOWTABLE&quot;"
                DeleteCommand="DELETE FROM &quot;SHOWTABLE&quot; WHERE &quot;SHOWID&quot; = :SHOWID"
                InsertCommand="INSERT INTO &quot;SHOWTABLE&quot; (&quot;SHOWID&quot;, &quot;SHOWDATE&quot;, &quot;STARTTIME&quot;, &quot;ENDTIME&quot;) VALUES (:SHOWID, :SHOWDATE, :STARTTIME, :ENDTIME)"
                UpdateCommand="UPDATE &quot;SHOWTABLE&quot; SET &quot;SHOWDATE&quot; = :SHOWDATE, &quot;STARTTIME&quot; = :STARTTIME, &quot;ENDTIME&quot; = :ENDTIME WHERE &quot;SHOWID&quot; = :SHOWID">
                <DeleteParameters><asp:Parameter Name="SHOWID" Type="Decimal" /></DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SHOWID" Type="Decimal" /><asp:Parameter Name="SHOWDATE" Type="DateTime" />
                    <asp:Parameter Name="STARTTIME" Type="DateTime" /><asp:Parameter Name="ENDTIME" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SHOWDATE" Type="DateTime" /><asp:Parameter Name="STARTTIME" Type="DateTime" />
                    <asp:Parameter Name="ENDTIME" Type="DateTime" /><asp:Parameter Name="SHOWID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>

     <script>
         document.addEventListener("DOMContentLoaded", function () {
             // Get the current page filename
             var path = window.location.pathname;
             var page = path.split("/").pop();

             // If page is empty (root), default to Dashboard
             if (page === "" || page === "default.aspx") page = "Dashboard.aspx";

             // Select all links inside the nav-links div
             var navLinks = document.querySelectorAll('#mainNav a');

             navLinks.forEach(function (link) {
                 // Get the href of the link (e.g., "Dashboard.aspx")
                 var linkHref = link.getAttribute('href');

                 // If the link matches the current page
                 if (linkHref === page) {
                     link.classList.add('active-link');
                     // Add a massive entrance animation just for the active link
                     link.classList.add('animate__animated', 'animate__pulse');
                 }
             });
         });
     </script>

    <script runat="server">
        protected void btnTriggerAdd_Load(object sender, EventArgs e) {
            LinkButton btn = (LinkButton)sender;
            btn.Click += (s, args) => { fvShowInterface.ChangeMode(FormViewMode.Insert); };
        }
        protected void gvMainDisplay_RowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "EditShow") {
                int index = Convert.ToInt32(e.CommandArgument);
                gvMainDisplay.SelectedIndex = index;
                fvShowInterface.PageIndex = index;
                fvShowInterface.ChangeMode(FormViewMode.Edit);
            }
        }
    </script>
</body>
</html>