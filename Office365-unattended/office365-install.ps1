#Downloading and installing O365 with custom config

# Download VDOT
$URL = 'https://github.com/marcelkmfst/avd-0365/raw/main/ODT/configuration-Office365-x86.zip'
$ZIP = 'configuration-Office365-x86.zip'
Invoke-WebRequest -Uri $URL -OutFile $ZIP -ErrorAction 'Stop'

# Extract VDOT from ZIP archive
Expand-Archive -LiteralPath $ZIP -Force -ErrorAction 'Stop'
    
# Download Office365 Files
.\configuration-Office365-X86\setup.exe /download .\configuration-Office365-X86\config-mk-custom.xml 

# Install M365 Files

.\configuration-Office365-X86\setup.exe /configure .\configuration-Office365-X86\config-mk-custom.xml 

