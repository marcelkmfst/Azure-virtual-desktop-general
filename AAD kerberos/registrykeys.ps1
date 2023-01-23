# add the mandatory settings for AAD Fslogix to work

New-ItemProperty -Path HKLM:\Software\Policies\Microsoft\AzureADAccount -Name LoadCredKeyFromProfile -PropertyType Dword -Value 1
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters -Name CloudKerberosTicketRetrievalEnabled -PropertyType Dword -Value 1

## RBAC: make sure permissions are configured, Storage Data SMB Share Contributor is required for the users
## NTFS (from a system which is domain joined)
#icacls y: /grant "avdusers@mk101.de:(M)"
#icacls y: /grant "Creator Owner:(OI)(CI)(IO)(M)"
#icacls y: /remove "Authenticated Users"
#icacls y: /remove "Builtin\Users"
## Mount net use * \\samk101avdaadfslogix.file.core.windows.net\fslogixprofiles kOQpF7wTWsTjRNfIi9CcFmb1qy0BINiAsyxHXBy5dvI8fns8Wvw370viqEotKIxZ+b8O5wU3MWOp+AStLd9NFg== /user:Azure\samk101avdaafslogix


# configure Fslogix
New-ItemProperty -Path HKLM:\Software\FSLogix\Profiles -Name Enabled -PropertyType Dword -Value 1
New-ItemProperty -Path HKLM:\Software\FSLogix\Profiles -Name VHDLocations -PropertyType MultiString -Value \\samk101avdaadfslogix.file.core.windows.net\fslogixprofiles
New-ItemProperty -Path HKLM:\Software\FSLogix\Profiles -Name SizeInMBs -PropertyType Dword -Value 22000

# below deletes the local profile and forces the users to use a fslogix profile
New-ItemProperty HKLM:\SOFTWARE\FSLogix\Profiles -Name DeleteLocalProfileWhenVHDShouldApply -PropertyType Dword -Value 1
# only a test
New-Item -ItemType Directory C:\thescriptworked-viaextension


# RDP Shortpath