<# Brent Grant 3/14/2018 #>

 <# Find what version of TLS is running #>
 Get-ChildItem -path HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols | where { $_.Name -match 'TLS 1.0'} 
 Get-ChildItem -path HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols | where { $_.Name -match 'TLS 1.1'} 
 

 <# If the value is TLS 1.0 or 1.1 then Disable those verisons and x&y are just varibles holding TSL versions #>
 $x = 'TLS 1.0'
 $y = 'TLS 1.1'

 <# If and elseif statement to which instruction to run #>

 if($X -eq 'TLS 1.0')

 {

 <# This will disable the verisons of TLS you dont want #>

     New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -Force | Out-Null

     New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
     
     Write-Host 'TLS 1.0 has been disabled.'


  }

   if ($y -eq 'TLS 1.1')
    {

    <# This will disable the verisons of TLS you dont want #>

     New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -Force | Out-Null

     New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client' -name 'DisabledByDefault' -value 1 -PropertyType 'DWord' -Force | Out-Null
    
     Write-Host 'TLS 1.1 has been disabled'

    }

    else
    {
        Write-Host 'TSL 1.0 and 1.1 was not found'
    }

    

    <# This is where I found the information #>
    <# https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/operations/manage-ssl-protocols-in-ad-fs#enable-and-disable-tls-10 #>
    <# https://superuser.com/questions/647208/how-to-find-and-delete-multiple-windows-registry-entries  #>