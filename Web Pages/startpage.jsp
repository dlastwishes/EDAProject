<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #48773e;
        }

        #picOne {
            position: absolute;
            display: none;
            width: 250px;
            height: 250px; 
            margin-top: 45%;
            margin-left: 20%;
        }
        #message{
            position: absolute;
            display: none;
            margin-top: 95%;
            margin-left: 30%;
            color: white;
            
        }
    </style>

    <script src="http://code.jquery.com/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#picOne").fadeIn(0).delay(1500).fadeOut(1000);
            $("#message").fadeIn(0).delay(1500).fadeOut(1000);
        });
        function Redirect() {
               window.location="main.jsp";};
               setTimeout('Redirect()', 2500);
    </script>

    <title>EDA</title>
</head>

<body>

    <div id="pics">
        <img src="icon/logo.png" width="100" height="100" id="picOne" />
    </div>
    <div id="message">
        <h1> &nbsp; &nbsp; EDA</h1>
        <p >Emergency Disaster Alert</p>
    </div>
    
    

    <script src="node_modules/jquery/dist/jquery.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
</body>

</html>