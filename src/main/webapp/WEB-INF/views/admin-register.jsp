<!DOCTYPE html>
<html>
<head>
    <title>Register Admin</title>
</head>
<body>
    <h2>Register New Admin</h2>
    <form action="/admin/register" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>
        <label>Password:</label>
        <input type="password" name="password" required><br><br>
        <button type="submit">Register</button>
    </form>
</body>
</html>
