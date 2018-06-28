# Solution parameters
$SolutionPrefix = "habitathome"
$SitePostFix = "dev.local"
$webroot = "C:\websites\habitathome"
$SitecoreVersion = "9.0.1 rev. 171219"
$InstallerVersion = "1.2.1"

# Assets and prerequisites
$AssetsRoot = "$PSScriptRoot\assets"
$AssetsPSRepository = "https://sitecore.myget.org/F/sc-powershell/api/v2/"
$AssetsPSRepositoryName = "SitecoreGallery"

$global:DEPLOYMENT_DIRECTORY=Split-Path $MyInvocation.MyCommand.Path
$modulesPath=( Join-Path -Path $DEPLOYMENT_DIRECTORY -ChildPath ".\Modules" )
if ($env:PSModulePath -notlike "*$modulesPath*")
{
    $p = $env:PSModulePath + ";" + $modulesPath
    [Environment]::SetEnvironmentVariable("PSModulePath",$p)
}

Write-Host "Deployment directory : "+ $global:DEPLOYMENT_DIRECTORY -ForegroundColor Green
Write-Host "modulesPath : " + $modulesPath -ForegroundColor Green

$LicenseFile = "$AssetsRoot\license.xml"

# Certificates
$CertPath = Join-Path "$AssetsRoot" "Certificates"

# SQL Parameters
$SqlServer = "localhost"
$SqlAdminUser = "sa"
$SqlAdminPassword = "Passw0rd1"

# XConnect Parameters
$XConnectConfiguration = "$AssetsRoot\xconnect-xp0.json"
$XConnectCertificateConfiguration = "$AssetsRoot\xconnect-createcert.json"
$XConnectSolrConfiguration = "$AssetsRoot\xconnect-solr.json"
$XConnectPackage = "$AssetsRoot\Sitecore $SitecoreVersion (OnPrem)_xp0xconnect.scwdp.zip"
$XConnectSiteName = "${SolutionPrefix}_xconnect.$SitePostFix"
$XConnectCert = "$SolutionPrefix.$SitePostFix.xConnect.Client"
$XConnectSqlCollectionUser = "sa"
$XConnectSqlCollectionPassword = "Passw0rd1"
$XConnectInstallationPath = Join-Path $webroot -ChildPath $XConnectSiteName

# Sitecore Parameters
$SitecoreSolrConfiguration = "$AssetsRoot\sitecore-solr.json"
$SitecoreConfiguration = "$AssetsRoot\sitecore-xp0.json"
$SitecoreSSLConfiguration = "$PSScriptRoot\certificates\sitecore-ssl.json"
$SitecorePackage = "$AssetsRoot\Sitecore $SitecoreVersion (OnPrem)_single.scwdp.zip"
$SitecoreSiteName = "$SolutionPrefix.$SitePostFix"
$SitecoreInstallationPath = Join-Path $webroot -ChildPath $SitecoreSiteName

# Solr Parameters
$SolrUrl = "https://localhost:8983/solr"
$SolrRoot = "C:\Solr-6.6.2"
$SolrService = "SOLR"
$SiteUtilitiesSrc = ( Join-Path -Path $DEPLOYMENT_DIRECTORY -ChildPath "\SiteUtilityPages" )	
$PowerShellExtensionsModuleFullPath = "$AssetsRoot\Sitecore PowerShell Extensions-4.7.2 for Sitecore 8.zip"
$SXAModuleFullPath = "$AssetsRoot\Sitecore Experience Accelerator 1.6 rev. 180103 for 9.0.zip"
$DEFModuleFullPath = "$AssetsRoot\Data Exchange Framework 2.0.1 rev. 180108.zip"
$SCProviderDEFModuleFullPath = "$AssetsRoot\Sitecore Provider for Data Exchange Framework 2.0.1 rev. 180108.zip"
$SQLProviderDEFModuleFullPath = "$AssetsRoot\SQL Provider for Data Exchange Framework 2.0.1 rev. 180108.zip"
$XconnectProviderDEFModuleFullPath = "$AssetsRoot\xConnect Provider for Data Exchange Framework 2.0.1 rev. 180108.zip"
$MSDynamicsDEFModuleFullPath = "$AssetsRoot\Dynamics Provider for Data Exchange Framework 2.0.1 rev. 180108.zip"
$SCConnectMSDynamicsModuleFullPath = "$AssetsRoot\Connect for Microsoft Dynamics 2.0.1 rev. 180108.zip"
