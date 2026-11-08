Add-Type -AssemblyName System.Drawing

$imgDir = Join-Path $PSScriptRoot "DataBase\images"
if (!(Test-Path $imgDir)) {
    New-Item -ItemType Directory -Path $imgDir -Force
}

# Clean up older images (emp6.jpg to emp10.jpg)
6..10 | ForEach-Object {
    $oldFile = Join-Path $imgDir "emp$_.jpg"
    if (Test-Path $oldFile) {
        Remove-Item -Path $oldFile -Force -ErrorAction SilentlyContinue
    }
}

$colors = @(
    [System.Drawing.Color]::FromArgb(30, 136, 229),   # Royal Blue
    [System.Drawing.Color]::FromArgb(216, 27, 96),    # Rose Pink
    [System.Drawing.Color]::FromArgb(67, 160, 71),    # Emerald Green
    [System.Drawing.Color]::FromArgb(251, 140, 0),    # Amber Orange
    [System.Drawing.Color]::FromArgb(142, 36, 170)    # Deep Purple
)

# 5 Completely New Employees (None from previous 10)
$employees = @(
    @{ Name="Harshil Dave"; Initials="HD"; Gender="Male"; Email="harshil.dave@gmail.com"; City="Ahmedabad"; Address="12 Shivalik Business Park, Satellite"; Mobile="9879512301"; Image="~/images/emp1.jpg"; Password="123" },
    @{ Name="Tanvi Desai"; Initials="TD"; Gender="Female"; Email="tanvi.desai@gmail.com"; City="Surat"; Address="45 Riverfront Heights, Vesu"; Mobile="9724185296"; Image="~/images/emp2.jpg"; Password="123" },
    @{ Name="Chirag Panchal"; Initials="CP"; Gender="Male"; Email="chirag.panchal@gmail.com"; City="Vadodara"; Address="78 Sayaji Park Avenue, Akota"; Mobile="9638527410"; Image="~/images/emp3.jpg"; Password="123" },
    @{ Name="Kavita Makwana"; Initials="KM"; Gender="Female"; Email="kavita.makwana@gmail.com"; City="Rajkot"; Address="302 Crystal Mall Road, University Road"; Mobile="9408162534"; Image="~/images/emp4.jpg"; Password="123" },
    @{ Name="Meet Bhatt"; Initials="MB"; Gender="Male"; Email="meet.bhatt@gmail.com"; City="Ahmedabad"; Address="504 Iscon Platinum, Bopal"; Mobile="9925041783"; Image="~/images/emp5.jpg"; Password="123" }
)

Write-Host "Creating 5 profile images with initials..."
for ($i = 0; $i -lt $employees.Count; $i++) {
    $emp = $employees[$i]
    $bmp = New-Object System.Drawing.Bitmap(200, 200)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    # Background fill
    $bgColor = [System.Drawing.Color]::FromArgb(245, 247, 250)
    $g.Clear($bgColor)

    # Circle background
    $brush = New-Object System.Drawing.SolidBrush($colors[$i % $colors.Count])
    $g.FillEllipse($brush, 10, 10, 180, 180)

    # Initials Text
    $font = New-Object System.Drawing.Font("Arial", 60, [System.Drawing.FontStyle]::Bold)
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = [System.Drawing.StringAlignment]::Center
    $sf.LineAlignment = [System.Drawing.StringAlignment]::Center

    $rect = New-Object System.Drawing.RectangleF(10, 10, 180, 180)
    $g.DrawString($emp.Initials, $font, $whiteBrush, $rect, $sf)

    $fileName = "emp" + ($i + 1) + ".jpg"
    $filePath = Join-Path $imgDir $fileName
    $bmp.Save($filePath, [System.Drawing.Imaging.ImageFormat]::Jpeg)

    $font.Dispose()
    $whiteBrush.Dispose()
    $brush.Dispose()
    $sf.Dispose()
    $g.Dispose()
    $bmp.Dispose()
    Write-Host "Saved image: $filePath"
}

# Connect to database and update records
Write-Host "`nConnecting to Database..."
$mdf = Join-Path $PSScriptRoot "DataBase\App_Data\Database1.mdf"
$conStr = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=$mdf;Integrated Security=True"
$con = New-Object System.Data.SqlClient.SqlConnection($conStr)
$con.Open()

Write-Host "Deleting all old 10 records from emp_tbl..."
$cmd = $con.CreateCommand()
$cmd.CommandText = "DELETE FROM emp_tbl"
$deleted = $cmd.ExecuteNonQuery()
Write-Host "Deleted $deleted old records."

# Reset Identity to 0 so new records start from ID 1
try {
    $cmd.CommandText = "DBCC CHECKIDENT ('emp_tbl', RESEED, 0)"
    $cmd.ExecuteNonQuery() | Out-Null
    Write-Host "Identity reseeded to 0."
} catch {
    Write-Host "Identity reseed note: $_"
}

Write-Host "`nInserting 5 completely new employee records..."
foreach ($emp in $employees) {
    $insertCmd = $con.CreateCommand()
    $insertCmd.CommandText = "INSERT INTO emp_tbl (Name, Gender, Email, City, Address, Mobile, Image, Password) VALUES (@Name, @Gender, @Email, @City, @Address, @Mobile, @Image, @Password)"
    
    $insertCmd.Parameters.AddWithValue("@Name", $emp.Name) | Out-Null
    $insertCmd.Parameters.AddWithValue("@Gender", $emp.Gender) | Out-Null
    $insertCmd.Parameters.AddWithValue("@Email", $emp.Email) | Out-Null
    $insertCmd.Parameters.AddWithValue("@City", $emp.City) | Out-Null
    $insertCmd.Parameters.AddWithValue("@Address", $emp.Address) | Out-Null
    $insertCmd.Parameters.AddWithValue("@Mobile", $emp.Mobile) | Out-Null
    $insertCmd.Parameters.AddWithValue("@Image", $emp.Image) | Out-Null
    $insertCmd.Parameters.AddWithValue("@Password", $emp.Password) | Out-Null

    $rows = $insertCmd.ExecuteNonQuery()
    Write-Host "Inserted: $($emp.Name)"
}

Write-Host "`n=== VERIFYING INSERTED DATA ==="
$verifyCmd = $con.CreateCommand()
$verifyCmd.CommandText = "SELECT Id, Name, Gender, Email, City, Address, Mobile, Image, Password FROM emp_tbl"
$reader = $verifyCmd.ExecuteReader()
while ($reader.Read()) {
    Write-Host ("ID: " + $reader["Id"] + " | Name: " + $reader["Name"] + " | Gender: " + $reader["Gender"] + " | Email: " + $reader["Email"] + " | City: " + $reader["City"] + " | Address: " + $reader["Address"] + " | Mobile: " + $reader["Mobile"] + " | Image: " + $reader["Image"])
}
$reader.Close()

$con.Close()
Write-Host "`nSuccessfully replaced old 10 records with 5 completely new records!"
