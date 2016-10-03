Function Stop-WDTSplashScreen {

  [cmdletbinding()]  
  Param ()

  Begin {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Verbose "**************************************[Stop-SplashScreen]****************************************"

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

      Write-Verbose "[`$SplashScreen] Destruct SplashScreen..."

      $SplashClose = {
      
        $Global:MetroShell = ($Using:MetroShell)
        
        [System.Threading.Monitor]::Enter($MetroShell.SyncRoot)
      
        $MetroShell.SplashScreen.Window.Dispatcher.Invoke("Normal", [action][scriptblock]::create( { 
      
          $MetroShell.SplashScreen.Window.Close()
      
        }))

        $MetroShell.SplashScreen.isClosed = $true
        
        [System.Threading.Monitor]::Exit($MetroShell.SyncRoot)
      
      }

      $SplashScreenClose = Start-RSJob -Name "SplashScreenClose" -ScriptBlock $SplashClose -ModulesToImport @("MetroShell")
      
      $SplashScreenClose | Wait-RSJob | Remove-RSJob

      Get-RSJob -Name "SplashScreen" | Wait-RSJob | Remove-RSJob

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