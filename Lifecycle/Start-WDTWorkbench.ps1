Function Start-WDTWorkbench {

  [cmdletbinding()]  
  Param ()

  Begin {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Verbose "***************************************[Start-WDTWorkbench]****************************************"

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

      Write-Verbose "[`$WorkBenchOpen] Show Workbench..."

      $WorkBenchOpen = {
      
        $Global:MetroShell = ($Using:MetroShell)
        
        $MetroShell.Workbench.Window.Dispatcher.Invoke("Normal", [action][scriptblock]::create( { 
      
          $MetroShell.Workbench.Window.ShowDialog()
      
        }))
        
      }

      Start-RSJob -Name "WorkbenchOpen" -ScriptBlock $WorkBenchOpen -ModulesToImport @("MetroShell")

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