#Create Cert
New-SelfSignedCertificate -Type Custom -Subject "CN=<YOUR ORG>, O=<YOUR ORG>, C=<LOCATION>" -KeyUsage DigitalSignature -FriendlyName "<NAME>" -CertStoreLocation "Cert:\CurrentUser\My" -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")
#View Thumbprint 16BF0172CCE631C4225389184774B6BBBBBEEEBD
Set-Location Cert:\CurrentUser\My
Get-ChildItem | Format-Table Subject, FriendlyName, Thumbprint
#Export to PFX
$password = ConvertTo-SecureString -String <PASSWORD> -Force -AsPlainText 
Export-PfxCertificate -cert "Cert:\CurrentUser\My\16BF0172CCE631C4225389184774B6BBBBBEEEBD" -FilePath <PATH TO>\MSIXCodeSigningCert.pfx -Password $password