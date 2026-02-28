<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTicket.aspx.cs" Inherits="WebApplication2.Frontend.UserTicket" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>User Ticket Report | Alpha Cinema</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

    <style>
        /* 1. DYNAMIC LIGHT SHIFT BACKGROUND */
        @keyframes ultraLightShift {
            0% { background: #fff5f5; }      /* Light Red */
            25% { background: #fffaf0; }     /* Light Orange */
            50% { background: #fdf2f8; }     /* Light Pink */
            75% { background: #fff5f5; }     /* Back to Red */
            100% { background: #fffaf0; }
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', 'Segoe UI', sans-serif;
            animation: ultraLightShift 10s ease-in-out infinite alternate;
            min-height: 100vh;
            color: #1e293b;
            overflow-x: hidden;
        }

        /* 2. ELITE GLASS NAVBAR */
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

        /* 3. MAIN CONTAINER */
        .container {
            max-width: 1500px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(25px);
            padding: 40px;
            border-radius: 40px;
            border: 1px solid white;
            box-shadow: 0 30px 60px rgba(0,0,0,0.05);
            animation: animate__fadeInUp 1s;
        }

        /* 4. STYLISH TOP AREA & BACK BUTTON */
        .top-area {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 40px;
        }

        .btn-back {
            background: white;
            color: #ff4d4d;
            padding: 12px 25px;
            border-radius: 18px;
            text-decoration: none;
            font-weight: 800;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: all 0.5s;
            border: 2px solid #ff4d4d;
            box-shadow: 0 5px 15px rgba(255, 77, 77, 0.1);
        }

        .btn-back:hover {
            background: #ff4d4d;
            color: white;
            transform: translateX(-10px);
            box-shadow: 0 10px 25px rgba(255, 77, 77, 0.3);
        }

        .page-title {
            width: 100%;
            text-align: center;
        }

        .page-title h2 {
            font-size: 2.5rem;
            font-weight: 900;
            background: linear-gradient(135deg, #ff4d4d, #f472b6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin: 0;
        }

        .page-title p {
            color: #64748b;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 3px;
        }

        /* 5. MASSIVE GRIDVIEW STYLING */
        .gridview-container {
            overflow-x: auto;
            border-radius: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
        }

        .gridview {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
            border: none;
        }

        .gridview th {
            background: #1e293b;
            color: white;
            padding: 20px;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
            text-align: left;
        }

        .gridview th:first-child { border-radius: 15px 0 0 15px; }
        .gridview th:last-child { border-radius: 0 15px 15px 0; }

        .gridview tr {
            transition: all 0.4s;
            background: white;
        }

        .gridview td {
            padding: 20px;
            border: none;
            color: #475569;
            font-weight: 600;
            border-top: 1px solid #f1f5f9;
            border-bottom: 1px solid #f1f5f9;
        }

        .gridview tr:hover {
            transform: scale(1.02) translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            z-index: 10;
            position: relative;
        }

        .gridview tr:hover td {
            background: #fffafa;
            color: #ff4d4d;
            border-color: #ffeded;
        }

        /* Status Badge Styling */
        .status-badge {
            padding: 6px 15px;
            border-radius: 10px;
            font-size: 0.75rem;
            font-weight: 900;
            text-transform: uppercase;
        }

        /* 6. FOOTER */
        .footer {
            text-align: center;
            padding: 50px;
            color: #94a3b8;
            font-weight: 700;
            font-size: 0.8rem;
            letter-spacing: 2px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">

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

        <div class="container animate__animated animate__zoomIn">

            <div class="top-area">
                <a href="Dashboard.aspx" class="btn-back">
                    <i class="fas fa-chevron-left"></i> BACK TO DASHBOARD
                </a>
                
                <div class="page-title">
                    <h2>User Ticket Analytics</h2>
                    <p>6-Month Purchase History Report</p>
                </div>
            </div>

            <div class="gridview-container">
                <asp:GridView ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="USERID,BOOKINGID,TICKETID"
                    DataSourceID="SqlDataSource1"
                    CssClass="gridview"
                    GridLines="None">

                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="UID" ItemStyle-Width="50px"/>
                        <asp:TemplateField HeaderText="Customer Details">
                            <ItemTemplate>
                                <div style="font-weight:900; color:#1e293b;"><%# Eval("USERNAME") %></div>
                                <div style="font-size:0.8rem; color:#94a3b8;"><%# Eval("EMAIL") %></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BOOKINGID" HeaderText="Booking Ref"/>
                        <asp:BoundField DataField="BOOKINGDATE" HeaderText="Date Purchased" DataFormatString="{0:MMM dd, yyyy}"/>
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie Selection" ItemStyle-Font-Bold="true"/>
                        <asp:BoundField DataField="TICKETNUMBER" HeaderText="Seat Num"/>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class="status-badge" style='<%# Eval("TICKETSTATUS").ToString() == "Active" ? "background:#ecfdf5; color:#059669;" : "background:#fff1f1; color:#ff4d4d;" %>'>
                                    <%# Eval("TICKETSTATUS") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="
                SELECT 
                    U.UserID,
                    U.UserName,
                    U.Email,
                    B.BookingID,
                    B.BookingDate,
                    M.MovieTitle,
                    T.TicketID,
                    T.TicketNumber,
                    T.IssueDate,
                    T.TicketStatus
                FROM UserTable U
                JOIN UserBooking UB ON U.UserID = UB.UserID
                JOIN Booking B ON UB.BookingID = B.BookingID
                JOIN Movie M ON B.MovieID = M.MovieID
                JOIN BookingSeat BS ON B.BookingID = BS.BookingID
                JOIN Seat S ON BS.SeatID = S.SeatID
                JOIN Ticket T ON S.TicketID = T.TicketID
                WHERE B.BookingDate >= ADD_MONTHS(SYSDATE, -6)
                ORDER BY B.BookingDate DESC">
            </asp:SqlDataSource>

        </div>

        <footer class="footer">
            GENERATE AUDIT LOG // ALPHA CINEMA SECURE // 2026
        </footer>
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
</body>
</html>