<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Smart Cinema | Elite Management Command</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    
    <style>
        /* 1. THE MASSIVE LIGHT-SHIFT BACKGROUND */
        @keyframes ultraLightShift {
            0% { background: #fff5f5; }      /* Very Light Red */
            25% { background: #fffaf0; }     /* Very Light Orange/Peach */
            50% { background: #fdf2f8; }     /* Very Light Pink */
            75% { background: #fff5f5; }     /* Light Red */
            100% { background: #fffaf0; }    /* Back to Orange */
        }

        @keyframes colorFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes textGradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .command-title {
            font-size: 5rem;
            font-weight: 900;
            margin: 0;
            /* Luxury Tech Gradient */
            background: linear-gradient(-45deg, #ff4d4d, #f472b6, #fb923c, #ec4899);
            background-size: 300% 300%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
    
            /* This makes the color change continuously */
            animation: textGradientFlow 3s ease infinite;
            transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: inline-block;
            cursor: pointer;
        }

        /* 2. THE 3D HOVER EFFECT */
        .command-title:hover {
            transform: scale(1.1) rotateX(12deg) translateY(-10px);
            filter: drop-shadow(0 20px 30px rgba(255, 77, 77, 0.3));
            letter-spacing: 5px;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', 'Segoe UI', system-ui, sans-serif;
            animation: ultraLightShift 8s ease-in-out infinite alternate;
            min-height: 100vh;
            color: #1e293b;
            overflow-x: hidden;
            position: relative;
        }

        /* 2. DYNAMIC LOGO ANIMATION */
        @keyframes logoGlow {
            0% { transform: scale(1) rotate(0deg); filter: drop-shadow(0 0 5px #ff4d4d); }
            50% { transform: scale(1.2) rotate(5deg); filter: drop-shadow(0 0 20px #ff944d); }
            100% { transform: scale(1) rotate(0deg); filter: drop-shadow(0 0 5px #ff4d4d); }
        }

        /* 3. THE ULTIMATE NAVBAR DESIGN --- */
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

        /* 4. HERO SECTION */
        .hero {
            text-align: center;
            padding: 100px 20px 50px;
        }

        .hero h1 {
            font-size: 5rem;
            font-weight: 900;
            margin: 0;
            background: linear-gradient(135deg, #ff4d4d, #ff944d, #f472b6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -3px;
            animation: animate__backInDown 1.2s;
        }

        .hero p {
            font-size: 1.5rem;
            color: #64748b;
            font-weight: 600;
            margin-top: 10px;
            animation: animate__fadeInUp animate__delay-1s;
        }

        /* 5. MASSIVE INTERACTIVE GRID */
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 40px;
            padding: 50px;
            max-width: 1600px;
            margin: auto;
        }

        /* 6. ULTIMATE CARD DESIGN */
        .card {
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(20px);
            border-radius: 50px;
            padding: 60px 40px;
            text-align: center;
            text-decoration: none;
            color: #1e293b;
            border: 1px solid white;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.03);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .card::after {
            content: "";
            position: absolute;
            top: -50%; left: -50%; width: 200%; height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.8) 0%, transparent 70%);
            opacity: 0;
            transition: 0.5s;
        }

        .card:hover {
            transform: translateY(-25px) scale(1.05);
            background: white;
            box-shadow: 0 50px 100px rgba(255, 77, 77, 0.15);
            border-color: #ff944d;
        }

        .card:hover::after { opacity: 1; }

        .card-icon {
            width: 110px;
            height: 110px;
            border-radius: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3.5rem;
            margin-bottom: 30px;
            transition: all 0.6s ease;
            position: relative;
            z-index: 2;
            box-shadow: 0 15px 30px rgba(0,0,0,0.05);
        }

        .card:hover .card-icon {
            transform: rotateY(180deg) scale(1.1);
        }

        .card h3 {
            font-size: 1.8rem;
            font-weight: 800;
            margin: 15px 0;
            z-index: 2;
        }

        .card p {
            font-size: 1.1rem;
            color: #64748b;
            line-height: 1.6;
            z-index: 2;
        }

        /* LOGO & CARD THEMES (Massive Animation) */
        .c-red { color: #ff4d4d; background: #fff1f1; }
        .c-orange { color: #f97316; background: #fff7ed; }
        .c-pink { color: #db2777; background: #fdf2f8; }
        .c-blue { color: #2563eb; background: #eff6ff; }
        .c-green { color: #059669; background: #ecfdf5; }

        /* 7. FOOTER */
        .footer {
            text-align: center;
            padding: 100px 20px;
            color: #94a3b8;
            font-weight: 800;
            letter-spacing: 4px;
            text-transform: uppercase;
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

        <header class="hero" style="perspective: 1000px;">
            <h1 class="command-title animate__animated animate__zoomIn">COMMAND CENTER</h1>
            <p style="letter-spacing: 8px; text-transform: uppercase; font-size: 0.9rem; color: #94a3b8; font-weight: 800; margin-top: 20px;">
                <i class="fas fa-microchip" style="color: #ff4d4d;"></i> Cinema Management System // Control Interface
            </p>
        </header>

        <div class="container">
            
            <a href="UserDetails.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.1s;">
                <div class="card-icon c-red">
                    <i class="fas fa-user-shield"></i>
                </div>
                <h3>User Details</h3>
                <p>Manage administrative profiles, security clearance, and staff identities.</p>
            </a>

            <a href="MovieDetails.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.2s;">
                <div class="card-icon c-orange">
                    <i class="fas fa-photo-film"></i>
                </div>
                <h3>Movie Details</h3>
                <p>Catalog new releases, manage genres, and update movie metadata.</p>
            </a>

            <a href="TicketDetails.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.3s;">
                <div class="card-icon c-pink">
                    <i class="fas fa-ticket"></i>
                </div>
                <h3>Ticket Details</h3>
                <p>Monitor ticket pricing, availability, and transaction history.</p>
            </a>

            <a href="UserTicket.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.4s;">
                <div class="card-icon c-blue">
                    <i class="fas fa-clipboard-user"></i>
                </div>
                <h3>User Ticket Report</h3>
                <p>Generate detailed audit logs of tickets purchased by specific users.</p>
            </a>

            <a href="TheaterCityHallMovie.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.5s;">
                <div class="card-icon c-green">
                    <i class="fas fa-chart-simple"></i>
                </div>
                <h3>Theater Movie Report</h3>
                <p>Analyze performance metrics for movies across different theater locations.</p>
            </a>

            <a href="MovieTheaterOccupancy.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.6s;">
                <div class="card-icon c-red">
                    <i class="fas fa-users-viewfinder"></i>
                </div>
                <h3>Occupancy Report</h3>
                <p>Visual data on theater fill-rates and seating efficiency levels.</p>
            </a>

            <a href="TheaterCityHallDetails.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.7s;">
                <div class="card-icon c-orange">
                    <i class="fas fa-vault"></i>
                </div>
                <h3>Theater/Hall Details</h3>
                <p>Configure physical theater layouts, city locations, and hall capacities.</p>
            </a>

            <a href="ShowtimesDetails.aspx" class="card animate__animated animate__zoomIn" style="animation-delay: 0.8s;">
                <div class="card-icon c-pink">
                    <i class="fas fa-hourglass-start"></i>
                </div>
                <h3>Showtimes</h3>
                <p>Schedule movie screenings and manage time-slot conflicts.</p>
            </a>

        </div>

        <footer class="footer">
            PLATFORM v9.0.0 // DESIGNED FOR PERFECTION // 2026
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