$osinfo = Get-CimInstance Win32_OperatingSystem
$hwinfo = Get-CimInstance Win32_computersystemproduct
$cpu = Get-CimInstance Win32_Processor
$cpucount = $(if (!$cpu.count) {"1"} else {$cpu.count})
$corecount =  $(if ($cpu.count -gt "1") {$cpu.numberofcores[1]} else {$cpu.numberofcores})

$computer = new-object PSObject -Property @{
    ServerName        = $osinfo.CSName;
    OperatingSystem   = $osinfo.Caption;
    HWName            = $hwinfo.name;
    HWVendor          = $hwinfo.vendor;
    IdentifyingNumber = $hwinfo.IdentifyingNumber;
    cpucount          = $cpucount;
    corecount         = $corecount;


}

$computer
