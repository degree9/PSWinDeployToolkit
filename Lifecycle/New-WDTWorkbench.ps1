Function New-WDTWorkbench {

  [cmdletbinding()]  
  Param ()

  Begin {

    Write-Debug ""

    Write-Debug "****************************************************************************************************"

    Write-Verbose "****************************************[New-WDTWorkbench]*****************************************"

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

      Write-Verbose "[`$SplashScreen] Init Workbench..."

      $XamlTemplate = New-MetroWindow

      Set-MetroTileGrid -XamlTemplate $XamlTemplate -Title "Deployment Toolkit Workbench" | Out-Null

      Set-WDTMediaBuilderTile -XamlTemplate $XamlTemplate | Out-Null

      $Workbench = (Import-WpfGUI -Xaml $XamlTemplate)

      Import-WpfVariables -Name "Workbench" -Xaml $XamlTemplate -Form $Workbench -MetroShell $MetroShell

      Import-WpfHandlers -Name "Workbench"
        
      $MetroShell.Workbench.isClosed = $false

      Return $Workbench

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