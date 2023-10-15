$userName = "Mask"
$newPassword = "asdfg"

$UserAccountInfo = Get-WmiObject -Class Win32_UserAccount -Filter "Name='$userName'" | Select Name, Status, Disabled, Lockout, LocalAccount, PasswordExpires, PasswordChangeable, AccountType

if ($UserAccountInfo.Disabled -eq "True") {
  Write-Host -ForegroundColor Yellow "$userName account has been disabled. Now active it."
  net user $userName /active:yes | Out-Null
}

if ($UserAccountInfo.Lockout -eq "True") {
  Write-Host -ForegroundColor Yellow "$userName account has been locked. Now active it."
  net user $userName /active:yes | Out-Null
}

net user $userName $newPassword
