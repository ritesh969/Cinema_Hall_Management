<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheaterCityHallMovie.aspx.cs" Inherits="WebApplication2.Frontend.TheaterCityHallMovie" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theater-Movie Analytics | Ultra Management</title>
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

        body {
            margin: 0; padding: 40px;
            font-family: 'Segoe UI', Roboto, sans-serif;
            animation: dynamicBG 15s ease-in-out infinite;
            min-height: 100vh;
        }

        /* --- THE ULTIMATE NAVBAR DESIGN (EXACT SYNC) --- */
        .navbar {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            padding: 10px 40px;
            display: flex; justify-content: space-between; align-items: center;
            border-bottom: 3px solid #ff4d4d;
            position: sticky; top: 0; z-index: 1000;
            box-shadow: 0 15px 35px rgba(255, 77, 77, 0.1);
        }

        .nav-brand { display: flex; align-items: center; gap: 15px; font-size: 2.2rem; font-weight: 900; color: #0f172a; }
        .nav-brand i { 
            color: #ff4d4d; font-size: 2.8rem; 
            animation: rotateAndPulse 4s infinite ease-in-out; 
            filter: drop-shadow(0 0 10px rgba(255, 77, 77, 0.5));
        }

        @keyframes rotateAndPulse {
            0% { transform: scale(1) rotate(0deg); }
            50% { transform: scale(1.2) rotate(15deg); }
            100% { transform: scale(1) rotate(0deg); }
        }

        .nav-links { display: flex; gap: 10px; perspective: 1000px; }
        .nav-links a {
            position: relative; color: #475569; text-decoration: none;
            padding: 15px 22px; border-radius: 20px;
            font-size: 0.85rem; font-weight: 800; text-transform: uppercase;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 2px solid transparent; overflow: hidden;
        }

        .nav-links a:hover {
            color: #fff; background: #ff4d4d;
            transform: translateY(-10px) rotateX(10deg) scale(1.1);
            box-shadow: 0 20px 40px rgba(255, 77, 77, 0.4);
            border-color: #ff944d;
        }

        .nav-links a.active-link {
            background: #0f172a; color: white !important;
            transform: scale(1.05); box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .nav-links a.active-link::after {
            content: ''; position: absolute; bottom: 5px; left: 20%;
            width: 60%; height: 4px; background: #ff4d4d;
            border-radius: 10px; box-shadow: 0 0 10px #ff4d4d;
        }

        .nav-links a:hover::before {
            content: '➔'; position: absolute; left: 5px;
            opacity: 0.5; animation: animate__backInLeft 0.3s;
        }

        /* 2. GLASS CONTAINER */
        .glass-container {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(20px);
            border-radius: 60px; padding: 60px;
            box-shadow: 0 50px 120px rgba(0,0,0,0.08);
            max-width: 1500px; margin: auto;
            border: 2px solid rgba(255,255,255,0.9);
            animation: animate__zoomIn 0.8s;
        }

        /* 3. BUTTONS */
        .btn-universal {
            padding: 18px 45px; border-radius: 50px;
            text-decoration: none; font-weight: 800;
            display: inline-flex; align-items: center; gap: 15px;
            border: none; cursor: pointer; transition: all 0.5s;
        }
        .btn-back-elite { background: #1e293b; color: white !important; }
        .btn-back-elite:hover { background: #ef4444; transform: translateX(-15px) scale(1.1); }

        /* 4. THE ULTRA GRID */
        .ultra-grid { width: 100%; border-collapse: separate; border-spacing: 0 20px; margin: 40px 0; }
        .ultra-grid th { padding: 25px; color: #94a3b8; text-transform: uppercase; letter-spacing: 3px; font-size: 1.1rem; text-align: left; }
        .ultra-grid td { background: #ffffff; padding: 30px; border: none; font-size: 1.3rem; font-weight: 600; box-shadow: 0 10px 30px rgba(0,0,0,0.02); transition: 0.4s; }
        .ultra-grid td:first-child { border-radius: 30px 0 0 30px; border-left: 10px solid #ff4d4d; }
        .ultra-grid td:last-child { border-radius: 0 30px 30px 0; }
        
        .ultra-grid tr:hover { transform: scale(1.02) translateY(-5px); z-index: 50; position: relative; }
        .ultra-grid tr:hover td { background: #fff8f9; color: #ff4d4d; box-shadow: 0 30px 60px rgba(255, 77, 77, 0.1); }

        /* SPECIAL BADGES FOR THIS PAGE */
        .badge-theater { background: #0f172a; color: white; padding: 8px 15px; border-radius: 12px; font-size: 0.9rem; text-transform: uppercase; }
        .badge-hall { background: #f1f5f9; color: #475569; padding: 8px 15px; border-radius: 12px; font-size: 0.9rem; border: 1px solid #e2e8f0; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar animate__animated animate__fadeInDown">
            <div class="nav-brand">
                <i class="fas fa-layer-group"></i>
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
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 50px;">
                <a href="Dashboard.aspx" class="btn-universal btn-back-elite">
                    <i class="fas fa-chevron-left"></i> BACK TO PORTAL
                </a>
                <div style="text-align: center; animation: floatingEffect 5s ease-in-out infinite;">
                    <i class="fas fa-map-location-dot" style="font-size: 5rem; color: #ff4d4d;"></i>
                    <h1 style="font-weight: 900; font-size: 3rem; margin: 10px 0; color: #1e293b;">LOCATION ANALYTICS</h1>
                    <p style="color: #64748b; font-weight: 700; letter-spacing: 2px;">THEATER > HALL > MOVIE MAPPING</p>
                </div>
                <div style="width: 250px;"></div> 
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" CssClass="ultra-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="THEATER & LOCATION">
                        <ItemTemplate>
                            <div class="badge-theater"><i class="fas fa-building"></i> <%# Eval("THEATERNAME") %></div>
                            <div style="margin-top: 10px; font-size: 0.95rem; color: #94a3b8;"><%# Eval("THEATERADDRESS") %></div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="HALL INFO">
                        <ItemTemplate>
                            <div class="badge-hall"><b><%# Eval("HALLNAME") %></b></div>
                            <div style="margin-top: 5px; font-size: 1rem; color: #64748b;">Capacity: <b style="color:#0f172a"><%# Eval("CAPACITY") %></b></div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="MOVIE SCREENING">
                        <ItemTemplate>
                            <div style="color: #ff4d4d; font-weight: 900; font-size: 1.5rem;"><%# Eval("MOVIETITLE") %></div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TIMING">
                        <ItemTemplate>
                            <div style="font-size: 1.1rem; color: #1e293b;"><i class="far fa-calendar-alt"></i> <%# Eval("SHOWDATE", "{0:MMM dd, yyyy}") %></div>
                            <div style="font-size: 1rem; color: #94a3b8; font-weight: 800;">
                                <%# Eval("STARTTIME", "{0:HH:mm}") %> - <%# Eval("ENDTIME", "{0:HH:mm}") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT TH.TheaterName, TH.TheaterAddress, H.HallName, H.Capacity, M.MovieTitle, S.ShowDate, S.StartTime, S.EndTime FROM Theater TH JOIN Booking B ON TH.TheaterID = B.TheaterID JOIN Hall H ON B.HallID = H.HallID JOIN Movie M ON B.MovieID = M.MovieID JOIN ShowTable S ON B.ShowID = S.ShowID ORDER BY TH.TheaterName">
            </asp:SqlDataSource>
        </div>
    </form>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var path = window.location.pathname;
            var page = path.split("/").pop() || "Dashboard.aspx";
            var navLinks = document.querySelectorAll('#mainNav a');

            navLinks.forEach(function (link) {
                if (link.getAttribute('href') === page) {
                    link.classList.add('active-link');
                    link.classList.add('animate__animated', 'animate__pulse');
                }
            });
        });
    </script>
</body>
</html>