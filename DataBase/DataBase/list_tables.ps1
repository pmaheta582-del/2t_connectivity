$mdf = Join-Path $PSScriptRoot "DataBase\App_Data\Database1.mdf"
$conStr = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=$mdf;Integrated Security=True"
$con = New-Object System.Data.SqlClient.SqlConnection($conStr)
$con.Open()

$cmd = $con.CreateCommand()
$cmd.CommandText = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'"
$tables = @()
$r = $cmd.ExecuteReader()
while ($r.Read()) {
    $tables += $r[0]
}
$r.Close()

foreach ($tbl in $tables) {
    $countCmd = $con.CreateCommand()
    $countCmd.CommandText = "SELECT COUNT(*) FROM [$tbl]"
    $cnt = $countCmd.ExecuteScalar()
    Write-Host "$tbl : $cnt rows"
}

$con.Close()
