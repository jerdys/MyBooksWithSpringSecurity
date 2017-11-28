<#macro books_layout title>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${title}</title>
    <link rel="stylesheet" href="/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<nav class="navbar navbar-default">
    <div class="container">
        <ul class="nav navbar-nav">
            <li><a href="/user/profile">Profile</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false">Browse <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/books/genres/classics">Classics</a></li>
                    <li><a href="/books/genres/historical-fiction">Historical Fiction</a></li>
                    <li><a href="/books/genres/mystery">Mystery</a></li>
                    <li><a href="/books/genres/philosophy">Philosophy</a></li>
                    <li><a href="/books/genres/science-fiction">Science Fiction</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="/books/genres/all">All Genres</a></li>
                </ul>
            </li>
            <li><a href="/authors">Authors</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><p class="navbar-text">Signed in as
                <a href="/user/profile" class="navbar-link">${model.user.username}</a></p>
            </li>
            <li><a href="/logout">Logout</a></li>
        </ul>
    </div>
    </div>
</nav>

<#--<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Panel title</h3>
    </div>
    <div class="panel-body">
        Panel content
    </div>
</div>-->

    <#nested >

</body>
</html>
</#macro>