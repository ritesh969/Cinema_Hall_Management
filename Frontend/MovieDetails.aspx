<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="WebApplication2.Frontend.MovieDetails" UnobtrusiveValidationMode="None" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Elite Movie Lab | Alpha Cinema System</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

    <style>
        /* 1. THE ICONIC LIGHT-SHIFT BACKGROUND (AS REQUESTED) */
        @keyframes ultraGradient {
            0% { background-color: #fff5f5; }   /* Soft Red */
            33% { background-color: #fffaf0; }  /* Soft Orange */
            66% { background-color: #fdf2f8; }  /* Soft Pink */
            100% { background-color: #fff5f5; }
        }

        body {
            margin: 0; padding: 0;
            font-family: 'Poppins', sans-serif;
            animation: ultraGradient 12s ease-in-out infinite;
            height: 100vh;
            overflow: hidden; /* Panel scrolling logic */
            color: #1e293b;
        }

        /* 2. MASSIVE NEON NAVBAR */
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
            transition: 0.5s ease;
        }

        /* MASSIVE LOGO ANIMATION */
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
            perspective: 1000px; /* For 3D Hover */
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

        /* --- MASSIVE HOVER EFFECTS --- */
        .nav-links a:hover {
            color: #fff;
            background: #ff4d4d;
            transform: translateY(-10px) rotateX(10deg) scale(1.1);
            box-shadow: 0 20px 40px rgba(255, 77, 77, 0.4);
            border-color: #ff944d;
        }

        /* THE UNIQUE MARKER: ACTIVE STATE */
        /* This styling applies when the page matches the link */
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

        /* TEXT BOUNCE ON HOVER */
        .nav-links a:hover::before {
            content: '➔';
            position: absolute;
            left: 5px;
            opacity: 0.5;
            animation: animate__backInLeft 0.3s;
        }

        /* 3. THE 3D BACK BUTTON */
        .btn-back {
            position: absolute; top: 110px; left: 50px;
            display: flex; align-items: center; gap: 12px;
            padding: 15px 30px; background: #1e293b; color: white;
            border-radius: 50px; text-decoration: none; font-weight: 900;
            transition: 0.5s; box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            z-index: 10;
        }

        .btn-back:hover {
            background: #ff4d4d; transform: translateX(-15px) rotate(-3deg);
            box-shadow: 0 20px 40px rgba(255, 77, 77, 0.4);
        }

        /* 4. DUAL-PANEL LAYOUT (FIXED VS SCROLL) */
        .master-container {
            display: flex; height: calc(100vh - 90px);
            padding: 80px 50px 30px 50px; gap: 40px; box-sizing: border-box;
        }

        /* LEFT: THE CONTROL HUB */
        .left-hub {
            flex: 0 0 480px;
            background: white; border-radius: 50px; padding: 45px;
            box-shadow: 0 40px 80px rgba(0,0,0,0.08);
            animation: animate__backInLeft 1s;
            height: fit-content; border: 1px solid #ffeded;
        }

        .left-hub:hover { transform: translateY(-5px); box-shadow: 0 50px 100px rgba(255, 77, 77, 0.15); }

        /* RIGHT: THE INDEPENDENT SCROLL LIST */
        .right-scroll {
            flex: 1; overflow-y: auto; padding-right: 20px;
            animation: animate__backInRight 1s;
        }

        /* 5. MASSIVE UI INPUTS */
        .section-title { font-size: 2rem; font-weight: 900; color: #0f172a; margin-bottom: 30px; display: flex; align-items: center; gap: 15px; }

        .label-text { font-weight: 800; color: #94a3b8; text-transform: uppercase; font-size: 0.8rem; margin: 15px 0 5px 10px; display: block; }

        .input-massive {
            width: 100%; padding: 20px; border-radius: 20px; border: 3px solid #f1f5f9;
            background: #f8fafc; font-weight: 700; font-size: 1.1rem; transition: 0.4s; box-sizing: border-box;
        }

        .input-massive:focus {
            border-color: #ff4d4d; background: white; transform: scale(1.03);
            box-shadow: 0 15px 35px rgba(255, 77, 77, 0.15); outline: none;
        }

        .btn-action-massive {
            width: 100%; padding: 22px; border-radius: 25px; border: none;
            font-weight: 900; font-size: 1.2rem; cursor: pointer; transition: 0.5s;
            background: linear-gradient(135deg, #ff4d4d, #f472b6); color: white;
            margin-top: 20px; text-transform: uppercase; letter-spacing: 2px;
            display: block; text-align: center; text-decoration: none;
        }

        .btn-action-massive:hover {
            transform: translateY(-7px) scale(1.02);
            box-shadow: 0 25px 50px rgba(255, 77, 77, 0.4);
            letter-spacing: 5px;
        }

        /* 6. THE GRIDVIEW MASTERCLASS */
        .table-card { background: white; border-radius: 50px; padding: 50px; box-shadow: 0 30px 70px rgba(0,0,0,0.05); }

        .gridview-elite { width: 100%; border-collapse: separate; border-spacing: 0 20px; }
        .gridview-elite th { background: #0f172a; color: white; padding: 30px; border-radius: 20px; text-transform: uppercase; letter-spacing: 3px; font-weight: 900; }
        
        .gridview-elite tr { transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1); cursor: pointer; background: white; }
        .gridview-elite td { padding: 30px; font-weight: 800; font-size: 1.2rem; border: none; }

        .gridview-elite tr:hover {
            transform: scale(1.04) translateY(-15px) rotateX(2deg);
            box-shadow: 0 40px 80px rgba(255, 77, 77, 0.2);
            z-index: 100; position: relative;
        }
        .gridview-elite tr:hover td { color: #ff4d4d; }

        /* THE NEW BETTER LOGOS */
        .icon-circle {
            width: 60px; height: 60px; border-radius: 50%; display: inline-flex;
            align-items: center; justify-content: center; font-size: 1.6rem; transition: 0.5s; text-decoration: none;
        }
        .icon-edit-gold { color: #d97706; background: #fef3c7; }
        .icon-edit-gold:hover { transform: scale(1.3) rotate(360deg); background: #d97706; color: white; box-shadow: 0 10px 25px rgba(217, 119, 6, 0.4); }
        
        .icon-delete-ruby { color: #dc2626; background: #fee2e2; margin-left: 15px; }
        .icon-delete-ruby:hover { transform: scale(1.3) translateY(-10px); background: #dc2626; color: white; box-shadow: 0 10px 25px rgba(220, 38, 38, 0.4); }

        /* Scrollbar Magic */
        ::-webkit-scrollbar { width: 12px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: linear-gradient(#ff4d4d, #f472b6); border-radius: 10px; }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
       <nav class="navbar animate__animated animate__fadeInDown">
            <div class="nav-brand"><i class="fas fa-ticket"></i><span>SMART <span style="color:#ff4d4d">CINEMA</span></span></div>
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

        <asp:Panel ID="pnlMovieException" runat="server" Visible="false"
            Style="background:#fee2e2; padding:20px; border-radius:15px; margin-bottom:20px;">
            <div style="display:flex; justify-content:space-between; align-items:center;">
                <div>
                    <strong style="color:#b91c1c;">ERROR:</strong>
                    <asp:Label ID="lblMovieExceptionMsg" runat="server" />
                </div>
                <asp:Button ID="btnCloseMovieError" runat="server" Text="OK"
                    OnClick="btnCloseMovieError_Click"
                    Style="background:#b91c1c; color:white; border:none; padding:8px 20px; border-radius:8px;" />
            </div>
        </asp:Panel>

        <a href="Dashboard.aspx" class="btn-back animate__animated animate__fadeInLeft"><i class="fas fa-circle-chevron-left"></i> EXIT TO DASHBOARD</a>

        <div class="master-container">
            <!-- LEFT HUB: FORMVIEW -->
            <div class="left-hub">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" RenderOuterTable="false"
                    OnItemInserted="FormView1_ItemInserted"
                    OnItemUpdated="FormView1_ItemUpdated"
                    OnItemDeleted="FormView1_ItemDeleted">
                    
                    <ItemTemplate>
                        <div class="section-title"><i class="fas fa-film" style="color:#ff4d4d;"></i> Movie Profile</div>
                        <div style="text-align:center;">
                            <h2 style="font-size:2.8rem; margin:10px 0; color:#0f172a; text-transform:uppercase;"><%# Eval("MOVIETITLE") %></h2>
                            <div style="background:#f8fafc; border:4px dashed #f1f5f9; padding:25px; border-radius:30px; margin:25px 0;">
                                <p style="font-size:1.2rem;"><strong>GENRE:</strong> <%# Eval("GENRE") %></p>
                                <p style="font-size:1.2rem;"><strong>DURATION:</strong> <%# Eval("DURATION") %> MINUTES</p>
                            </div>
                            <asp:LinkButton ID="EditBtn" runat="server" CommandName="Edit" CssClass="btn-action-massive"><i class="fas fa-pen-nib"></i> EDIT MOVIE</asp:LinkButton>
                            <asp:LinkButton ID="NewBtn" runat="server" CommandName="New" CssClass="btn-action-massive" style="background:#0f172a; margin-top:15px;"><i class="fas fa-plus"></i> ADD NEW</asp:LinkButton>
                        </div>
                    </ItemTemplate>

                    <EditItemTemplate>
                        <div class="section-title"><i class="fas fa-pen-nib" style="color:#d97706;"></i> Update Entry</div>
    
                        <span class="label-text">Movie Title</span>
                        <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' CssClass="input-massive" />
                        <asp:RequiredFieldValidator ID="rfvMovieTitle" runat="server" ControlToValidate="MOVIETITLETextBox"
                            ErrorMessage="Movie Title is required" ForeColor="Red" Display="Dynamic" />

                        <span class="label-text">Genre</span>
                        <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' CssClass="input-massive" />
                        <asp:RequiredFieldValidator ID="rfvGenre" runat="server" ControlToValidate="GENRETextBox"
                            ErrorMessage="Genre is required" ForeColor="Red" Display="Dynamic" />

                        <span class="label-text">Duration (Mins)</span>
                        <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' CssClass="input-massive" />
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="DURATIONTextBox"
                            ErrorMessage="Duration is required" ForeColor="Red" Display="Dynamic" />

                        <asp:LinkButton ID="UpdateBtn" runat="server" CommandName="Update" CssClass="btn-action-massive">SAVE CHANGES</asp:LinkButton>
                        <asp:LinkButton ID="CancelBtn" runat="server" CommandName="Cancel" CssClass="btn-action-massive" style="background:#94a3b8; margin-top:10px;">CANCEL</asp:LinkButton>
                    </EditItemTemplate>

                    <InsertItemTemplate>
                        <div class="section-title"><i class="fas fa-folder-plus" style="color:#10b981;"></i> New Movie</div>
    
                        <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' CssClass="input-massive" placeholder="Movie ID" />
                        <asp:RequiredFieldValidator ID="rfvMovieID" runat="server" ControlToValidate="MOVIEIDTextBox"
                            ErrorMessage="Movie ID is required" ForeColor="Red" Display="Dynamic" />

                        <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' CssClass="input-massive" placeholder="Title" />
                        <asp:RequiredFieldValidator ID="rfvMovieTitleInsert" runat="server" ControlToValidate="MOVIETITLETextBox"
                            ErrorMessage="Movie Title is required" ForeColor="Red" Display="Dynamic" />

                        <asp:TextBox ID="GENRETextBox" runat="server" Text='<%# Bind("GENRE") %>' CssClass="input-massive" placeholder="Genre" />
                        <asp:RequiredFieldValidator ID="rfvGenreInsert" runat="server" ControlToValidate="GENRETextBox"
                            ErrorMessage="Genre is required" ForeColor="Red" Display="Dynamic" />

                        <asp:TextBox ID="DURATIONTextBox" runat="server" Text='<%# Bind("DURATION") %>' CssClass="input-massive" placeholder="Duration" />
                        <asp:RequiredFieldValidator ID="rfvDurationInsert" runat="server" ControlToValidate="DURATIONTextBox"
                            ErrorMessage="Duration is required" ForeColor="Red" Display="Dynamic" />

                        <asp:LinkButton ID="InsertBtn" runat="server" CommandName="Insert" CssClass="btn-action-massive">CREATE NOW</asp:LinkButton>
                    </InsertItemTemplate>
                </asp:FormView>
            </div>

            <!-- RIGHT SCROLL: GRIDVIEW + CHART -->
            <div class="right-scroll">
                <div class="table-card">
                    <div class="section-title"><i class="fas fa-database" style="color:#ff4d4d;"></i> Live Database Catalog</div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MOVIEID"
                        DataSourceID="SqlDataSource1" CssClass="gridview-elite" GridLines="None"
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="MOVIEID" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="MOVIETITLE" HeaderText="TITLE" />
                            <asp:BoundField DataField="GENRE" HeaderText="GENRE" />
                            <asp:BoundField DataField="DURATION" HeaderText="MINS" />
                            <asp:TemplateField HeaderText="COMMANDS">
                                <ItemTemplate>
                                    <asp:LinkButton ID="BtnSelect" runat="server" CommandName="Select" CssClass="icon-circle icon-edit-gold"><i class="fas fa-pen-nib"></i></asp:LinkButton>
                                    <asp:LinkButton ID="BtnDelete" runat="server" CommandName="Delete" CssClass="icon-circle icon-delete-ruby" OnClientClick="return confirm('Nuke this record?')"><i class="fas fa-trash-can"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
                <div style="margin-top:40px; background:white; border-radius:50px; padding:40px; text-align:center; box-shadow: 0 30px 60px rgba(0,0,0,0.05);">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="800px" Height="450px" Palette="Fire">
                        <series><asp:Series Name="Series1" XValueMember="MOVIETITLE" YValueMembers="DURATION" ChartType="Column" IsValueShownAsLabel="true" Font="Poppins, 12pt, style=Bold"></asp:Series></series>
                        <chartareas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></chartareas>
                    </asp:Chart>
                </div>
            </div>

            <!-- SQL DATASOURCE -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT MOVIEID, MOVIETITLE, GENRE, DURATION FROM MOVIE"
                DeleteCommand="DELETE FROM MOVIE WHERE MOVIEID = :MOVIEID"
                InsertCommand="INSERT INTO MOVIE (MOVIEID, MOVIETITLE, GENRE, DURATION) VALUES (:MOVIEID, :MOVIETITLE, :GENRE, :DURATION)"
                UpdateCommand="UPDATE MOVIE SET MOVIETITLE = :MOVIETITLE, GENRE = :GENRE, DURATION = :DURATION WHERE MOVIEID = :MOVIEID">
                <DeleteParameters><asp:Parameter Name="MOVIEID" Type="Decimal" /></DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MOVIETITLE" Type="String" />
                    <asp:Parameter Name="GENRE" Type="String" />
                    <asp:Parameter Name="DURATION" Type="Decimal" />
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="MOVIETITLE" Type="String" />
                    <asp:Parameter Name="GENRE" Type="String" />
                    <asp:Parameter Name="DURATION" Type="Decimal" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>

        <!-- JAVASCRIPT FOR ACTIVE NAV LINK -->
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

        <!-- INLINE SERVER LOGIC -->
        <script runat="server">
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    GridView1.DataBind();
                    FormView1.ChangeMode(FormViewMode.ReadOnly);
                    FormView1.DataBind();
                }
            }

            protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
            {
                if (e.Exception != null)
                {
                    pnlMovieException.Visible = true;
                    lblMovieExceptionMsg.Text = "Insert failed: " + e.Exception.Message;
                    e.ExceptionHandled = true;
                }
            }

            protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
            {
                if (e.Exception != null)
                {
                    pnlMovieException.Visible = true;
                    lblMovieExceptionMsg.Text = "Update failed: " + e.Exception.Message;
                    e.ExceptionHandled = true;
                }
            }

            protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
            {
                if (e.Exception != null)
                {
                    pnlMovieException.Visible = true;
                    lblMovieExceptionMsg.Text = "Delete failed: " + e.Exception.Message;
                    e.ExceptionHandled = true;
                }
            }

            protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
            {
                FormView1.PageIndex = GridView1.SelectedIndex;
                FormView1.ChangeMode(FormViewMode.ReadOnly);
                FormView1.DataBind();
            }

            protected void btnCloseMovieError_Click(object sender, EventArgs e)
            {
                pnlMovieException.Visible = false;
            }

            protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
{
    if (!Page.IsValid)
    {
        pnlMovieException.Visible = true;
        lblMovieExceptionMsg.Text = "Please fill all required fields before creating a movie.";
        e.Cancel = true; // prevent insert
        return;
    }

    // Optional: further validation
    try { } 
    catch (Exception ex)
    {
        pnlMovieException.Visible = true;
        lblMovieExceptionMsg.Text = "Insert failed: " + ex.Message;
        e.Cancel = true;
    }
}

protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
{
    if (!Page.IsValid)
    {
        pnlMovieException.Visible = true;
        lblMovieExceptionMsg.Text = "Please fill all required fields before saving changes.";
        e.Cancel = true; // prevent update
        return;
    }

    try { } 
    catch (Exception ex)
    {
        pnlMovieException.Visible = true;
        lblMovieExceptionMsg.Text = "Update failed: " + ex.Message;
        e.Cancel = true;
    }
}

            protected void Application_Start(object sender, EventArgs e)
{
    ScriptManager.ScriptResourceMapping.AddDefinition(
        "jquery",
        new ScriptResourceDefinition
        {
            Path = "~/Scripts/jquery-3.6.0.min.js",         // local path
            DebugPath = "~/Scripts/jquery-3.6.0.js",
            CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js",
            CdnDebugPath = "https://code.jquery.com/jquery-3.6.0.js",
            LoadSuccessExpression = "window.jQuery"
        }
    );
}
        </script>
    </form>
</body>
</html>