Function Start-WDTSplashScreen {

  [cmdletbinding()]  
  Param ()

  Begin {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Verbose "************************************[Start-WDTSplashScreen]****************************************"

    Write-Debug "***********************************[Started: $([DateTime]::Now)]***********************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug "*********************************************[Begin()]**********************************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

  }

  Process {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Debug "********************************************[Process()]*********************************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

    Try {

      Write-Verbose "[`$SplashScreen] Init Splash Screen..."

      $SplashCreate = { 

        $Global:MetroShell = ($Using:MetroShell)

        $XamlTemplate = New-MetroWindow

        Set-MetroSplashScreen -XamlTemplate $XamlTemplate | Out-Null

        $SplashScreen = (Import-WpfGUI -Xaml $XamlTemplate)

        Import-WpfVariables -Name "SplashScreen" -Xaml $XamlTemplate -Form $SplashScreen -MetroShell $MetroShell

        $MetroShell.SplashScreen.isClosed = $false

        $SplashScreen.ShowDialog() | Out-Null

        While ($MetroShell.SplashScreen.isClosed -eq $false) { Start-Sleep -Seconds 1 }
    
      }

      Start-RSJob -Name "SplashScreen" -ScriptBlock $SplashCreate -ModulesToImport @("MetroShell")

    }
    Catch {

      Write-Error "$($_.Exception)"

      Break

    }

  }

  End {

    Write-Debug ""
    
    Write-Debug "****************************************************************************************************"

    Write-Debug "**********************************************[End()]***********************************************"

    Write-Debug "***********************************[Finished: $([DateTime]::Now)]**********************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

  }

}