Function Start-WinDeployToolkit {

  [cmdletbinding()]  
  Param ()

  Begin {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Verbose "*************************************[Start-WinDeployToolkit]**************************************"

    Write-Debug "***********************************[Started: $([DateTime]::Now)]***********************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug "*********************************************[Begin()]**********************************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

    $SplashScreen = Start-WDTSplashScreen

    $Global:WDT = [hashtable]::Synchronized(@{})

    Write-Verbose "[`$WDTWindow] Init Window..."

    $Workbench = New-WDTWorkbench

    Get-WDTSystemInfo | Wait-RSJob | Remove-RSJob

  }

  Process {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Debug "********************************************[Process()]*********************************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

    Try {

      Stop-WDTSplashScreen

      $MetroShell.Workbench.Window.ShowDialog() | Out-Null

      Write-Verbose "[`$WDTWindow] Show WDT Window..."

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