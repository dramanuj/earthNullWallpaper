# Most of this script is shamelessly copied from /u/european_impostor's Himawari GitHub codebase
# https://gist.github.com/MichaelPote/92fa6e65eacf26219022


$outpath  = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
$jspath = $outpath + "\phantomjs.exe"

$argpath = "earthnull.js"
# Change $argpath variable to the value below if phantomJS does not download a picture!
# $argpath = $outpath+"\earthnull.js"

Start-Process $jspath -ArgumentList $argpath

$outfile = $outpath +"\earthNullLatest.png" 

<#
 Different settings for the wallpaper:
 
                            Tile :
                                key.SetValue(@"WallpaperStyle", "0") ; 
                                key.SetValue(@"TileWallpaper", "1") ; 
                                break;
                            Center :
                                key.SetValue(@"WallpaperStyle", "0") ; 
                                key.SetValue(@"TileWallpaper", "0") ; 
                                break;
                            Stretch :
                                key.SetValue(@"WallpaperStyle", "2") ; 
                                key.SetValue(@"TileWallpaper", "0") ;
                                break;
                            Fill :
                                key.SetValue(@"WallpaperStyle", "10") ; 
                                key.SetValue(@"TileWallpaper", "0") ; 
                                break;
                            Fit :
                                key.SetValue(@"WallpaperStyle", "6") ; 
                                key.SetValue(@"TileWallpaper", "0") ; 
                                break;
#>


Write-Output "Setting Wallpaper..."
Start-Sleep -s 12
Set-ItemProperty -path "HKCU:Control Panel\Desktop" -name Wallpaper -value ($outpath + $outfile)
Set-ItemProperty -path "HKCU:Control Panel\Desktop" -name WallpaperStyle -value 6
Set-ItemProperty -path "HKCU:Control Panel\Desktop" -name TileWallpaper -value 0
Set-ItemProperty 'HKCU:\Control Panel\Colors' -name Background -Value "0 0 0"
#rundll32.exe user32.dll, UpdatePerUserSystemParameters
Write-Output "$outpath"


$setwallpapersource = @"
using System.Runtime.InteropServices;
public class wallpaper
{
public const int SetDesktopWallpaper = 20;
public const int UpdateIniFile = 0x01;
public const int SendWinIniChange = 0x02;
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
private static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
public static void SetWallpaper ( string path )
{
SystemParametersInfo( SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange );
}
}
"@
Add-Type -TypeDefinition $setwallpapersource
[wallpaper]::SetWallpaper(($outfile))


Write-Output "Done"


