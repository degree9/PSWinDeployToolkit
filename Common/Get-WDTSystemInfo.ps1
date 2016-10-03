Function Get-WDTSystemInfo {

  [cmdletbinding()]  
  Param ($computer = "localhost")

  Begin {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Verbose "**************************************[Get-WDTSystemInfo]******************************************"

    Write-Debug "***********************************[Started: $([DateTime]::Now)]***********************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug "*********************************************[Begin()]**********************************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

    $WMIClasses = @("Win32_Fan",
                    "Win32_HeatPipe",
                    "Win32_Refrigeration",
                    "Win32_TemperatureProbe",
                    "Win32_Keyboard",
                    "Win32_PointingDevice")

  }

  Process {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Debug "********************************************[Process()]*********************************************"

    Write-Debug "****************************************************************************************************"

    Write-Debug ""

    Try {

      Write-Verbose "[`$GatherInfo] Gathering System Information..."

      $GatherInfo = { 

        $Global:WDT = ($Using:WDT)

        $computer = ($Using:computer)

        [System.Threading.Monitor]::Enter($WDT.SyncRoot)

        If (!$WDT.ContainsKey($computer)) {

          $WDT[$computer] = @{}

        }

        $WDT[$computer][$_] = Get-WmiObject -Class $_ -ComputerName $computer

        [System.Threading.Monitor]::Exit($WDT.SyncRoot)
    
      }

      $WMIClasses | Start-RSJob -Name {$_} -ScriptBlock $GatherInfo 


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