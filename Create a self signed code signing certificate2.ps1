#Create Cert
New-SelfSignedCertificate -Type Custom -Subject "CN=<YOUR ORG>, O=<YOUR ORG>, C=<LOCATION>" -KeyUsage DigitalSignature -FriendlyName "<NAME>" -CertStoreLocation "Cert:\CurrentUser\My" -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")
#Copy the thumbprint GUID and paste into last line in <THUMBPRINT>
Set-Location Cert:\CurrentUser\My
Get-ChildItem | Format-Table Subject, FriendlyName, Thumbprint
#Export to PFX
$password = ConvertTo-SecureString -String <PASSWORD> -Force -AsPlainText 
Export-PfxCertificate -cert "Cert:\CurrentUser\My\<THUMPRINT>" -FilePath c:\temp\\MSIXCodeSigningCert.pfx -Password $password