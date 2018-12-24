
param( [string]$paramString )


$Sites=Get-Website

$parent=(get-item $paramString ).Directory.FullName #get directory name from argument

$parent=$parent.Replace("/","\")#replace /s with \s so to compare file path values



foreach ($Site in $Sites) {            

    $obj = New-Object -Type PSObject -Property (            
     @{            
      "Name"  = $Site.Name;            
      "PhysicalPath" = $Site.PhysicalPath;            
            
     }            
    )            
   
    #Write-Output $obj.PhysicalPath      
if($obj.PhysicalPath -eq $parent) #physical path of website matches we know we have the right website
   {$sitename=$obj.Name}

}
#Write-Output $sitename

$FileName = Split-Path $paramString -Leaf #extract name of file
$url="http://"+$sitename+"/"+$FileName
Write-Output $url


& "C:\Program Files\Internet Explorer\iexplore.exe" $url     



 
  

  