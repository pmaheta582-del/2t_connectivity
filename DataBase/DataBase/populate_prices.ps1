$mdf = Join-Path $PSScriptRoot "DataBase\App_Data\Database1.mdf"
$conStr = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=$mdf;Integrated Security=True"
$con = New-Object System.Data.SqlClient.SqlConnection($conStr)

try {
    $con.Open()

    # Price mapping by Prod_Id or Prod_Name
    $prices = @{
        1 = "159900"   # iPhone 15 Pro Max
        2 = "79900"    # iPhone 15
        3 = "69900"    # iPhone 14
        4 = "129999"   # Galaxy S24 Ultra
        5 = "154999"   # Galaxy Z Fold5
        6 = "39999"    # Galaxy A55 5G
        7 = "89999"    # Vivo X100 Pro
        8 = "41999"    # Vivo V30 Pro
        9 = "16999"    # Vivo Y200e 5G
        10 = "74999"   # Oppo Find X7 Ultra
        11 = "37999"   # Oppo Reno 11 Pro 5G
        12 = "23999"   # Oppo F25 Pro 5G
        13 = "64999"   # OnePlus 12
        14 = "39999"   # OnePlus 12R
        15 = "24999"   # OnePlus Nord CE4
        16 = "99999"   # Xiaomi 14 Ultra
        17 = "69999"   # Xiaomi 14
        18 = "31999"   # Redmi Note 13 Pro+ 5G
    }

    foreach ($id in $prices.Keys) {
        $uCmd = $con.CreateCommand()
        $uCmd.CommandText = "UPDATE Add_Products_tbl SET Prod_Price = @Price WHERE Prod_Id = @Id"
        $uCmd.Parameters.AddWithValue("@Price", $prices[$id]) | Out-Null
        $uCmd.Parameters.AddWithValue("@Id", $id) | Out-Null
        $uCmd.ExecuteNonQuery() | Out-Null
    }

    # Delete accidental test row 19 if present
    $dCmd = $con.CreateCommand()
    $dCmd.CommandText = "DELETE FROM Add_Products_tbl WHERE Prod_Id > 18 OR Prod_Model IS NULL OR Prod_Img IS NULL"
    $deleted = $dCmd.ExecuteNonQuery()
    if ($deleted -gt 0) {
        Write-Host "Deleted $deleted test/invalid record(s)."
    }

    Write-Host "`n=== CURRENT TABLE DATA IN Add_Products_tbl ==="
    $sCmd = $con.CreateCommand()
    $sCmd.CommandText = "SELECT Prod_Id, Prod_Comp_Id, Prod_Name, Prod_Price, Prod_Model, Prod_Weight, Prod_Img FROM Add_Products_tbl ORDER BY Prod_Id"
    $r = $sCmd.ExecuteReader()
    while ($r.Read()) {
        Write-Host ("ID: " + $r["Prod_Id"] + " | Name: " + $r["Prod_Name"] + " | Price: Rs " + $r["Prod_Price"] + " | Model: " + $r["Prod_Model"])
    }
    $r.Close()

} catch {
    Write-Host "Error: $($_.Exception.Message)"
} finally {
    $con.Close()
}
