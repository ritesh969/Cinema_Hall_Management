<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication2.Frontend.Dashboard" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Smart Cinema Dashboard</title>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* Body & Background Animation */
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-45deg, #1d2671, #c33764, #f7b733, #4b6cb7);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 30px;
            height: 70px;
            background: rgba(0,0,0,0.7);
            color: #fff;
            position: sticky;
            top: 0;
            z-index: 999;
        }

        .navbar h1 {
            font-size: 26px;
            margin: 0;
            text-shadow: 2px 2px 5px #000;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            margin-left: 25px;
            font-weight: 600;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: #ffdd00;
            text-shadow: 0 0 10px #ffdd00;
        }

        /* Dashboard Container */
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            padding: 40px;
            max-width: 1400px;
            margin: auto;
        }

        /* Dashboard Card */
        .card {
            background: rgba(255,255,255,0.1);
            border-radius: 20px;
            padding: 35px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            transition: all 0.5s ease;
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(10px);
        }

        .card i {
            font-size: 50px;
            margin-bottom: 20px;
            transition: all 0.5s ease;
        }

        .card div {
            font-size: 20px;
            font-weight: 700;
        }

        /* Hover Effects */
        .card:hover {
            transform: translateY(-15px) rotate(2deg) scale(1.1);
            box-shadow: 0 15px 40px rgba(0,0,0,0.6);
            background: rgba(255,255,255,0.25);
        }

        .card:hover i {
            transform: rotate(-15deg) scale(1.3);
            color: #ffd700;
            text-shadow: 0 0 15px #ffd700;
        }

        /* Responsive */
        @media(max-width: 768px){
            .container{
                grid-template-columns: repeat(auto-fit, minmax(180px,1fr));
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <div class="navbar">
    <h1>🎬 Smart Cinema Dashboard</h1>
    <div>
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
</div>

        <!-- Dashboard Cards -->
        <div class="container">
            <a href="UserDetails.aspx" class="card">
                <i class="fas fa-user"></i>
                <div>User Details</div>
            </a>

            <a href="MovieDetails.aspx" class="card">
                <i class="fas fa-film"></i>
                <div>Movie Details</div>
            </a>

            <a href="TicketDetails.aspx" class="card">
                <i class="fas fa-ticket-alt"></i>
                <div>Ticket Details</div>
            </a>

            <a href="UserTicket.aspx" class="card">
                <i class="fas fa-user-check"></i>
                <div>User Ticket Report</div>
            </a>

            <a href="TheaterCityHallMovie.aspx" class="card">
                <i class="fas fa-building"></i>
                <div>Theater Movie Report</div>
            </a>

            <a href="MovieTheaterOccupancy.aspx" class="card">
                <i class="fas fa-chart-pie"></i>
                <div>Occupancy Report</div>
            </a>

            <a href="TheaterDetails.aspx" class="card">
                <i class="fas fa-map-marker-alt"></i>
                <div>Theater Details</div>
            </a>

            <a href="HallDetails.aspx" class="card">
                <i class="fas fa-door-open"></i>
                <div>Hall Details</div>
            </a>
        </div>
    </form>
</body>
</html>