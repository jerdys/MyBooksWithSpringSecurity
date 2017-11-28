<#ftl encoding='UTF-8'>
<head>
    <title>Login</title>

    <link rel="stylesheet" href="../css/style.css">
<#--<link rel="stylesheet" href="../css/style.scss">-->
</head>
<body>
<div class="container">
    <div class="info">
        <h1>Welcome to MyBooks. Please, sign in</h1>
    </div>

    <div class="thumbnail"><img src="https://image.ibb.co/ncfJCm/login_cat.png" alt="kitty" id="round"/></div>
</div>

<#if error??>
<div role="alert">${error}</div>
</#if>

<div class="form">
    <form class="login-form" method="post" action="/login">
        <input type="text" name="login" placeholder="username"/>
        <input type="password" name="password" placeholder="password"/>
        <div class="two-column">
            <div class="single-col">
                <div class="styled-input-container">
                    <div class="styled-input-single">
                        <input type="checkbox" name="fieldset-5" id="checkbox-example-one"/>
                        <label for="checkbox-example-one">remember me</label>
                    </div>
                </div>
            </div>
        </div>
        <button type="submit">log in</button>
        <p class="message">Not registered? <a href="/signup">Create an account</a></p>
    </form>
</div>
</body>